//
//  TFTutorialView.m
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#define TUTORIAL_KEY_PREFIX @"tutorial_"

#import "TFTutorialView.h"

@interface TFTutorialView ()

@end

@implementation TFTutorialView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithClassName:(NSString *)class_name {
    self = [super init];
    if (self) {
        self.className = class_name;
        self.image = [UIImage imageNamed:self.className];
        self.userInteractionEnabled = YES;
        [self addTapGesture];
    }
    return self;
}

- (void)addTapGesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tapGesture];
}

+ (BOOL)tutorialHasDisplayBeforeWithVersion:(NSString *)version name:(NSString *)name {
    version = [NSString stringWithFormat:@"%@%@%@", TUTORIAL_KEY_PREFIX,version,name];
    return [[NSUserDefaults standardUserDefaults] boolForKey:version];
}

+ (void)setTutorialDidDisplayForVersion:(NSString *)version name:(NSString *)name {
    version = [NSString stringWithFormat:@"%@%@%@", TUTORIAL_KEY_PREFIX, version,name];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:version];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)tapped:(UIGestureRecognizer *)gesture {
    if([self.delegate respondsToSelector:@selector(tutorialViewStartButtonDidTapped:)]){
        [self.delegate tutorialViewStartButtonDidTapped:self];
    }
}

- (void)showInView:(UIView *)v {
    self.frame = v.bounds;
    [v addSubview:self];
}

- (void)dismissFromSuperView {
    [self removeFromSuperview];
}


@end
