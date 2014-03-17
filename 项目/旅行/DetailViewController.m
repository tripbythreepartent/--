//
//  DetailViewController.m
//  项目
//
//  Created by dlios17 on 14-3-12.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailSecondCell.h"
#import "DetailFirstCell.h"


@interface DetailViewController ()
{
    NSInteger _count;
}
@end

@implementation DetailViewController

- (void)dealloc
{
    [_infoArray release];
    [_arr release];
    [_allDic release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.hidesBottomBarWhenPushed = YES;  //隐藏tabbar
        self.navigationController.navigationBar.translucent = NO;
        
        self.infoArray = [[NSMutableArray alloc] init];
        self.arr = [[NSMutableArray alloc] init];
        self.allDic = [[NSMutableDictionary alloc] init];
      

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self connectionDetail];

}



#pragma mark -
#pragma mark 网络数据请求，解析
- (void)connectionDetail{
    
    NSString * str = [NSString stringWithFormat:@"%@%@/waypoints/",DetailConnection,self.num];
    NSLog(@"num ======= %@",self.num);
    [AsyMid asynGetWithUrl:str parmaters:Nil finishBlock:^(id response){
        if ([response isKindOfClass:[NSDictionary class]]) {
            [_allDic addEntriesFromDictionary:response];
            [self.tableView reloadData];
            
        }
        if ([response isKindOfClass:[NSArray class]]) {
            [_infoArray addObjectsFromArray:response];
        }
    }];
}

#pragma mark -
#pragma mark tableViewDelegate
static NSInteger number = 0;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /************************判断每个section有多少row********************/
    if (section == 0) {
        return 1;
    }else{
        number = [[[[_allDic objectForKey:@"days"] objectAtIndex:(section-1)] objectForKey:@"waypoints"] count];
        
        return number;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *first = @"first";
    static NSString *second = @"second";
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        DetailFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:first];
        if (!cell) {
            cell = [[DetailFirstCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:first];
        }
        
        NSURL * imageUrl = [[_allDic objectForKey:@"user"] objectForKey:@"avatar_m"];
        [cell.headImage setImageWithURL:imageUrl];
        
        NSString * name = [_allDic objectForKey:@"name"] ;
        [cell.nameLabel setText:name];
        

        NSDate * date = [NSDate dateWithTimeIntervalSince1970:[[_allDic objectForKey:@"date_added"] doubleValue]];
        
        NSDateFormatter *dateformatter = [[[NSDateFormatter alloc] init] autorelease];
        [dateformatter setDateFormat:@"yyyy.MM.dd"];
        NSString *day = [dateformatter stringFromDate:date];
        [cell.dayLabel setText:day];
        
        
        NSString * day_count = [NSString stringWithFormat:@"%@天",[_allDic objectForKey:@"day_count"]];
        [cell.day_counts setText:day_count];
        
        NSString * save = [NSString stringWithFormat:@"%@人收藏",[_allDic objectForKey:@"recommendations"]];
        [cell.saveLabel setText:save];
        
        NSURL * mapUrl = [_allDic objectForKey:@"trackpoints_thumbnail_image"] ;
        [cell.mapImage setImageWithURL:mapUrl];
        
        NSString * flight = [NSString stringWithFormat:@"%@航班",[[_allDic objectForKey:@"poi_infos_count"] objectForKey:@"flight"]];
        [cell.plane setTitle:flight forState:UIControlStateNormal];
        
        NSString * hotel = [NSString stringWithFormat:@"%@旅店",[[_allDic objectForKey:@"poi_infos_count"] objectForKey:@"hotel"]];
        [cell.hotel setTitle:hotel forState:UIControlStateNormal];
        
        NSString * sights = [NSString stringWithFormat:@"%@景点",[[_allDic objectForKey:@"poi_infos_count"] objectForKey:@"sights"]];
        [cell.outlook setTitle:sights forState:UIControlStateNormal];
        
        NSString * restaurant = [NSString stringWithFormat:@"%@餐厅",[[_allDic objectForKey:@"poi_infos_count"] objectForKey:@"restaurant"]];
        [cell.eat setTitle:restaurant forState:UIControlStateNormal];
        return cell;
    }
    else
    {
        DetailSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:second];
        if (!cell) {
            cell = [[DetailSecondCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:second];
        }
        
        if (indexPath.row < number) {
            NSURL * imageUrl =  [[[[[_allDic objectForKey:@"days"] objectAtIndex:indexPath.section - 1] objectForKey:@"waypoints"] objectAtIndex:indexPath.row]objectForKey:@"photo" ];
//            [cell.bigImage setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"placeholder"]];
            [cell.bigImage setImageWithURL:imageUrl];
//            CGSize size = cell.bigImage.image.size;
//            CGFloat scale = size.width/280;
//            CGFloat height = size.height/scale;
//            cell.bigImage.frame = CGRectMake(20, 0, 280, height);
            
            NSString * text =  [[[[[_allDic objectForKey:@"days"] objectAtIndex:indexPath.section - 1] objectForKey:@"waypoints"] objectAtIndex:indexPath.row]objectForKey:@"text" ];
            cell.messageLabel.text = text;
            
            
            NSString * day =  [[[[[_allDic objectForKey:@"days"] objectAtIndex:indexPath.section - 1] objectForKey:@"waypoints"] objectAtIndex:indexPath.row]objectForKey:@"local_time" ];
            //字符串替换
            day = [day stringByReplacingOccurrencesOfString:@"-" withString:@"."];
            //字符串截取
            day = [day substringWithRange:NSMakeRange(5,11)] ;
            [cell.timeLabel setText:day];
            
            NSString * province =  [[[[[_allDic objectForKey:@"days"] objectAtIndex:indexPath.section - 1] objectForKey:@"waypoints"] objectAtIndex:indexPath.row]objectForKey:@"province" ];
            NSString * country =  [[[[[_allDic objectForKey:@"days"] objectAtIndex:indexPath.section - 1] objectForKey:@"waypoints"] objectAtIndex:indexPath.row]objectForKey:@"country" ];
            
            NSString * city =  [[[[[_allDic objectForKey:@"days"] objectAtIndex:indexPath.section - 1] objectForKey:@"waypoints"] objectAtIndex:indexPath.row]objectForKey:@"city" ];
            
            NSString * position = [NSString stringWithFormat:@"%@%@%@",country,province,city];
            [cell.position setTitle:position forState:UIControlStateNormal];
            
            NSNumber * loveNum =  [[[[[_allDic objectForKey:@"days"] objectAtIndex:indexPath.section - 1] objectForKey:@"waypoints"] objectAtIndex:indexPath.row]objectForKey:@"recommendations" ] ;
            NSString * love = [NSString stringWithFormat:@"%@",loveNum];
            [cell.love setTitle:love forState:UIControlStateNormal];
            
//            [cell.love setFrame:CGRectMake(220,cell.bigImage.frame.size.height-50,50,40)];
        }
        
        return cell;
    }
}

//设置tableview行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 300;
    }
    return 280;
    
}

//设置section高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }else{
        return 50;
    }
}

//设置section内容
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {

        return Nil;
        
    }else{
        UIButton *sectionHeader = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
        [sectionHeader setBackgroundColor:[UIColor orangeColor]];
        
        NSNumber * Num =  [[[_allDic objectForKey:@"days"] objectAtIndex:section - 1] objectForKey:@"day"];
        NSString * date = [[[_allDic objectForKey:@"days"] objectAtIndex:section - 1] objectForKey:@"date"];
    
        //字符串替换
        date = [date stringByReplacingOccurrencesOfString:@"-" withString:@"."];
//        //字符串截取
//        date = [date substringWithRange:NSMakeRange(5,5)] ;
        NSString * day= [NSString stringWithFormat:@"第%@天  %@",Num,date];
        [sectionHeader setTitle:day forState:UIControlStateNormal];
        [self.view addSubview:sectionHeader];
        return [sectionHeader autorelease];
    
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[_allDic objectForKey:@"days"] count] + 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
