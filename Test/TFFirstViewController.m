//
//  TFFirstViewController.m
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#import "TFFirstViewController.h"

@interface TFFirstViewController ()

@end

@implementation TFFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  重栽父类
 *
 *  @return 本类名
 */
- (NSString *)className {
    NSString *className = NSStringFromClass([TFFirstViewController class]);
    return className;
}

#pragma mark TutorialViewDelegate
- (void)tutorialViewStartButtonDidTapped:(TFTutorialView *)tutorialView {
    [TFTutorialView setTutorialDidDisplayForVersion:@"1.0" name:tutorialView.className];
    [tutorialView dismiss];
}

@end
