//
//  TFSecondViewController.m
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#import "TFSecondViewController.h"

@interface TFSecondViewController ()

@end

@implementation TFSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)className {
    NSString *className = NSStringFromClass([TFSecondViewController class]);
    return className;
}

- (void)tutorialViewStartButtonDidTapped:(TFTutorialView *)tutorialView {
    [tutorialView dismiss];
}

@end
