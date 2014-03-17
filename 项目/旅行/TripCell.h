//
//  TripCell.h
//  项目
//
//  Created by 啊啊 on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import <UIKit/UIKit.h>


static const CGSize progressViewSize = { 200.0f, 30.0f };

@interface TripCell : UITableViewCell

@property (nonatomic,retain) UIImageView *show;          //cell底层imageView
@property (nonatomic,retain) UILabel *name;              //标题
@property (nonatomic,retain) UIImageView *headImage;     //头像
@property (nonatomic,retain) UIImageView * imageStyle;   //头像背景，白边
@property (nonatomic,retain) UIImageView *leftImage;     //左侧小图片
@property (nonatomic,retain) UILabel *dateLabel;         //日期
@property (nonatomic,retain) UILabel *dayLabel;          //几天
@property (nonatomic,retain) UILabel *position;          //地理位置
@property (nonatomic,retain) UILabel *userName;          //用户名
@property (nonatomic,retain) UIImageView *bestTrip;      //bestTrip
@property (nonatomic,retain) UIImageView *onGoing;       //onGoing

@property (nonatomic) CGFloat progress;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *progressViews;

@end
