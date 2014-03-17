//
//  ShezhiController.h
//  项目
//
//  Created by Jason on 14-3-7.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import <UIKit/UIKit.h>
//设置界面

@interface ShezhiController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UITableViewCell  * _mycell;
    UIAlertView *_alert;
    UIImageView *_vie;
}
@property(nonatomic,retain)NSMutableArray *_array;

@end
