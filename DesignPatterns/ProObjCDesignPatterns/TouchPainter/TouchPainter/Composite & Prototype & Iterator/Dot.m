//
//  Dot.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/28.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Dot.h"

@implementation Dot

@synthesize color = _color, size = _size;


- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    [visitor visitDot:self];
}

#pragma mark - An Extended Direct-draw Example
// for a direct draw example
- (void)drawWithContext:(CGContextRef)context {
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGFloat frameSize = self.size;
    CGRect frame = CGRectMake(x, y, frameSize, frameSize);
    
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    CGContextFillEllipseInRect(context, frame);
}


#pragma mark - <NSCoping>
- (id)copyWithZone:(NSZone *)zone {
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    
    dotCopy.size = self.size;
    dotCopy.color = [UIColor colorWithCGColor:self.color.CGColor];
    
    
    return dotCopy;
}

#pragma mark - NSCoder methods
- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _color = [coder decodeObjectForKey:@"DotColor"];
        _size = [coder decodeFloatForKey:@"DotSize"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    
    [coder encodeObject:_color forKey:@"DotColor"];
    [coder encodeFloat:_size forKey:@"DotSize"];
}

@end
