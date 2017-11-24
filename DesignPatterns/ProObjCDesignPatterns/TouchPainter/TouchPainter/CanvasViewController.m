//
//  CanvasViewController.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/28.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "CanvasViewController.h"
#import "CanvasViewGenerator.h"
#import "BrandingFactory.h"
#import "Scribble.h"
#import "Stroke.h"
#import "Dot.h"

#import "CoordinatingController.h"

#import "Stack.h"
#import "CustomBarButtonItem.h"
#import "DrawScribbleCommand.h"
#import "DeleteScribbleCommand.h"
#import "SaveScribbleCommand.h"

#define USE_NS_UNDO_MANAGER      0
#define STACK_CAPACITY           10

@interface CanvasViewController ()

@property (nonatomic, strong) CanvasView *canvasView;
@property (nonatomic, assign) CGPoint startPoint;

#if !USE_NS_UNDO_MANAGER
@property (nonatomic, strong) Stack *undoStack;
@property (nonatomic, strong) Stack *redoStack;
#endif

@end

@implementation CanvasViewController


#pragma mark - Life cycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}


- (void)commonInit {
    _strokeColor = [UIColor blackColor];
    _strokeSize = 5;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.scribble == nil) {
        self.scribble = [[Scribble alloc] init];
    }
    
    [self addSubviews];
    
}

- (void)addSubviews {
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] initWithStyle:CanvasViewStyleCloth];
    
    self.canvasView = [defaultGenerator canvasViewWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 436)];
    self.canvasView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.canvasView];
    
    BrandingFactory *factory = [BrandingFactory factoryWithBrand:BrandNameAcme];
    UIView *view = [factory brandedViewWithFrame:CGRectZero];
    UIButton *button = [factory brandedMainButtonWithFrame:CGRectZero];

    CGFloat toolBarHeight = 49;
    CGRect frame = CGRectMake(0, self.view.bounds.size.height - toolBarHeight, self.view.bounds.size.width, toolBarHeight);
    UIToolbar *toolBar = [factory brandedToolBarWithFrame:frame];
    toolBar.backgroundColor = [UIColor cyanColor];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:toolBar];
    
    CustomBarButtonItem *deleteItem = [[CustomBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(didSelectDeleteButton:)];
    deleteItem.command = [[DeleteScribbleCommand alloc] init];
    CustomBarButtonItem *saveItem = [[CustomBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"save"] style:UIBarButtonItemStylePlain target:self action:@selector(didSelectSaveButton:)];
    saveItem.command = [[SaveScribbleCommand alloc] init];
    CustomBarButtonItem *openItem = [[CustomBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"open"] style:UIBarButtonItemStylePlain target:self action:@selector(didSelectOpenButton)];
    CustomBarButtonItem *settingItem = [[CustomBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"palette"] style:UIBarButtonItemStylePlain target:self action:@selector(didSelectSettingButton)];
    CustomBarButtonItem *undoItem = [[CustomBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"undo"] style:UIBarButtonItemStylePlain target:self action:@selector(didSelectUndoButton)];
    CustomBarButtonItem *redoItem = [[CustomBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"redo"] style:UIBarButtonItemStylePlain target:self action:@selector(didSelectRedoButton)];
    CustomBarButtonItem *spacingItem = [[CustomBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
    [toolBar setItems:@[deleteItem, spacingItem, saveItem, spacingItem, openItem, spacingItem, settingItem, spacingItem, undoItem, spacingItem, redoItem]];
}


#pragma mark - Setter
- (void)setScribble:(Scribble *)scribble {
    if (scribble != _scribble) {
        
        _scribble = scribble;
        
        [scribble addObserver:self
                   forKeyPath:NSStringFromSelector(@selector(mark))
                      options:NSKeyValueObservingOptionInitial |
                              NSKeyValueObservingOptionNew
                      context:nil];
    }
}

#pragma mark - Action

- (void)didSelectDeleteButton:(CustomBarButtonItem *)sender  {
    [sender.command execute];
}

- (void)didSelectSaveButton:(CustomBarButtonItem *)sender {
    [sender.command execute];
}

- (void)didSelectOpenButton {
    [[CoordinatingController sharedInstance] requestViewTransitionWithTarget:CoordinatingTargetThumbnail
                                                                      params:nil];
}

- (void)didSelectSettingButton {
    
    NSDictionary *params = self.strokeColor ? @{@"strokeCOlor" : self.strokeColor} : @{};
    [[CoordinatingController sharedInstance] requestViewTransitionWithTarget:CoordinatingTargetPalette
                                                                      params:params];
}

- (void)didSelectUndoButton {
#if USE_NS_UNDO_MANAGER
    [self.undoManager undo];
#else
    [self undoCommand];
#endif
}

- (void)didSelectRedoButton {
#if USE_NS_UNDO_MANAGER
    [self.undoManager redo];
#else
    [self redoCommand];
#endif
}


#pragma mark - Touch Event Handlers
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.startPoint = [touches.anyObject locationInView:self.canvasView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [touches.anyObject previousLocationInView:self.canvasView];
    
    // 如果这是手指的拖动，就像涂鸦添加一个线条
    if (CGPointEqualToPoint(lastPoint, self.startPoint)) {
        id <Mark> newStroke = [[Stroke alloc] init];
        newStroke.color = self.strokeColor;
        newStroke.size = self.strokeSize;
//        [self.scribble addMark:newStroke shouldAddToPreviousMark:NO];

#if USE_NS_UNDO_MANAGER
        // 给绘图命令设置参数
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&newStroke atIndex:2];
        
        // 给撤销绘图命令设置参数
        NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&newStroke atIndex:2];
        
        // 执行带有撤销命令的绘图命令
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
#else
        DrawScribbleCommand *command = [[DrawScribbleCommand alloc] init];
        command.userInfo = @{ScribbleObjectUserInfoKey : self.scribble,
                             MarkObjectUserInfoKey : newStroke,
                             AddToPreviousMarkUserInfoKey : @(NO)
                             };
        [self executeCommand:command prepareForUndo:YES];
        
#endif
    }
    
    // 把当前触摸点作为顶点添加到临时线条
    CGPoint thisPoint = [touches.anyObject locationInView:self.canvasView];
    Vertex *vertex = [[Vertex alloc] initWithLocation:thisPoint];
    [self.scribble addMark:vertex shouldAddToPreviousMark:YES]; // 顶点绘制不需要撤销
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint lastPoint = [touches.anyObject previousLocationInView:self.canvasView];
    CGPoint thisPoint = [touches.anyObject locationInView:self.canvasView];
    
    // 如果触摸从未移动，就向现有的 Stroke 组合体添加一个点，否则就将它作为最后一个顶点添加到临时线条
    if (CGPointEqualToPoint(lastPoint, thisPoint)) {
        
        Dot *singleDot = [[Dot alloc] initWithLocation:thisPoint];
        singleDot.color = self.strokeColor;
        singleDot.size = self.strokeSize;
//        [self.scribble addMark:singleDot shouldAddToPreviousMark:NO];
        
#if USE_NS_UNDO_MANAGER
        // 给绘图命令设置参数
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&singleDot atIndex:2];
        
        // 给撤销绘图命令设置参数
        NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&singleDot atIndex:2];
        
        // 执行带有撤销命令的绘图命令
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
        
#else
        DrawScribbleCommand *command = [[DrawScribbleCommand alloc] init];
        command.userInfo = @{ScribbleObjectUserInfoKey : self.scribble,
                             MarkObjectUserInfoKey : singleDot,
                             AddToPreviousMarkUserInfoKey : @(NO)
                             };
        [self executeCommand:command prepareForUndo:YES];
        
#endif
    }
    
    // 重置起点
    self.startPoint = CGPointZero;
    
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.startPoint = CGPointZero;
}

#pragma mark - Draw Scribble Methods

#if USE_NS_UNDO_MANAGER
// 执行带有撤销操作的命令
- (void)executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvocation {
    [invocation retainArguments];
    
    // 注册撤销操作
    [[self.undoManager prepareWithInvocationTarget:self] unexecuteInvocation:undoInvocation withRedoInvocation:invocation];
    
    // 执行命令
    [invocation invoke];
}

// 执行带有重做操作的撤销命令
- (void)unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation {
    
    // 注册重做操作
    [[self.undoManager prepareWithInvocationTarget:self] executeInvocation:redoInvocation withUndoInvocation:invocation];
    
    // 执行撤销命令
    [invocation invoke];
}

#pragma mark - Invocation
- (NSInvocation *)drawScribbleInvocation {
    
    NSMethodSignature *executeMethodSignature = [self.scribble methodSignatureForSelector:@selector(addMark:shouldAddToPreviousMark:)];
    NSInvocation *drawInvocation = [NSInvocation invocationWithMethodSignature:executeMethodSignature];
    drawInvocation.target = self.scribble;
    drawInvocation.selector = @selector(addMark:shouldAddToPreviousMark:);
    BOOL attachToPreviousMark = NO;
    [drawInvocation setArgument:&attachToPreviousMark atIndex:3]; // 设置参数，从 0 开始，0 和 1 的默认值是 self 和 _cmd
    
    return drawInvocation;
}

- (NSInvocation *)undrawScribbleInvocation {
    
    NSMethodSignature *unexecuteMethodSignature = [self.scribble methodSignatureForSelector:@selector(removeMark:)];
    NSInvocation *undrawInvocation = [NSInvocation invocationWithMethodSignature:unexecuteMethodSignature];
    undrawInvocation.target = self.scribble;
    undrawInvocation.selector = @selector(removeMark:);
    
    return undrawInvocation;
}

#else

- (void)executeCommand:(Command *)command prepareForUndo:(BOOL)prepareForUndo {
    if (command == nil) {
        return;
    }
    
    if (prepareForUndo) {
        if (self.undoStack == nil) {
            self.undoStack = [[Stack alloc] initWithCapacity:STACK_CAPACITY];
        }
        
        // 如果撤销栈满了，就丢掉栈底的元素
        if (self.undoStack.count == STACK_CAPACITY) {
            [self.undoStack dropBottom];
        }
        
        // 把命令压入撤销栈
        [self.undoStack push:command];
    }
    
    [command execute];
}

- (void)undoCommand {
    // 撤销
    Command *command = [self.undoStack pop];
    if (command == nil) {
        return;
    }
    [command undo];
    
    if (self.redoStack == nil) {
        self.redoStack = [[Stack alloc] initWithCapacity:STACK_CAPACITY];
    }
    
    // 把命令压入重做栈
    [self.redoStack push:command];
}

- (void)redoCommand {
    // 重做
    Command *command = [self.redoStack pop];
    if (command == nil) {
        return;
    }
    [command execute];
    
    // 把命令压入撤销栈
    [self.undoStack push:command];
}

#endif

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:[Scribble class]] && [keyPath isEqualToString:NSStringFromSelector(@selector(mark))]) {
        self.canvasView.mark = self.scribble.mark;
        [self.canvasView setNeedsDisplay];
    }
}

@end
