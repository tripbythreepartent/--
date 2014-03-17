//
//  EditLogViewController.m
//  项目
//
//  Created by 啊啊 on 14-3-7.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "EditLogViewController.h"
#import "LogViewController.h"

@interface EditLogViewController ()

@end

@implementation EditLogViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)editNavigation{
    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    self.navigationItem.title = @"旅程日志";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)createPage{
    UIButton * editButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 70, 100, 50)];
    [editButton setTitle:@"编辑日志" forState:UIControlStateNormal];
    [editButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(pushLogAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:editButton];
    [editButton release];
    
}

- (void)pushLogAction:(id)sender{
    LogViewController * log = [[LogViewController alloc] init];
    [self presentViewController:log animated:NO completion:Nil];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self editNavigation];
    [self createPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
