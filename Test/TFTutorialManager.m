//
//  TFTutorialManager.m
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#import "TFTutorialManager.h"

@interface TFTutorialManager ()

@end

@implementation TFTutorialManager

+ (TFTutorialManager *)sharedInstance {
    static TFTutorialManager *instance = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TFTutorialManager alloc]init];
    });
    return instance;
}

- (BOOL)shouldDisplayTutorialWithName:(NSString *)name {
  return ![TFTutorialView tutorialHasDisplayBeforeWithVersion:@"1.0" name:name];
}

- (TFTutorialView *)addTutorialViewWithClassName:(NSString *)class_name {
    TFTutorialView *tutorialView = [[TFTutorialView alloc]initWithClassName:class_name];
    return tutorialView;
}

@end
