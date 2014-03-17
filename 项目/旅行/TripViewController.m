//
//  TripViewController.m
//  项目
//
//  Created by 啊啊 on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "TripViewController.h"
#import "FindViewController.h"
#import "MapViewController.h"
#import "TripCell.h"
#import "DetailViewController.h"


@interface TripViewController ()

@end

@implementation TripViewController
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
        _infoArray = [[NSMutableArray alloc] init];
        _arr = [[NSMutableArray alloc] init];
        _allDic = [[NSMutableDictionary alloc] init];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    
    [self createNavigation]; //创建navigationCotroller
    [self createTableView];  //创建tableView

    
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = self.tableView;
    header.delegate = self;
    // 自动刷新
    [header beginRefreshing];
    self.header = header;
    
    // 3.2.上拉加载更多
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = self.tableView;
    footer.delegate = self;
    self.footer = footer;
    
}

- (void)createNavigation{
    
    UIBarButtonItem * leftHot = [[UIBarButtonItem alloc] initWithTitle:@"热门" style:UIBarButtonItemStylePlain target:self action:Nil];
    leftHot.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftHot;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    
    UIButton * midFind = [[UIButton alloc] initWithFrame:CGRectMake(140, 30, 40, 20)];
    [midFind setTitle:@"发现" forState:UIControlStateNormal];
    [midFind.titleLabel setFont:[UIFont systemFontOfSize:17.0]];
    [midFind setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [midFind addTarget:self action:@selector(findAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = midFind;
    
    UIBarButtonItem * rightMap = [[UIBarButtonItem alloc] initWithTitle:@"地图" style:UIBarButtonItemStylePlain target:self action:@selector(mapAction:)];
    rightMap.tintColor = [UIColor blueColor];
    self.navigationItem.rightBarButtonItem = rightMap;
    
    [leftHot release];
    [rightMap release];
}

- (void)findAction:(id)sender{
    FindViewController * find = [[FindViewController alloc] init];
    [self.navigationController pushViewController:find animated:YES];
    [find release];
}

- (void)mapAction:(id)sender{
    MapViewController * map = [[MapViewController alloc] init];
    [self.navigationController pushViewController:map animated:YES];
    [map release];
}

#pragma mark-
#pragma mark tableView
-(void)createTableView{
    self.tableView.rowHeight = 206;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"first";
    TripCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[TripCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identify];
    }
    NSDictionary *dic = [_arr objectAtIndex:indexPath.row];
    NSString *name = [dic objectForKey:@"name"];
    NSURL *url = [[dic objectForKey:@"user"] objectForKey:@"avatar_m"];
    NSURL *showUrl = [dic objectForKey:@"cover_image"];
    NSDate * aDate = [NSDate dateWithTimeIntervalSince1970:[[dic objectForKey:@"date_added"] doubleValue]];
    NSDateFormatter *dateformatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateformatter setDateFormat:@"yyyy.MM.dd"];
    NSString *date = [dateformatter stringFromDate:aDate];
    
    cell.name.text = name;
    [cell.name setFont:[UIFont fontWithName:@"Verdana-Bold" size:15]];
    [cell.show setImageWithURL:showUrl];
    [cell.leftImage setImage:[UIImage imageNamed:@"trips_cover_date_bg.png"]];
    cell.dateLabel.text = date;
    [cell.headImage setImageWithURL:url];
    cell.dayLabel.text = [NSString stringWithFormat:@"%@天",[dic objectForKey:@"day_count"]];
    cell.position.text = [dic objectForKey:@"popular_place_str"];
    cell.userName.text = [NSString stringWithFormat:@"By %@",[[dic objectForKey:@"user"] objectForKey:@"name"]];
    [cell.onGoing setImage:[UIImage imageNamed:@"trip_cell_ongoing"]];
    [cell.bestTrip setImage:Nil];
    if (indexPath.row == 0) {
        [cell.bestTrip setImage:[UIImage imageNamed:@"trips_top_tag"]];
        [cell.onGoing setImage:Nil];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detail = [[DetailViewController alloc] init];

    NSDictionary *dic = [_arr objectAtIndex:indexPath.row];
    NSString * num = [NSString stringWithFormat:@"%@",[dic objectForKey:@"id"]];
    
    detail.num = num;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark -
#pragma mark 网络数据请求，解析
- (void)connection{

    [AsyMid asynGetWithUrl:TripConnection parmaters:Nil finishBlock:^(id response){
        if ([response isKindOfClass:[NSDictionary class]]) {
            [_allDic addEntriesFromDictionary:response];
            [_arr addObjectsFromArray:[_allDic objectForKey:@"trips"]];
            [self doneWithView:self.header];
            [self.tableView reloadData];
        }
        if ([response isKindOfClass:[NSArray class]]) {
            [_infoArray addObjectsFromArray:response];
        }
    }];
}

#pragma mark -
#pragma mark 下来刷新,上拉加载
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    NSLog(@"%@----开始进入刷新状态", refreshView.class);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH : mm : ss.SSS";
    
    if (refreshView == self.header) {
        [self connectionWithHead];
    }
    if (refreshView == self.footer) {
        static NSInteger num = 20;
        NSString *str = [NSString stringWithFormat:@"%d",num];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:str,@"start", nil];
        
        [AsyMid asynGetWithUrl:TripConnection parmaters:dic finishBlock:^(id response){
            if ([response isKindOfClass:[NSDictionary class]]) {
                [_allDic addEntriesFromDictionary:response];
                [_arr addObjectsFromArray:[_allDic objectForKey:@"trips"]];
                [self doneWithView:self.footer];
                [self.tableView reloadData];
            }
            if ([response isKindOfClass:[NSArray class]]) {
                [_infoArray addObjectsFromArray:response];
            }
        }];
        num += 20;
    }
}

- (void)connectionWithHead{
    
    [AsyMid asynGetWithUrl:TripConnection parmaters:Nil finishBlock:^(id response){
        if ([response isKindOfClass:[NSDictionary class]]) {
            [_arr removeAllObjects];
            [_allDic addEntriesFromDictionary:response];
            [_arr addObjectsFromArray:[_allDic objectForKey:@"trips"]];
            [self doneWithView:self.header];
            [self.tableView reloadData];
        }
        if ([response isKindOfClass:[NSArray class]]) {
            [_infoArray addObjectsFromArray:response];
        }
    }];
}


- (void)doneWithView:(MJRefreshBaseView *)refreshView
{
    // 刷新表格

    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [refreshView endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
