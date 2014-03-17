//
//  Map.h
//  项目
//
//  Created by 啊啊 on 14-3-10.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Map : UIView<MAMapViewDelegate,CLLocationManagerDelegate>
{
    CLLocationManager* _locationManager;
}

@property (nonatomic, retain) MAMapView *mapView;
@property (retain, nonatomic) NSString *longitudeText;
@property (retain, nonatomic) NSString *latituduText;
@property (retain, nonatomic) UIActivityIndicatorView *activity;
@property (nonatomic, retain) MAPolygon * polygon;
@property (nonatomic,retain) NSMutableArray * arr;
@property (nonatomic,retain)NSString * ceshi;

- (void)mapViewShow;
- (void)modeAction;



@end
