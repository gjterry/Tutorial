//
//  TFTutorialController.h
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFTutorialController : NSObject

- (void)tutorialCheckWithIdentifier:(NSString *)identifier
                   beforeCompletion:(void (^)(BOOL isBeforeCompletion))callback;

@end
