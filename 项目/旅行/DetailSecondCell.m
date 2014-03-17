//
//  DetailSecondCell.m
//  项目
//
//  Created by dlios17 on 14-3-12.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "DetailSecondCell.h"


@implementation DetailSecondCell
- (void)dealloc
{
    [_bigImage release];
    [_messageLabel release];
    [_timeLabel release];
    [_position release];
    [_arr release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        _arr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
//
        
        self.day_count = [[UILabel alloc] init];
        [_day_count setBackgroundColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:_day_count];
        [_day_count release];
        
        self.bigImage = [[UIImageView alloc] init];
        [_bigImage setBackgroundColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:_bigImage];
        [_bigImage release];
        
        self.love = [[UIButton alloc] init];
        [_love setBackgroundImage:[UIImage imageNamed:@"float_likes"] forState:UIControlStateNormal];
        self.love.contentEdgeInsets = UIEdgeInsetsMake(0, 27, 0, 0);
        [self.love.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [self.contentView addSubview:_love];
        [_love release];
        
        self.msg = [[UIButton alloc] init];
        [_msg setBackgroundImage:[UIImage imageNamed:@"float_comment"] forState:UIControlStateNormal];
        [self.contentView addSubview:_msg];
        [_msg release];
        
        self.messageLabel = [[UILabel alloc] init];
        [_messageLabel setFont:[UIFont systemFontOfSize:15.0]];
        [self.contentView addSubview:_messageLabel];
        [_messageLabel release];
        
        self.timeLabel = [[UILabel alloc] init];
        [self.timeLabel setFont:[UIFont systemFontOfSize:12.0]];
        [self.contentView addSubview:_timeLabel];
        [_timeLabel release];
        
        self.position = [[UIButton alloc] init];
        _position.layer.cornerRadius = 5;
        [_position setBackgroundColor:[UIColor lightGrayColor]];
        [_position setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_position.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
        [self.contentView addSubview:_position];
        [_position release];
        
        
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    
//    [_bigImage setFrame:CGRectMake(10, _day_count.frame.origin.y+_day_count.frame.size.height+7, 300, 300*h/w)];
    [_bigImage setFrame:CGRectMake(5, 5, 300, 200)];
    
    [_love setFrame:CGRectMake(190, 160, 60, 30)];
    
    [_msg setFrame:CGRectMake(250, 160, 50, 30)];
    
    [_messageLabel setFrame:CGRectMake(15, _bigImage.frame.origin.y+_bigImage.frame.size.height+5, 289, 20)];
    self.messageLabel.numberOfLines = 0;
    [self.messageLabel sizeToFit];
    [_timeLabel setFrame:CGRectMake(15, _messageLabel.frame.origin.y+_messageLabel.frame.size.height+7, 150, 15)];
    [_position setFrame:CGRectMake(200, _messageLabel.frame.origin.y+_messageLabel.frame.size.height+8, 100, 15)];


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
