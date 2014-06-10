//
//  TFTutorialView.h
//  Test
//
//  Created by Terry  on 14-6-9.
//  Copyright (c) 2014年 EDoctor. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TFTutorialView;
@protocol TutorialViewDelegate <NSObject>

@optional

- (void)tutorialViewStartButtonDidTapped:(TFTutorialView *)tutorialView;

@end

@interface TFTutorialView : UIImageView

@property (nonatomic, retain) NSString *className;

@property (nonatomic, assign) id <TutorialViewDelegate> delegate;

- (id)initWithClassName:(NSString *)class_name;

+ (void)setTutorialDidDisplayForVersion:(NSString *)version name:(NSString *)name;

+ (BOOL)tutorialHasDisplayBeforeWithVersion:(NSString *)version
                                       name:(NSString *)name;

- (void)show;

- (void)dismiss;

@end
