//
//  TFTutorialManager.h
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//
#import "TFTutorialView.h"

#import <Foundation/Foundation.h>

@interface TFTutorialManager : NSObject

+ (TFTutorialManager *)sharedInstance;

- (BOOL)shouldDisplayTutorialWithName:(NSString *)name;

- (TFTutorialView *)addTutorialViewWithClassName:(NSString *)class_name;

@end
