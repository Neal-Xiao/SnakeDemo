//
//  SnakeModel.m
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/10.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import "SnakeModel.h"

@interface SnakeModel()

@property BOOL isChangeDirection;

@end

@implementation SnakeModel

- (NSArray<SnakePosition *> *)snakeMoveOneStep {
    
    NSInteger firstPoint = 0;
    
    switch (self.snakeDirectionType) {
            
        case DirectionTypeTop:
            
            for (int i = 0; i <= self.positionArray.count - 1; i++) {
                
                if (i == 0) {
                    
                    firstPoint = self.positionArray[i].snakeXPosition;
                                        
                    self.positionArray[i].snakeYPosition -= 30;
                                                            
                } else {
                                        
                    if (self.positionArray[i].snakeXPosition != firstPoint) {
                        
                        switch (self.previousDirectionType) {
                                
                            case DirectionTypeLeft:
                                
                                self.positionArray[i].snakeXPosition -= 30;
                                break;
                            case DirectionTypeRight:
                                
                                self.positionArray[i].snakeXPosition += 30;
                            default:
                                break;
                        }
                        
                    } else {
                        
                        self.positionArray[i].snakeYPosition -= 30;
                    }
                    
                }
                
            }
            
            break;
        case DirectionTypeLeft:
            
            for (int i = 0; i <= self.positionArray.count - 1; i++) {
                self.positionArray[i].snakeXPosition -= 30;
            }
            
            break;
        case DirectionTypeBottom:
            
            for (int i = 0; i <= self.positionArray.count - 1; i++) {
                self.positionArray[i].snakeXPosition += 30;
            }
            
            break;
        case DirectionTypeRight:
            
            for (int i = 0; i <= self.positionArray.count - 1; i++) {
                self.positionArray[i].snakeXPosition += 30;
            }
            
            break;
        default:
            break;
    }
    
    return self.positionArray;
}

@end
