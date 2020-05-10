//
//  Draw2D.h
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/9.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Draw2D : UIView

@property NSInteger snakeCurrentXPosition;

@property NSInteger snakeCurrentYPosition;

@property NSArray *lines;

@end

NS_ASSUME_NONNULL_END
