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

- (void)tutorialCheck {
    if ([self shouldSupportTutorial]) {
        NSString *className = [self className];
        if ([[TFTutorialManager sharedInstance]shouldDisplayTutorialWithName:className]) {
            [self showTutorialWithName:className];
        }
    }
}

- (void)showTutorialWithName:(NSString *)className {
    TFTutorialView *tutorialView = [[TFTutorialManager sharedInstance]addTutorialViewWithClassName:className];
    tutorialView.delegate = self;
    [tutorialView show];
}

- (void)showTutorialWithNames:(NSArray *)classNames {
    //TODO
}


- (NSString *)className {
    return nil;
}

- (BOOL)shouldSupportTutorial {
    return YES;
}


@end
