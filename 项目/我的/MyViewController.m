//
//  MyViewController.m
//  项目
//
//  Created by 啊啊 on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "MyViewController.h"
#import "LoadingViewController.h"
#import "SigninViewController.h"
#import "ShezhiController.h"
#import "MessageViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController
-(void)dealloc{
    [_dic release];
    [super dealloc];
}

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
    UIImageView *vie = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nnn.png"]];
    
    
    [self.view addSubview:vie];
    
    //在navigationController上添加图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    
//    UIBarButtonItem *leftbut =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:nil];
//        self.navigationItem.leftBarButtonItem = leftbut;
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:self action:@selector(ShezhiAction:)];
    self.navigationItem.rightBarButtonItem = right;
    
    //在navigationController上面添加标题
   UILabel *alabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)
                      ];
    alabel.text = @"我的地盘";
    self.navigationItem.titleView = alabel;
    [alabel release];
    

}
//登陆点击事件


//-(void)connection{
//    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"1",@"garrert_mode", nil];
//    
//    
//    
//    [AsyconnectModel
//     asyncGetWithUrl:HS_TripConnection parmaters:dic finishBlock:^(id response){
//         
//         if ([response isKindOfClass:[NSDictionary class]]) {
//             [_dic addEntriesFromDictionary:response];
//             
//         }
//     }];
//                        
//     }
//设置点击事件
-(void)ShezhiAction:(id)sender{
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//        if ([userDefaults objectForKey:@"username"]) {
//            NSLog(@"^^^^^^^^^%@",[userDefaults objectForKey:@"username"]);
            ShezhiController *she = [[ShezhiController alloc]init];
            [self.navigationController pushViewController:she animated:YES];
            [she release];
            
            

            
//        }

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
