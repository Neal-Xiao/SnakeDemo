//
//  SnakeModel.h
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/10.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameViewController.h"
#import "SnakePosition.h"

NS_ASSUME_NONNULL_BEGIN

@interface SnakeModel : NSObject

@property (strong, nonatomic)NSArray<SnakePosition *> *positionArray;
@property DirectionType snakeDirectionType;
@property DirectionType previousDirectionType;

- (NSArray *)snakeMoveOneStep;

- (NSArray *)snakeAddLengh;

- (BOOL)snakeIsTouchBody:(NSArray *)snakePositionArray;

- (BOOL)snakeIsTouchPoint:(CGPoint *)point;

@end

NS_ASSUME_NONNULL_END
