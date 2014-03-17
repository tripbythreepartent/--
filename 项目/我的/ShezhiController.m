//
//  ShezhiController.m
//  项目
//
//  Created by Jason on 14-3-7.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "ShezhiController.h"
#import "SinaViewController.h"
#import "MessageViewController.h"
#import "QuitViewController.h"
#import "JoinViewController.h"
#import "LoadingViewController.h"
#import <ShareSDK/ShareSDK.h>


@interface ShezhiController ()

@end

@implementation ShezhiController
-(void)dealloc{
    
    [_vie release];
    [super dealloc];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        __array =[[NSMutableArray alloc]init];
       
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //创建一个tableview
   
    UITableView * table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStyleGrouped];
    [table setSeparatorColor:[UIColor whiteColor]];
    [table setBackgroundColor:[UIColor whiteColor]];
    [table setRowHeight:65];
    table.delegate =self;
    table.dataSource = self;
    [self.view addSubview:table];
    //把功能标题添加到字典中
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"新浪分享",@"sina", nil];
    NSDictionary *dic1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"清除图片缓存",@"clear", nil];
    NSDictionary *dic2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"个人信息",@"message", nil];
    NSDictionary *dic3 = [[NSDictionary alloc]initWithObjectsAndKeys:@"退出登录",@"quit", nil];
    NSDictionary *dic4 = [[NSDictionary alloc]initWithObjectsAndKeys:@"加入我们",@"join", nil];
    [__array addObject:dic];
    [__array addObject:dic1];
    [__array addObject:dic2];
    [__array addObject:dic4];
    [__array addObject:dic3];
    
   
    
    
    
    
    
    
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    
    return [__array count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //只初始化一次  创建重用池
    static NSString * cellIdentify = @"chi1";
    //    从重用池取可以重用的cell
    _mycell = [tableView dequeueReusableCellWithIdentifier: cellIdentify];
    if (!_mycell) {
        _mycell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentify];
    }
    
   
    NSDictionary * dicc = [__array objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        _mycell.textLabel.text = [dicc objectForKey:@"sina"];
    }
    if (indexPath.row == 1) {
        _mycell.textLabel.text = [dicc objectForKey:@"clear"];
    }
    if (indexPath.row == 2) {
        _mycell.textLabel.text = [dicc objectForKey:@"message"];
    
    }
    if (indexPath.row == 3) {
        _mycell.textLabel.text = [dicc objectForKey:@"join"];
    }
    if (indexPath.row == 4) {
        _mycell.textLabel.text = [dicc objectForKey:@"quit"];
    }
    return _mycell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //判断位置信息，点击对应cell进入相对应的界面
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (indexPath.row == 0) {
//            SinaViewController *sina = [[SinaViewController alloc]init];
//            [self presentViewController:sina animated:YES completion:Nil];
            
            NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
            
            //构造分享内容
            id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                               defaultContent:@"默认分享内容，没内容时显示"
                                                        image:[ShareSDK imageWithPath:imagePath]
                                                        title:@"ShareSDK"
                                                          url:@"http://www.sharesdk.cn"
                                                  description:@"这是一条测试信息"
                                                    mediaType:SSPublishContentMediaTypeNews];
            
            [ShareSDK showShareActionSheet:nil
                                 shareList:nil
                                   content:publishContent
                             statusBarTips:YES
                               authOptions:nil
                              shareOptions: nil
                                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                        if (state == SSResponseStateSuccess)
                                        {
                                            NSLog(@"分享成功");
                                        }
                                        else if (state == SSResponseStateFail)
                                        {
                                            NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                        }
                                    }];        }
    //清除图片缓存提示窗
    if (indexPath.row == 1) {
        _alert = [[UIAlertView alloc]initWithTitle:@"你确定要清除缓存吗？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [_alert show];
        [_alert release];
    }
    
    if (indexPath.row == 2) {
        
        if ([user objectForKey:@"username"]) {
            NSLog(@"123456789------------%@",[user objectForKey:@"username"]);
            MessageViewController *message = [[MessageViewController alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:message];
            message.nnnn = 2;
            [self presentViewController:nav animated:YES completion:nil];
        }
        if (![user objectForKey:@"username"]) {
            LoadingViewController *log = [[LoadingViewController alloc]init];
            [self.navigationController pushViewController:log animated:YES];
            [log release];
            
        }
        
    }
    if (indexPath.row == 3) {
        JoinViewController *join = [[JoinViewController alloc]init];
       
        
        [self.navigationController pushViewController:join animated:YES];
        
    }
    if (indexPath.row == 4) {
        [user removeObjectForKey:@"username"];
        
    }
}
//点击确定清除后弹出“清除成功”提示框
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{


    if (buttonIndex == 1){
        
        _vie = [[UIImageView alloc]initWithFrame:CGRectMake(120, 150, 50, 50)];
       
        [_vie setImage:[UIImage imageNamed:@"1111.png"]];
        UILabel * alable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        [_vie addSubview:alable];
        [alable release];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        [img setImage:[UIImage imageNamed:@"ok.png"]];
        [self.view addSubview:_vie];
        [_vie addSubview:img];
        //计时器 弹出信息消失
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeaction) userInfo:nil repeats:NO];
    }
    else if(buttonIndex == 0){
        
        [_alert removeFromSuperview];
        
    }
    
}
-(void)timeaction
{

    [_vie removeFromSuperview];
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
