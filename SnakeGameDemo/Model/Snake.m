//
//  SnakeModel.m
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/10.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import "Snake.h"

static const NSUInteger kMoveConstant = 30;

@interface Snake()

@property (nonatomic, assign) NSInteger firstPoint;

@end

@implementation Snake

- (NSArray<Position *> *)moveOneStep {
    
    switch (self.turnDirection) {
            
        case SnakeDirectionTop:
            
            for (int i = 0; i <= self.positionList.count - 1; i++) {
                
                if (i == 0) {
                    
                    self.firstPoint = self.positionList[i].x;
                    
                    self.positionList[i].y -= kMoveConstant;
                    
                } else {
                    
                    if (self.positionList[i].x != self.firstPoint) {
                        
                        switch (self.previousDirection) {
                                
                            case SnakeDirectionLeft:
                                
                                self.positionList[i].x -= kMoveConstant;
                                break;
                            case SnakeDirectionRight:
                                
                                self.positionList[i].x += kMoveConstant;
                            default:
                                break;
                        }
                        
                    } else {
                        
                        self.positionList[i].y -= kMoveConstant;
                    }
                }
            }
            
            break;
            
        case SnakeDirectionLeft:
            
            for (int i = 0; i <= self.positionList.count - 1; i++) {
                
                if (i == 0) {
                    
                    self.firstPoint = self.positionList[i].y;
                    
                    self.positionList[i].x -= kMoveConstant;
                    
                } else {
                    
                    if (self.positionList[i].y != self.firstPoint) {
                        
                        switch (self.previousDirection) {
                                
                            case SnakeDirectionTop:
                                
                                self.positionList[i].y -= kMoveConstant;
                                break;
                            case SnakeDirectionBottom:
                                
                                self.positionList[i].y += kMoveConstant;
                            default:
                                break;
                        }
                        
                    } else {
                        
                        self.positionList[i].x -= kMoveConstant;
                    }
                }
            }
            
            break;
            
        case SnakeDirectionBottom:
            
            for (int i = 0; i <= self.positionList.count - 1; i++) {
                
                if (i == 0) {
                    
                    self.firstPoint = self.positionList[i].x;
                    
                    self.positionList[i].y += kMoveConstant;
                    
                } else {
                    
                    if (self.positionList[i].x != self.firstPoint) {
                        
                        switch (self.previousDirection) {
                                
                            case SnakeDirectionLeft:
                                
                                self.positionList[i].x -= kMoveConstant;
                                break;
                            case SnakeDirectionRight:
                                
                                self.positionList[i].x += kMoveConstant;
                            default:
                                break;
                        }
                        
                    } else {
                        
                        self.positionList[i].y += kMoveConstant;
                    }
                }
            }
            
            break;
            
        case SnakeDirectionRight:
            
            for (int i = 0; i <= self.positionList.count - 1; i++) {
                
                if (i == 0) {

                    self.firstPoint = self.positionList[i].y;
                    
                    self.positionList[i].x += kMoveConstant;
                    
                } else {
                    
                    if (self.positionList[i].y != self.firstPoint) {
                        
                        switch (self.previousDirection) {
                                
                            case SnakeDirectionTop:
                                
                                self.positionList[i].y -= kMoveConstant;
                                break;
                            case SnakeDirectionBottom:
                                
                                self.positionList[i].y += kMoveConstant;
                            default:
                                break;
                        }
                        
                    } else {
                        
                        self.positionList[i].x += kMoveConstant;
                    }
                }
            }
            
            break;
            
        default:
            break;
    }
    
    return self.positionList;
}

@end
