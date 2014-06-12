//
//  TFTutorialFactory.h
//  Test
//
//  Created by Terry  on 14-6-12.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//
#import "TFTutorialView.h"

#import <Foundation/Foundation.h>

@interface TFTutorialFactory : NSObject

+ (TFTutorialView *)addTutorialViewWithClassName:(NSString *)class_name;

@end
