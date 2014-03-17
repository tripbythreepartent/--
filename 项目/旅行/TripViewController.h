//
//  TripViewController.h
//  项目
//
//  Created by 啊啊 on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"

@interface TripViewController : BaseTableViewController

{
    NSMutableArray * _arr;
    NSMutableDictionary *_allDic;
    NSMutableArray *_infoArray;
}

@property (nonatomic,retain) MJRefreshHeaderView *header;
@property (nonatomic,retain) MJRefreshFooterView *footer;


@end
