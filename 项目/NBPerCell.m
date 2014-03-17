//
//  NBPerCell.m
//  项目框架最终
//
//  Created by ZT on 14-3-11.
//  Copyright (c) 2014年 zhaotian. All rights reserved.
//

#import "NBPerCell.h"

@implementation NBPerCell
- (void)dealloc
{
    [_userImage release];
    [_userName release];
    [_atLable release];
    [_traverName release];
    [_backImage release];
    [_loveButton release];
    [_messageButton release];
    [_describeLable release];
    [_timeLable release];
    [_whiteView release];
    [_hiddenButton release];
    
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //        用户头像
        self.userImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _userImage.layer.cornerRadius = 18;
        _userImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_userImage];
        [_userImage release];
        
        //        用户名
        self.userName = [[UILabel alloc] initWithFrame:CGRectZero];
        _userName.textColor = [UIColor blueColor];
        //        _usernameButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        _userName.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_userName];
        [_userName release];
        
        //        字：“在”
        self.atLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_atLable setTextColor:[UIColor darkGrayColor]];
        
        _atLable.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_atLable];
        [_atLable release];
        
        //        旅行日记标题
        self.traverName= [[UILabel alloc] initWithFrame:CGRectZero];
        _traverName.textColor = [UIColor blueColor];
        _traverName.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_traverName];
        [_traverName release];
        
        //        背景图
        self.backImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        _backImage.userInteractionEnabled = YES;
        _backImage.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_backImage];
        [_backImage release];
        
        //        白色底片
        self.whiteView = [[UIView alloc] initWithFrame:CGRectZero];
        [_whiteView setBackgroundColor:[UIColor whiteColor]];
        //        _whiteView.userInteractionEnabled = YES;
        [self.contentView addSubview:_whiteView];
        [_whiteView release];
        
        //        时间
        self.timeLable = [[UILabel alloc]initWithFrame:CGRectZero];
        [_timeLable setTextColor:[UIColor grayColor]];
        _timeLable.font = [UIFont systemFontOfSize:12.0];
        [_whiteView addSubview:_timeLable];
        [_timeLable release];
        
        //        描述
        self.describeLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_describeLable setTextColor:[UIColor grayColor]];
        _describeLable.font = [UIFont systemFontOfSize:16.0];
        [_whiteView addSubview:_describeLable];
        [_describeLable release];
        
        //        喜欢
        self.loveButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_loveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loveButton setBackgroundImage:[UIImage imageNamed:@"love.png"] forState:UIControlStateNormal];
        _loveButton.selected = NO;
        [_loveButton addTarget:self action:@selector(loveAction:) forControlEvents:UIControlEventTouchUpInside];
        [_backImage addSubview:_loveButton];
        [_loveButton release];
        
        //        信息
        self.messageButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_messageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_messageButton addTarget:self action:@selector(messageAction:) forControlEvents:UIControlEventTouchUpInside];
        [_messageButton setBackgroundImage:[UIImage imageNamed:@"message.png"] forState:UIControlStateNormal];
        [_backImage addSubview:_messageButton];
        [_messageButton release];
        
        //        地点
        self.locationButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_locationButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _locationButton.titleLabel.font= [UIFont systemFontOfSize:12.0];
        [_locationButton addTarget:self action:@selector(locationAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //    改变字体位置 上左下右
        [_locationButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 50, 0, 0)];
        //    改变图片位置
        [_locationButton setImageEdgeInsets:UIEdgeInsetsMake(0, 50, 0, 0)];
        [_whiteView addSubview:_locationButton];
        [_locationButton release];
        
        //        隐藏信息
        self.hiddenButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_hiddenButton setBackgroundColor:[UIColor lightGrayColor]];
        
        [_hiddenButton addTarget:self action:@selector(hiddenAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_hiddenButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _hiddenButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_hiddenButton];
        [_hiddenButton release];
        
        
    }
    return self;
}

-(void)locationAction:(id)sender
{
    
    NSLog(@"旅行地点");
    
}
-(void)hiddenAction:(id)sender
{
    
    NSLog(@"隐藏消息");
    
}
//喜欢按钮
-(void)loveAction:(id)sender
{
    NSLog(@"喜欢");
    UIButton * bt = (UIButton *)sender;
    if ([bt isSelected]) {
        [_loveButton setBackgroundImage:[UIImage imageNamed:@"love.png"] forState:UIControlStateNormal];
        [bt setSelected:NO];
    }
    else
    {
        [_loveButton setBackgroundImage:[UIImage imageNamed:@"love1.png"] forState:UIControlStateNormal];
        bt.selected = YES;
        
    }
    
}
-(void)messageAction:(id)sender
{
    
    NSLog(@"message");
}
-(void)layoutSubviews
{
    //    默认不使用父类的大小（一小条）
    [super layoutSubviews];
    
    [_userImage setFrame:CGRectMake(10, 0, 36, 36)];
    [_userName setFrame:CGRectMake(55, 3, 100, 20)];
    [_atLable setFrame:CGRectMake(115, 15, 15, 15)];
    [_traverName setFrame:CGRectMake(110, 15, 150, 15 )];
    [_backImage setFrame:CGRectMake(45, 35, 255, 120)];
    [_whiteView setFrame:CGRectMake(45, 155, 255, 45)];
    [_timeLable setFrame:CGRectMake(5, 25, 150, 15)];
    [_describeLable setFrame:CGRectMake(5, 5, 255, 20)];
    [_loveButton setFrame:CGRectMake(180, 75, 25, 20)];
    [_messageButton setFrame:CGRectMake(203, 75, 25, 20)];
    [_locationButton setFrame:CGRectMake(100, 25, 120, 15)];
    [_hiddenButton setFrame:CGRectMake(45, 200, 255, 20)];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
