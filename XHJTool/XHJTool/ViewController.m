//
//  ViewController.m
//  XHJTool
//
//  Created by coco on 16/3/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "ViewController.h"
#import "TouchID.h"
@interface ViewController ()
@property (nonatomic , strong)UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button addTarget:self action:@selector(registerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        
        button.backgroundColor = [UIColor redColor];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:@"注册" forState:UIControlStateNormal];
        
        button.layer.masksToBounds = YES;
//        button.layer.cornerRadius = buttonHeight/2;
        button.frame = CGRectMake(100, 100, 100, 30);
        button;
    });
    [self.view addSubview:self.button];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
