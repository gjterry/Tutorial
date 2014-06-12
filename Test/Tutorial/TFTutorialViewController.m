//
//  TFTutorialViewController.m
//  Test
//
//  Created by Terry  on 14-6-12.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#import "TFTutorialManager.h"

#import "TFTutorialViewController.h"

@interface TFTutorialViewController () <TutorialViewDelegate>

@property (nonatomic, retain) UIViewController *viewController;

@property (nonatomic, copy) NSString *identifier;

@end

@implementation TFTutorialViewController

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

- (id)initWithViewController:(UIViewController *)viewController
               andIdentifier:(NSString *)identifier {
    if (self = [super init]) {
        self.viewController = viewController;
        self.identifier = identifier;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.viewController.view];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self tutorialCheck];
}

/**
 *  检测是否打开引导
 */
- (void)tutorialCheck {
    if ([[TFTutorialManager sharedInstance]shouldDisplayTutorialWithName:self.identifier])
        [self showTutorialWithIdentifier:self.identifier];
}

/**
 *  显示引导
 *
 *  @param identifier 类名
 */
- (void)showTutorialWithIdentifier:(NSString *)identifier {
    TFTutorialView *tutorialView = [[TFTutorialManager sharedInstance]addTutorialViewWithClassName:identifier];
    tutorialView.backgroundColor = [UIColor redColor];
    tutorialView.delegate = self;
    
    [tutorialView showInView:[[[UIApplication sharedApplication].delegate window].rootViewController view]];
}


- (void)tutorialViewStartButtonDidTapped:(TFTutorialView *)tutorialView {
    [tutorialView dismissFromSuperView];
    [TFTutorialView setTutorialDidDisplayForVersion:@"1.0" name:self.identifier];
}

@end
