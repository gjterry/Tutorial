//
//  TFTutorialController.m
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

typedef void (^completionCallBack)(BOOL  completion);


#import "TFTutorialFactory.h"

#import "TFTutorialController.h"

@interface TFTutorialController () <TutorialViewDelegate>

@property (nonatomic, copy) completionCallBack onCompletion;

@end

@implementation TFTutorialController

/**
 *  检测是否打开引导
 */
- (void)tutorialCheckWithIdentifier:(NSString *)identifier
                       onCompletion:(void (^)(BOOL competion))callback {
    if ([self shouldDisplayTutorialWithName:identifier]) {
        [self showTutorialWithIdentifier:identifier];
        
        self.onCompletion = callback;
    }
}

- (BOOL)shouldDisplayTutorialWithName:(NSString *)name {
    return ![TFTutorialView tutorialHasDisplayBeforeWithVersion:@"1.0" name:name];
}

/**
 *  显示引导
 *
 *  @param identifier 类名
 */
- (void)showTutorialWithIdentifier:(NSString *)identifier {
    TFTutorialView *tutorialView = [TFTutorialFactory addTutorialViewWithClassName:identifier];
    tutorialView.backgroundColor = [UIColor redColor];
    tutorialView.delegate = self;
    [tutorialView showInView:[[[UIApplication sharedApplication].delegate window].rootViewController view]];
}

- (void)tutorialViewStartButtonDidTapped:(TFTutorialView *)tutorialView {
    
    self.onCompletion(YES);
    [tutorialView dismissFromSuperView];
}



@end
