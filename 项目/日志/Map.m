//
//  Map.m
//  项目
//
//  Created by 啊啊 on 14-3-10.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "Map.h"

@implementation Map

- (void)dealloc
{
    [_mapView release];
    [_longitudeText release];
    [_latituduText release];
    [_locationManager release];
    [_arr release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.mapView=[[MAMapView alloc] initWithFrame:frame];
        self.mapView.delegate = self;
        [self mapViewShow];
        [self modeAction];
        [self addSubview:self.mapView];
        _arr = [[NSMutableArray alloc] init];
        
    }
    return self;
}

//开启定位
- (void)mapViewShow{
    self.mapView.showsUserLocation = YES; //YES 为打开定位,NO 为关闭定位
}

//定位显示模式有三种,分别是在地图上显示位置(默认模式)、地图跟着位置移动以及随着方向旋转
- (void)modeAction {
    [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES]; //设置 为地图跟着位置移动
    
}

//定位更新时的回调函数
-(void)mapView:(MAMapView*)mapView didUpdateUserLocation:(MAUserLocation*)userLocat ionupdatingLocation:(BOOL)updatingLocation{
    NSLog(@"userlocate == %@",userLocat);
    _ceshi = @"定位回调";
}

//定位获取失败时的回调函数
- (void)mapView:(MAMapView*)mapView didFailToLocateUserWithError:(NSError*)error{
    NSLog(@"locError:%@", error);
    
    
}








@end
