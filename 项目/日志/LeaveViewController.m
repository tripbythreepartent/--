//
//  LeaveViewController.m
//  项目
//
//  Created by 啊啊 on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "LeaveViewController.h"

@interface LeaveViewController ()

@end

@implementation LeaveViewController

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
    
    [self createPage];
}

- (void)createPage{
    UIImageView * headImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    [headImage setImage:[UIImage imageNamed:@"top.png"]];
    headImage.userInteractionEnabled = YES;
    [self.view addSubview:headImage];
    [headImage release];
    
    UIButton * returnButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 30, 20)];
    [returnButton setImage:[UIImage imageNamed:@"tabbar_trip_create_hl.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headImage addSubview:returnButton];
    [returnButton release];
    
    
    UILabel * text = [[UILabel alloc] initWithFrame:CGRectMake(130, 30, 100, 20)];
    [text setText:@"旅行日志"];
    [headImage addSubview:text];
    [text release];
    
    UIButton * okButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 30, 30, 20)];
    [okButton setImage:[UIImage imageNamed:@"tabbar_trip_create_hl.png"] forState:UIControlStateNormal];
    [headImage addSubview:okButton];
    [okButton release];
    
    UITextField * log = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, 280, 80)];
    [log setBorderStyle:UITextBorderStyleRoundedRect];
    log.placeholder = @"亲、你今天去哪了？";
    [self.view addSubview:log];
    [log release];
    
    UILabel * date = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 280, 15)];
    [date setBackgroundColor:[UIColor lightGrayColor]];
    [date setText:@"2014-03-05 19:42"];
    [self.view addSubview:date];
    [date release];
    

}

- (void)returnAction:(id)sender{
    [self dismissViewControllerAnimated:NO completion:Nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
