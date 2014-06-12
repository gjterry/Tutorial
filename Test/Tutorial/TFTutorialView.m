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

@property (nonatomic, strong, readonly) UIWindow *overlayWindow;

@end

@implementation TFTutorialView

@synthesize overlayWindow;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (UIWindow *)overlayWindow {
    if(!overlayWindow) {
        overlayWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        overlayWindow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        overlayWindow.backgroundColor = [UIColor clearColor];
        overlayWindow.userInteractionEnabled = YES;
    }
    return overlayWindow;
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

/**
 *  这里注视掉异步显示  如果app运行到这里还没有找到rootViewController会报警告
 *
 *  @return
 */
#pragma mark - Master show/dismiss methods
- (void)show {
//    dispatch_async(dispatch_get_main_queue(), ^{
    
    NSLog(@"keyWindow:%@",[UIApplication sharedApplication].keyWindow);
        self.frame = self.overlayWindow.bounds;
        if(!self.superview)
            [self.overlayWindow addSubview:self];
        [self.overlayWindow makeKeyAndVisible];
        [self setNeedsDisplay];
//    });
}

- (void)showInView:(UIView *)v {
    self.frame = v.bounds;
    [v addSubview:self];
}

- (void)dismiss {
    //    dispatch_async(dispatch_get_main_queue(), ^{
    [self removeFromSuperview];
    NSMutableArray *windows = [[NSMutableArray alloc] initWithArray:[UIApplication sharedApplication].windows];
    [windows removeObject:overlayWindow];
    overlayWindow = nil;
    [windows enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIWindow *window, NSUInteger idx, BOOL *stop) {
        if([window isKindOfClass:[UIWindow class]] && window.windowLevel == UIWindowLevelNormal) {
            [window makeKeyWindow];
            *stop = YES;
        }
    }];
    //    });
}

- (void)dismissFromSuperView {
    [self removeFromSuperview];
}


@end
