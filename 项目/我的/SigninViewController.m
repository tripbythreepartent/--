//
//  SigninViewController.m
//  项目
//
//  Created by Jason on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "SigninViewController.h"

@interface SigninViewController ()

@end

@implementation SigninViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _dic = [[NSMutableDictionary alloc]init];
        _arr = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //在navigationController上添加标题
    UILabel *alabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    alabel.text = @"Join Us Now!";
    self.navigationItem.titleView = alabel;
    [alabel release];
    //在注册界面中添加注册信息框
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(45, 50, 80, 30)];
    label1.text = @"账号";
    [self.view addSubview:label1];
    [label1 release];
    
    _text1 = [[UITextField alloc]initWithFrame:CGRectMake(110, 50, 150, 30)];
    [_text1 setBorderStyle:UITextBorderStyleRoundedRect];
    _text1.clearsOnBeginEditing=YES;
    _text1.placeholder = @"可以为中文";
    _text1.textColor = [UIColor lightGrayColor] ;
    [self.view addSubview:_text1];
    [_text1 release];
    
    
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(45, 110, 80, 30)];
    label2.text = @"密码";
    [self.view addSubview:label2];
    [label2 release];
    
    _text2 = [[UITextField alloc]initWithFrame:CGRectMake(110, 110, 150, 30)];
    _text2.placeholder = @"密码最短为6位";
    _text2.secureTextEntry = YES;
    [_text2 setBorderStyle:UITextBorderStyleRoundedRect];
    _text2.clearsOnBeginEditing=YES;
    _text2.textColor = [UIColor lightGrayColor];
    [self.view addSubview:_text2];
    [_text2 release];
    
    
    UILabel * label3 = [[UILabel alloc]initWithFrame:CGRectMake(45, 170, 80, 30)];
    label3.text = @"邮箱";
    [self.view addSubview:label3];
    [label3 release];
    
    _text3 = [[UITextField alloc]initWithFrame:CGRectMake(110, 170, 150, 30)];
    _text3.placeholder = @"请输入您的邮箱";
    
    [_text3 setBorderStyle:UITextBorderStyleRoundedRect];
    _text3.clearsOnBeginEditing=YES;
    _text3.textColor = [UIColor lightGrayColor];
    [self.view addSubview:_text3];
    [_text3 release];
    
  
    _loading = [[UIButton alloc]initWithFrame:CGRectMake(110, 230, 100, 50)];
    [_loading setBackgroundColor:[UIColor lightGrayColor]];
    [_loading addTarget:self action:@selector(connection) forControlEvents:UIControlEventTouchUpInside];
    [_loading setTitle:@"开始注册" forState:UIControlStateNormal];
    [self.view addSubview:_loading];
    [_loading release];

}
-(void)connection{
    
    NSString *str1 = _text1.text;
    NSString *str2 = _text2.text;
    NSString *str3 = _text3.text;
    //把注册信息添加到字典中
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:str3,@"email",str2,@"password",str1,@"username", nil];
    NSLog(@"++++++++%@",dic);
    //链接注册接口
    [AsyMid connectionWithUrl:HS_TripConnection parmaters:dic finishBlock:^(id response){
        //判断 接受是字典或数组
        if ([response isKindOfClass:[NSDictionary class]] ) {
            [_dic addEntriesFromDictionary:response];
            NSLog(@"*********%@",response);
        }
        if ([response isKindOfClass:[NSString class]]) {
            [_arr addObject:response];
            NSLog(@"----------%@",response);
        }
        //如果注册信息错误弹出提示框
        if ([response objectForKey:@"error_code"]) {
            _alertt = [[UIAlertView alloc]initWithTitle:@"本次注册未成功" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"好吧 ", nil];
        
        }
        [_alertt show];
        [_alertt release];
    }];
    
    
   //各种弹出提示框
    if (_text1.text.length == 0 ||_text2.text.length == 0 || _text3.text.length == 0) {
        _alertt= [[UIAlertView alloc]initWithTitle:@"请输入您的注册信息" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [_alertt show];
        [_alertt release];
    }
    if (_text2.text.length < 6) {
        _alertt = [[UIAlertView alloc]initWithTitle:@"密码最短6位" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"好的", nil];
        [_alertt show];
        [_alertt release];
    }
    if ([_text3.text rangeOfString:@"@"].length == 0 ) {
        _alertt = [[UIAlertView alloc]initWithTitle:@"邮箱输入错误" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"好的", nil];
        [_alertt show];
        [_alertt release];
    }
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
