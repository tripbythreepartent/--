//
//  FindViewController.h
//  项目
//
//  Created by 啊啊 on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_allArray;
    UITableView *_first;
    UITableView *_second;
    UITableView *_third;
}
@end
