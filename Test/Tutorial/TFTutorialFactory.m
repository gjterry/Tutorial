//
//  TFTutorialFactory.m
//  Test
//
//  Created by Terry  on 14-6-12.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#import "TFTutorialFactory.h"

@implementation TFTutorialFactory

+ (TFTutorialView *)addTutorialViewWithClassName:(NSString *)class_name {
    TFTutorialView *tutorialView = [[TFTutorialView alloc]initWithClassName:class_name];
    return tutorialView;
}

@end
