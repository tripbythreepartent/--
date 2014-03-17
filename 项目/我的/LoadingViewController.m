//
//  LoadingViewController.m
//  项目
//
//  Created by Jason on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "LoadingViewController.h"
#import "MessageViewController.h"
#import "ShezhiController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _dic = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //在navigationController上面添加图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top1.png"] forBarMetrics:UIBarMetricsDefault];
    
//    UIBarButtonItem *leftbut =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:nil];
//    self.navigationItem.leftBarButtonItem = leftbut;
    
    //在navigationController上添加标题
    UILabel *alabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)
                       ];
    alabel.text = @"Let's Go!";
    self.navigationItem.titleView = alabel;
    [alabel release];
    
  //  UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"微博登陆" style:UIBarButtonItemStylePlain target:self action:nil];
  //  [self.navigationItem setRightBarButtonItem:right ];
    
    //在视图上添加登陆账号 密码框
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(45, 50, 80, 30)];
    label1.text = @"账号";
    [self.view addSubview:label1];
    [label1 release];
    
    _text1 = [[UITextField alloc]initWithFrame:CGRectMake(110, 50, 150, 30)];
    _text1.placeholder = @"请输入您的账号";
   
    [_text1 setBorderStyle:UITextBorderStyleRoundedRect];
    _text1.clearsOnBeginEditing=YES;
    _text1.textColor = [UIColor lightGrayColor];
    [self.view addSubview:_text1];
    [_text1 release];
    
    _label2 = [[UILabel alloc]initWithFrame:CGRectMake(45, 110, 80, 30)];
    _label2.text = @"密码";
    [self.view addSubview:_label2];
    [_label2 release];
    
    _text2 = [[UITextField alloc]initWithFrame:CGRectMake(110, 110, 150, 30)];
    _text2.placeholder = @"请输入密码";
    _text2.secureTextEntry = YES;
    [_text2 setBorderStyle:UITextBorderStyleRoundedRect];
    _text2.clearsOnBeginEditing=YES;
    _text2.textColor = [UIColor lightGrayColor];
    [self.view addSubview:_text2];
    [_text2 release];
    
    //登陆按钮
    UIButton * loading = [[UIButton alloc]initWithFrame:CGRectMake(110, 180, 100, 50)];
    [loading setTitle:@"登陆" forState:UIControlStateNormal];
    [loading addTarget:self action:@selector(connection) forControlEvents:UIControlEventTouchUpInside];
    [loading setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:loading];
    [loading release];
        
}
-(void)connection{
    //把登陆信息添加到字典中
    NSString *str1 = _text1.text;
    NSString *str2 = _text2.text;
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:str2,@"password",str1,@"username", nil];
    NSLog(@"++++++++%@",dic);
    //链接登陆接口
    [AsyMid connectionWithUrl:RS_TripConnection parmaters:dic finishBlock:^(id response){
        //单例
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        //判断 接受是字典和数组
        
        
        if ([response isKindOfClass:[NSDictionary class]] ) {
            if ([response objectForKey:@"error_code"] == nil) {
                [_dic addEntriesFromDictionary:response];
                NSLog(@"*********%@",response);
                
                [userDefaults setObject:str1 forKey:@"username"];
                [userDefaults setObject:str2 forKey:@"password"];
                MessageViewController *message = [[MessageViewController alloc]init];
                //往个人信息中传值
                message.nnnn = 1;
                [self.navigationController pushViewController:message animated:YES];
                [userDefaults synchronize];
                

            }
            else{
                NSString * myerror = [response objectForKey:@"prompt"];
                
                UIAlertView * alert  = [[UIAlertView alloc]initWithTitle:myerror message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"好的", nil];
                [alert show];
                [alert release];
            }

           
            
        }
        if ([response isKindOfClass:[NSString class]]) {
            if ([response objectForKey:@"error_code"] == nil)
            {
            [_arr addObject:response];
            NSLog(@"----------%@",response);
            [userDefaults setObject:str1 forKey:@"username"];
            [userDefaults setObject:str2 forKey:@"password"];
                MessageViewController *message = [[MessageViewController alloc]init];
                //往个人信息中传值
                message.nnnn = 1;
                [self.navigationController pushViewController:message animated:YES];
                [userDefaults synchronize];
                
            }
            else{
                NSString * myerror = [response objectForKey:@"prompt"];
            
                UIAlertView * alert  = [[UIAlertView alloc]initWithTitle:myerror message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"好的", nil];
                [alert show];
                [alert release];
            }
        }
        
       
    }];
   
    
    }


    
    


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
