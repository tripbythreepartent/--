//
//  LogViewController.h
//  项目
//
//  Created by 啊啊 on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Map.h"

@interface LogViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>

{
    UIImageView * _view1; //照相视图
    UIImageView * _view2; //轨迹视图
    UITextField * _startCity;
    UITextField * _endCity;
    UITextField * _hotelText;
}

@property(nonatomic,retain)Map * map; //地图视图

@end
