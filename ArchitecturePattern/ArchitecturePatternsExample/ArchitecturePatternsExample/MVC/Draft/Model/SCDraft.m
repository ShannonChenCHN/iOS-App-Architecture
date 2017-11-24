//
//  SCDraft.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCDraft.h"

@implementation SCDraft

- (instancetype)initWithDraftId:(NSString *)draftId {
    
    
    if (self = [super init]) {
        self.draftId = draftId;
        self.draftTitle = [NSString stringWithFormat:@"draftTitle%@", draftId];
        self.draftSummary = [NSString stringWithFormat:@"draftSummary%@", draftId];
        self.editDate = [[NSDate date] timeIntervalSince1970] + arc4random() % 200;
    }
    
    return self;
}

@end
