//
//  Draw2D.h
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/9.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SnakePosition.h"
NS_ASSUME_NONNULL_BEGIN

@interface Draw2D : UIView

@property (strong, nonatomic)NSArray<SnakePosition *> *lines;

@end

NS_ASSUME_NONNULL_END
