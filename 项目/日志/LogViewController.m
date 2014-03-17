//
//  LogViewController.m
//  项目
//
//  Created by 啊啊 on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "LogViewController.h"
#import "LeaveViewController.h"
#import "PhotoViewController.h"
#import "TrackViewController.h"
#import <AMapSearchKit/AMapSearchAPI.h>
#import <AMapSearchKit/AMapSearchAPI.h>

@interface LogViewController ()

@end

@implementation LogViewController

-(void)dealloc{
    [_view1 release];
    [_view2 release];
    [_map release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self createPage];
    
    
    
}

-(void)connection{
//    NSString *str1 = _text1.text;
//    NSString *str2 = _text2.text;
//    NSString *str3 = _text3.text;
//    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:str3,@"email",str2,@"password",str1,@"username", nil];
//    NSLog(@"++++++++%@",dic);
    
    //    [AsyconnectModel asyncPostWithParmaUrl:HS_TripConnection parmaters:dic finishBlock:^{
    //
    //    }];
    
//    [AsyconnectModel connectionWithUrl:HS_TripConnection parmaters:dic finishBlock:^{
    
//    }];
    //    [AsyconnectModel
    //     asyncPostWithUrl:HS_TripConnection parmaters:dic finishBlock:^(id response){
    //
    //         if ([response isKindOfClass:[NSDictionary class]]) {
    //             [_dic addEntriesFromDictionary:response];
    //
    //         }
    //     }];
    
}

- (void)returnAction:(id)sender{
    [self dismissViewControllerAnimated:NO completion:Nil];
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
    
    
    UIImageView * imageHead = [[UIImageView alloc] initWithFrame:CGRectMake(20, 84, 50, 50)];
    imageHead.layer.cornerRadius=25.0;
    [imageHead setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:imageHead];
    [imageHead release];
    
    UILabel * name = [[UILabel alloc] initWithFrame:CGRectMake(80, 84, 100, 20)];
    [name setText:@"旅程名称"];
    [name setTextColor:[UIColor blackColor]];
    [self.view addSubview:name];
    [name release];
    
    UILabel * date = [[UILabel alloc] initWithFrame:CGRectMake(80, 120, 60, 15)];
    [date setText:@"2014.03.05"];
    [date setTextColor:[UIColor blackColor]];
    
    date.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:date];
    [date release];
    
    UIImageView * edit = [[UIImageView alloc] initWithFrame:CGRectMake(155, 84, 20, 20)];
    edit.layer.cornerRadius=10.0;
    [edit setImage:[UIImage imageNamed:@"tabbar_trip_create_hl@2x"]];
    edit.layer.masksToBounds = YES;
    [self.view addSubview:edit];
    [edit release];
    
    //地图显示
    _map = [[Map alloc] initWithFrame:CGRectMake(0, 80, 320, 150)];
    [self.view addSubview:_map];
    [_map release];
    
    UILabel * start = [[UILabel alloc] initWithFrame:CGRectMake(20, 320, 100, 20)];
    [start setText:@"出发城市  :"];
    [start setTextColor:[UIColor blackColor]];
    [self.view addSubview:start];
    [start release];
    
    UILabel * end = [[UILabel alloc] initWithFrame:CGRectMake(20, 350, 100, 20)];
    [end setText:@"到达城市  :"];
    [end setTextColor:[UIColor blackColor]];
    [self.view addSubview:end];
    [end release];
    
    _startCity = [[UITextField alloc] initWithFrame:CGRectMake(110, 320, 100, 20)];
    _startCity.borderStyle = UITextBorderStyleRoundedRect;
    _startCity.returnKeyType = UIReturnKeyNext;
    _startCity.delegate = self;
    [self.view addSubview:_startCity];
    [_startCity release];
    
    _endCity = [[UITextField alloc] initWithFrame:CGRectMake(110, 350, 100, 20)];
    _endCity.borderStyle = UITextBorderStyleRoundedRect;
    _endCity.returnKeyType = UIReturnKeyNext;
    _endCity.delegate = self;
    [self.view addSubview:_endCity];
    [_endCity release];
    
    UILabel * hotel = [[UILabel alloc] initWithFrame:CGRectMake(20, 380, 100, 20)];
    [hotel setText:@"住宿信息"];
    [hotel setTextColor:[UIColor blackColor]];
    [self.view addSubview:hotel];
    [hotel release];
    
    _hotelText = [[UITextField alloc] initWithFrame:CGRectMake(110, 380, 100, 20)];
    _hotelText.borderStyle = UITextBorderStyleRoundedRect;
    _hotelText.returnKeyType = UIReturnKeyDone;
    _hotelText.delegate = self;
    [self.view addSubview:_hotelText];
    [_hotelText release];
    
    UIImageView * down = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 46, 320, 46)];
    [down setImage:[UIImage imageNamed:@"buttom.png"]];
    //图片用户交互
    down.userInteractionEnabled = YES;
    [self.view addSubview:down];
    [down release];
    
    UIButton * Leave = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 20)];
    [Leave setTitle:@"旅行日志" forState:UIControlStateNormal];
    [Leave addTarget:self action:@selector(leaveAction:) forControlEvents:UIControlEventTouchUpInside];
    [Leave setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [down addSubview:Leave];
    [Leave release];
    
    UIButton * photo = [[UIButton alloc] initWithFrame:CGRectMake(160, 20, 50, 20)];
    [photo setTitle:@"照相" forState:UIControlStateNormal];
    [photo addTarget:self action:@selector(photoAction:) forControlEvents:UIControlEventTouchUpInside];
    [photo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [down addSubview:photo];
    [photo release];
    
    UIButton * track = [[UIButton alloc] initWithFrame:CGRectMake(250, 20, 50, 20)];
    [track setTitle:@"轨迹" forState:UIControlStateNormal];
    [track addTarget:self action:@selector(trackAction:) forControlEvents:UIControlEventTouchUpInside];
    [track setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [down addSubview:track];
    [track release];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == _startCity) {
        [_startCity resignFirstResponder];
        [_endCity becomeFirstResponder];
    }if (textField == _endCity){
        [_endCity resignFirstResponder];
        [_hotelText becomeFirstResponder];
    }else{
        [_hotelText resignFirstResponder]; /// ///////////////// 跳转页
    }
    
    
    return YES;
}

- (void)leaveAction:(id)sender{
    LeaveViewController * leave = [[LeaveViewController alloc] init];
    [self presentViewController:leave animated:NO completion:Nil];
    [leave release];
}

- (void)photoAction:(id)sender{
    
    _view1  = [[UIImageView alloc] initWithFrame:CGRectMake(10, 460, 300, 110)];
    [_view1 setImage:[UIImage imageNamed:@"user_info_map_shadow_cover@2x~ipad.png"]];
    _view1.userInteractionEnabled = YES;
    [self.view addSubview:_view1];
    
    UIButton * take = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    [take setBackgroundColor:[UIColor clearColor]];
    [take setTitle:@"拍照" forState:UIControlStateNormal];
    [take addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    [take setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_view1 addSubview:take];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(5, 32, 300, 2)];
    [label setText:@"--------------------------------------------------------------"];
    [label setTextColor:[UIColor whiteColor]];
    [_view1 addSubview:label];
    
    UIButton * photo = [[UIButton alloc] initWithFrame:CGRectMake(0, 36, 300, 30)];
    [photo setBackgroundColor:[UIColor clearColor]];
    [photo setTitle:@"从相册上传" forState:UIControlStateNormal];
    [photo addTarget:self action:@selector(pictureAction:) forControlEvents:UIControlEventTouchUpInside];
    [photo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_view1 addSubview:photo];
    
    UIButton * cancel = [[UIButton alloc] initWithFrame:CGRectMake(0, 61, 300, 46)];
    [cancel setBackgroundColor:[UIColor whiteColor]];
    [cancel addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_view1 addSubview:cancel];
    
    
    [_view1 release];
    [take release];
    [label release];
    [photo release];
    [cancel release];
}

- (void)trackAction:(id)sender{
    _view2  = [[UIImageView alloc] initWithFrame:CGRectMake(10, 460, 300, 110)];
    [_view2 setImage:[UIImage imageNamed:@"user_info_map_shadow_cover@2x~ipad.png"]];
    _view2.userInteractionEnabled = YES;
    [self.view addSubview:_view2];
    
    UIButton * low = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    [low setBackgroundColor:[UIColor clearColor]];
    [low setTitle:@"我在步行/骑车" forState:UIControlStateNormal];
    [low addTarget:self action:@selector(lowAction:) forControlEvents:UIControlEventTouchUpInside];
    [low setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_view2 addSubview:low];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(5, 32, 300, 2)];
    [label setText:@"--------------------------------------------------------------"];
    [label setTextColor:[UIColor whiteColor]];
    [_view1 addSubview:label];
    
    UIButton * hight = [[UIButton alloc] initWithFrame:CGRectMake(0, 36, 300, 30)];
    [hight setBackgroundColor:[UIColor clearColor]];
    [hight setTitle:@"我在开车/乘车" forState:UIControlStateNormal];
    [hight addTarget:self action:@selector(hightAction:) forControlEvents:UIControlEventTouchUpInside];
    [hight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_view2 addSubview:hight];
    
    UIButton * cancel = [[UIButton alloc] initWithFrame:CGRectMake(0, 61, 300, 46)];
    [cancel setBackgroundColor:[UIColor whiteColor]];
    [cancel addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_view2 addSubview:cancel];
    
    
    [_view2 release];
    [low release];
    [label release];
    [hight release];
    [cancel release];

}



- (void)lowAction:(id)sender{
    
    _map = [[Map alloc] initWithFrame:CGRectMake(0, 30, 320, self.view.frame.size.height - 20)];
    [self.view addSubview:_map];
    [_map release];
    [_map mapViewShow];
    [_map modeAction];
    

    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 30)];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(mapDisappear:) forControlEvents:UIControlEventTouchUpInside];
    [_map.mapView addSubview:button];
    [button release];
    
}

- (void)mapDisappear:(id)sender{
    _map.mapView.hidden = YES;
    _view1.hidden = YES;
    _view2.hidden = YES;
}

- (void)hightAction:(id)sender{
    
    _map = [[Map alloc] initWithFrame:CGRectMake(0, 30, 320, self.view.frame.size.height - 20)];
    [_map mapViewShow];
    [_map modeAction];
    [self.view addSubview:_map];
    [_map release];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 30)];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(mapDisappear:) forControlEvents:UIControlEventTouchUpInside];
    [_map.mapView addSubview:button];
    [button release];
    
    
    
}




- (void)cancelAction:(id)sender{
    _view1.hidden = YES;
    _view2.hidden = YES;
}

- (void)takePhoto:(id)sender{
    //先设定sourceType为相机，然后判断相机是否可用（ipod）没相机，不可用将sourceType设定为相片库
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
    //        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //    }
    //sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
    //sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //图片库
    //sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    [self presentViewController:picker animated:YES completion:Nil];//进入照相界面
   
    [picker release];
}

- (void)pictureAction:(id)sender{
    UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //pickerImage.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        
    }
    pickerImage.delegate = self;
    pickerImage.allowsEditing = NO;
    [self presentViewController:pickerImage animated:YES completion:Nil];//进入照相界面    [pickerImage release];
    
    /*
     如果从一个导航按钮处呈现，使用：
     presentPopoverFromBarButtonItem:permittedArrowDirections:animated:；
     如果要从一个视图出呈现，使用：
     presentPopoverFromRect:inView:permittedArrowDirections:animated:
     
     如果设备旋转以后，位置定位错误需要在父视图控制器的下面方法里面重新定位：
     didRotateFromInterfaceOrientation:（在这个方法体里面重新设置rect）
     然后再次调用：
     - (void)presentPopoverFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
     */
    //UIPopoverController只能在ipad设备上面使用；作用是用于显示临时内容，特点是总是显示在当前视图最前端，当单击界面的其他地方时自动消失。
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
