//
//  TFFirstViewController.m
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#import "TFTutorialController.h"

#import "TFFirstViewController.h"

@interface TFFirstViewController ()

@property (nonatomic, retain) TFTutorialController *tutorialController;

@end

@implementation TFFirstViewController

- (TFTutorialController *)tutorialController {
    if (!_tutorialController) {
        _tutorialController = [[TFTutorialController alloc]init];
    }
    return _tutorialController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tutorialController tutorialCheckWithIdentifier:NSStringFromClass([TFFirstViewController class])
                                            beforeCompletion:^(BOOL isBeforeCompletion) {
                                                NSLog(@"tutorial beforeCompletion");
                                            }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
