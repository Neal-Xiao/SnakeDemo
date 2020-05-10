//
//  ViewController.m
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/8.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import "GameStartViewController.h"
#import <Masonry.h>
#import "GameViewController.h"

@interface GameStartViewController ()

@end

@implementation GameStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupStartButton];
    
    self.navigationItem.title = @"StartPage";
}

- (void)setupStartButton {
    
    self.startButton = [[UIButton alloc] init];
    
    [self.startButton setTitle:@"StartGame" forState:normal];
    
    [self.startButton setTintColor:[UIColor systemBlueColor]];
    
    self.startButton.titleLabel.font = [UIFont systemFontOfSize:25];
    
    self.startButton.backgroundColor = [UIColor blackColor];
    
    self.startButton.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview:self.startButton];
    
    [self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    [self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width / 2, 30));
    }];
    
    [self.startButton addTarget:self action:@selector(clickedStartGameButtonHandle:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickedStartGameButtonHandle:(UIButton *)sender {
    
    GameViewController *gameViewController = [[GameViewController alloc] init];
    
    [self showViewController:gameViewController sender:nil];
    
//    [self presentViewController:gameViewController animated:true completion:nil];
}

@end
