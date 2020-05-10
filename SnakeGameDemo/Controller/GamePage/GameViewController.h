//
//  GameViewController.h
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/8.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DirectionType) {
    DirectionTypeTop,
    DirectionTypeLeft,
    DirectionTypeBottom,
    DirectionTypeRight,
};

@interface GameViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
