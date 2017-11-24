//
//  SCDraft.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCDraft : NSObject


- (instancetype)initWithDraftId:(NSString *)draftId;

@property (copy, nonatomic) NSString *draftTitle;
@property (copy, nonatomic) NSString *draftSummary;
@property (copy, nonatomic) NSString *draftId;
@property (assign, nonatomic) NSUInteger editDate;

@end
