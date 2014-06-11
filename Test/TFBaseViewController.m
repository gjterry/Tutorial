//
//  TFBaseViewController.m
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#import "TFBaseViewController.h"

@interface TFBaseViewController ()

@end

@implementation TFBaseViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tutorialCheck];
}

/**
 *  检测是否打开引导
 */
- (void)tutorialCheck {
    if ([self shouldSupportTutorial]) {
        NSString *className = [self className];
        if ([[TFTutorialManager sharedInstance]shouldDisplayTutorialWithName:className])
            [self showTutorialWithName:className];
        
    }
}

/**
 *  显示引导
 *
 *  @param className 类名
 */
- (void)showTutorialWithName:(NSString *)className {
    TFTutorialView *tutorialView = [[TFTutorialManager sharedInstance]addTutorialViewWithClassName:className];
    tutorialView.backgroundColor = [UIColor redColor];
    tutorialView.delegate = self;
    [tutorialView show];
}

/**
 *  一个控制器可以显示多张引导
 *
 *  @param classNames
 */
- (void)showTutorialWithNames:(NSArray *)classNames {
    //TODO
}

/**
 *  返回类名
 */
- (NSString *)className {
    return nil;
}

/**
 *  控制器是否支持引导
 *
 *  @return 默认值 YES  ps 如果返回值未NO 则不需要实现 TutorialViewDelegate
 */
- (BOOL)shouldSupportTutorial {
    return YES;
}


@end
