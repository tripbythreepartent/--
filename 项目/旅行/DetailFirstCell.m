//
//  DetailFirstCell.m
//  项目
//
//  Created by dlios17 on 14-3-12.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "DetailFirstCell.h"

@implementation DetailFirstCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.headImage = [[UIImageView alloc] init];
        [_headImage setBackgroundColor:[UIColor lightGrayColor]];
        _headImage.layer.masksToBounds = YES;
        _headImage.layer.cornerRadius = 18;
        [self.contentView addSubview:_headImage];
        [_headImage release];
        
        self.nameLabel = [[UILabel alloc] init];
        [self.nameLabel setTextColor:[UIColor blueColor]];
        [self.nameLabel setFont:[UIFont systemFontOfSize:16.0]];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel release];
        
        self.dayLabel = [[UILabel alloc] init];
        [self.dayLabel setFont:[UIFont systemFontOfSize:10.0]];
        [self.dayLabel setTextColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:_dayLabel];
        [_dayLabel release];
        
        self.day_counts = [[UILabel alloc] init];
        [self.day_counts setFont:[UIFont systemFontOfSize:11.0]];
        [self.day_counts setTextColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:_day_counts];
        [_day_counts release];
        
        self.saveLabel = [[UILabel alloc] init];
        [self.saveLabel setFont:[UIFont systemFontOfSize:12.0]];
        [self.saveLabel setTextColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:_saveLabel];
        [_saveLabel release];
        
        self.lineImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_lineImage];
        [_lineImage release];
        
        self.mapImage = [[UIImageView alloc] init];//-------------新加-------------//
        [self.contentView addSubview:_mapImage];
        [_mapImage release];
        
        self.lodeBackground = [[UIImageView alloc] init];
        [self.contentView addSubview:_lodeBackground];
        [_lodeBackground release];
        
        self.plane = [[UIButton alloc] init];
        [self.plane setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.plane.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [self.contentView addSubview:_plane];
        [_plane release];
        
        self.hotel = [[UIButton alloc] init];
        [self.hotel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.hotel.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [self.contentView addSubview:_hotel];
        [_hotel release];
        
        self.outlook = [[UIButton alloc] init];
        [self.outlook setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.outlook.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [self.contentView addSubview:_outlook];
        [_outlook release];
        
        self.eat = [[UIButton alloc] init];
        [self.eat setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.eat.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [self.contentView addSubview:_eat];
        [_eat release];
        
        self.tripWay = [[UIButton alloc] init];
        [self.contentView addSubview:_tripWay];
        [_tripWay release];
        
        
    }
    return self;
}

- (void)layoutSubviews{
    [_headImage setFrame:CGRectMake(10, 20, 36, 36)];
    [_nameLabel setFrame:CGRectMake(50, 25, 200, 15)];
    [_dayLabel setFrame:CGRectMake(50, 43, 200, 15)];
    [_day_counts setFrame:CGRectMake(110, 43, 50, 15)];
    [_saveLabel setFrame:CGRectMake(150, 43, 80, 15)];
    [_lineImage setFrame:CGRectMake(10,120, 300, 5)];
    [_lodeBackground setFrame:CGRectMake(10, 130, 300, 20)];
    [_plane setFrame:CGRectMake(13, 240, 100, 20)];
    [_hotel setFrame:CGRectMake(170, 240, 100, 20)];
    [_outlook setFrame:CGRectMake(13, 260, 100, 20)];
    [_eat setFrame:CGRectMake(170, 260, 100, 20)];
    [_mapImage setFrame:CGRectMake(5, 60, 310, 175)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
