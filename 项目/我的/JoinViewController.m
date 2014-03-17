//
//  JoinViewController.m
//  项目
//
//  Created by Jason on 14-3-12.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "JoinViewController.h"
#import "LoadingViewController.h"
#import "SigninViewController.h"

@interface JoinViewController ()

@end

@implementation JoinViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *leftbut =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(fanhui)];
        self.navigationItem.leftBarButtonItem = leftbut;
    UIImageView *vie = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"md.png"]];
    
    
    [self.view addSubview:vie];
    //在页面上设置的三个按钮
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(40, 340, 90, 45)];
    [button1 setTitle:@"登陆" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor lightGrayColor]];
    [button1 addTarget:self action:@selector(loadAction:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.layer.cornerRadius = 5;
    button1.alpha = 0.7;
    button1.titleLabel.font =[UIFont systemFontOfSize:20.0];
    [self.view addSubview:button1];
    [button1 release];
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(190, 340, 90, 45)];
    [button2 setTitle:@"注册" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor lightGrayColor]];
    [button2 addTarget:self action:@selector(signinAction:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.layer.cornerRadius = 5;
    button2.alpha = 0.7;
    button2.titleLabel.font =[UIFont systemFontOfSize:20.0];
    [self.view addSubview:button2];
    [button2 release];
    
    
    
    
    
}
//登陆点击事件
-(void)loadAction:(id)sender
{
    LoadingViewController *load = [[LoadingViewController alloc]init];
    [self.navigationController pushViewController:load animated:YES];
    
    
}
//注册点击事件
-(void)signinAction:(id)sender{
    
    SigninViewController *sign = [[SigninViewController alloc]init];
    [self.navigationController pushViewController:sign animated:YES];
    
    
}
-(void)fanhui{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
