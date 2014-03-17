//
//  MessageViewController.m
//  项目
//
//  Created by Jason on 14-3-7.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "MessageViewController.h"
#import "ShezhiController.h"
#import "LoadingViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

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
    //在navigationController上添加图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
 //在navigationController上添加返回按钮
    UIBarButtonItem *leftbut =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(fanhuiAction)];
    
    self.navigationItem.leftBarButtonItem = leftbut;
    
    //在页面上添加头像
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(110, 80, 100, 100)];
    lab.layer.cornerRadius = 50;
       [self.view addSubview:lab];
    [lab release];
    
    UIImageView *img =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,100 ,100 )];
    lab.layer.cornerRadius = 50;
    [img setImage:[UIImage imageNamed:@"mummy.png"]];
    [lab addSubview:img];
    [img release];
    
    
}
//返回点击时间
-(void)fanhuiAction{
    //判断（返回相对应的界面）
   
    if (self.nnnn == 1) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }if (self.nnnn == 2) {
        
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
