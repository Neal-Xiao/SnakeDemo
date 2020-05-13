//
//  Draw2D.h
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/9.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Position;

NS_ASSUME_NONNULL_BEGIN

@interface Draw2D : UIView

@property (nonatomic, copy) NSArray<Position *> *lines;
@property (nonatomic, strong) Position *fruit;

@end

NS_ASSUME_NONNULL_END
