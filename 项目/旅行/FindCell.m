//
//  FindCell.m
//  项目
//
//  Created by 孔医己 on 14-3-9.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "FindCell.h"

@implementation FindCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.cellImages = [[UIImageView alloc] init];
        self.cellImages.layer.masksToBounds = YES;
        self.cellImages.layer.cornerRadius = 5;
        [self.contentView addSubview:_cellImages];
        [_cellImages release];
        
        self.timeLabel = [[UILabel alloc] init];
        [self.timeLabel setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:9.0]];
        [self.contentView addSubview:_timeLabel];
        [_timeLabel release];
        
        self.positionLabel = [[UILabel alloc] init];
        [self.positionLabel setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:12.0]];
        [self.positionLabel setTextColor:[UIColor lightGrayColor]];
        [self.positionLabel setTextAlignment:NSTextAlignmentRight];
        [self.contentView addSubview:_positionLabel];
        [_positionLabel release];
        
        self.messageLabel = [[UILabel alloc] init];
        [self.messageLabel setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:12.0]];
        self.messageLabel.lineBreakMode = UILineBreakModeWordWrap;
        self.messageLabel.numberOfLines = 0;
        [self.messageLabel setTextColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:_messageLabel];
        [_messageLabel release];
    }
    return self;
}

- (void)layoutSubviews{
    [_cellImages setFrame:CGRectMake(0, 0, 98, 90)];
    [_timeLabel setFrame:CGRectMake(0 , 100, 50, 15)];
    [_positionLabel setFrame:CGRectMake(43, 100, 50, 15)];
    [_messageLabel setFrame:CGRectMake(0, 115, 98, 60)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
