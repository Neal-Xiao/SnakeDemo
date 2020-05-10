//
//  GameViewController.m
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/8.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import "GameViewController.h"
#import "Draw2D.h"
#import <Masonry.h>

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"GamePage";
    
    [self draw2DView];
}

-(void)draw2DView {
    
    Draw2D *drawView = [[Draw2D alloc] init];
    
    [self.view addSubview:drawView];
    
    drawView.translatesAutoresizingMaskIntoConstraints = false;
    
    [drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

@end
