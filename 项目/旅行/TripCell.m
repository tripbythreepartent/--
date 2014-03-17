//
//  TripCell.m
//  项目
//
//  Created by 啊啊 on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "TripCell.h"
#import "THProgressView.h"

@implementation TripCell

-(void)dealloc{
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //cell背景图imageView
        
        self.show = [[UIImageView alloc] initWithFrame:CGRectZero];
        _show.layer.masksToBounds = YES;
        _show.layer.cornerRadius = 10;
        [self sliderToall];
//        _show.clipsToBounds = YES;   //修复图片height压缩变形
        [self.contentView addSubview:_show];
        [_show release];
        
        //标题
        self.name=[[UILabel alloc] initWithFrame:CGRectZero];
        [_name setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:15]];
        [_name setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_name];
        [_name release];
        
        //左侧小图片
        self.leftImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.show addSubview:_leftImage];
        [_leftImage release];
        
        //日期
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [_dateLabel setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:8.0]];
        [_dateLabel setTextColor:[UIColor whiteColor]];
        [_dayLabel.layer setShadowColor:[UIColor blackColor].CGColor];
        [_dayLabel.layer setShadowOffset:CGSizeMake(2, 2)];
        [self.show addSubview:_dateLabel];
        [_dateLabel release];
        
        //几天
        self.dayLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [_dayLabel setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:8.0]];
        [_dayLabel setTextColor:[UIColor whiteColor]];
        [self.show addSubview:_dayLabel];
        [_dateLabel release];
        
        //地理位置
        self.position = [[UILabel alloc] initWithFrame:CGRectZero];
        [_position setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:10.0]];
        [_position setTextColor:[UIColor whiteColor]];
        [self.show addSubview:_position];
        [_position release];
        
        //头像背景图，白边
        self.imageStyle = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageStyle.layer.cornerRadius=16.0;
        //图片形状随着layer层改变而改变
        _imageStyle.layer.masksToBounds = YES;
        [_imageStyle setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:_imageStyle];
        [_imageStyle release];
        
        //头像
        self.headImage=[[UIImageView alloc] initWithFrame:CGRectZero];
        _headImage.layer.cornerRadius=15.0;
        //把照片随UIViewImage变
        _headImage.layer.masksToBounds = YES;
        [_headImage setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:_headImage];
        [_headImage release];
        
        //用户名
        self.userName = [[UILabel alloc] initWithFrame:CGRectZero];
        [_userName setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:8.0]];
        [_userName setTextColor:[UIColor whiteColor]];
        [self.show addSubview:_userName];
        [_userName release];
        
        //bestTrip
        self.bestTrip = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.show addSubview:_bestTrip];
        [_bestTrip release];
        
        //onGoing
        self.onGoing = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.show addSubview:_onGoing];
        [_onGoing release];
        
    }
    return self;
}
-(void)layoutSubviews{
    [_show setFrame:CGRectMake(10, 3, 300, 200)];
    [_name setFrame:CGRectMake(30, 5, 200, 40)];
    [_leftImage setFrame:CGRectMake(20, 30, 10, 25)];
    [_dateLabel setFrame:CGRectMake(25, 35, 50, 10)];
    [_dayLabel setFrame:CGRectMake(75, 35, 20, 10)];
    [_position setFrame:CGRectMake(25, 50, 80, 10)];
    [_headImage setFrame:CGRectMake(30, 135, 30, 30)];
    [_imageStyle setFrame:CGRectMake(29, 134, 32, 32)];
    [_userName setFrame:CGRectMake(15, 170, 100, 10)];
    [_bestTrip setFrame:CGRectMake(242, 10, 58, 30)];
    [_onGoing setFrame:CGRectMake(255, 0, 42, 20)];
}

- (void)sliderToall{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(10, 3, 300, 200)];
    topView.backgroundColor = [UIColor lightGrayColor];
    
    THProgressView *topProgressView = [[THProgressView alloc] initWithFrame:CGRectMake(CGRectGetMidX(topView.frame) - progressViewSize.width / 2.0f,
                                                                                       CGRectGetMidY(topView.frame) - progressViewSize.height / 2.0f,
                                                                                       progressViewSize.width,
                                                                                       progressViewSize.height)];
    topProgressView.borderTintColor = [UIColor whiteColor];
    topProgressView.progressTintColor = [UIColor grayColor];
    topView.layer.masksToBounds = YES;
    topView.layer.cornerRadius = 10;
    [topView addSubview:topProgressView];
    [self.contentView addSubview:topView];
    
    
    self.progressViews = @[ topProgressView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress) userInfo:nil repeats:NO];
}

- (void)updateProgress
{
    self.progress = 1.0f;
    //    if (self.progress > 1.0f) {
    //        self.progress = 0;
    //    }
    
    [self.progressViews enumerateObjectsUsingBlock:^(THProgressView *progressView, NSUInteger idx, BOOL *stop) {
        [progressView setProgress:self.progress animated:YES];
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
