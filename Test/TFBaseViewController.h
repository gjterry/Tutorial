//
//  TFBaseViewController.h
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#import "TFTutorialManager.h"

#import <UIKit/UIKit.h>

@interface TFBaseViewController : UIViewController <TutorialViewDelegate>

- (NSString *)className;

- (BOOL)shouldSupportTutorial;

@end
