//
//  EditLogViewController.h
//  项目
//
//  Created by 啊啊 on 14-3-7.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditLogViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    UITableView * _tableView;
    
    NSMutableArray * _arr;
    NSMutableDictionary *_allDic;
    NSMutableArray *_infoArray;
    
}

@end
