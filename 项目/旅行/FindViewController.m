//
//  FindViewController.m
//  项目
//
//  Created by 啊啊 on 14-3-5.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "FindViewController.h"
#import "MapViewController.h"
#import "FindCell.h"

@interface FindViewController ()
{
    NSMutableDictionary *_infoDic;
    NSMutableArray *_arr;
}
@end

@implementation FindViewController
- (void)dealloc
{
    [_first release];
    [_second release];
    [_third release];
    [_allArray release];
    _allArray = Nil;
    [_infoDic release];
    [_arr release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _allArray = [[NSMutableArray alloc] init];
        _infoDic = [[NSMutableDictionary alloc] init];
        _arr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self connectionInfo];
    [self creatInterface];
    
}

#pragma mark -
#pragma mark 创建界面
- (void)creatInterface{
    self.navigationItem.hidesBackButton = YES;    //隐藏左侧返回按钮
    
    //navigationBar左侧按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"热门" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    leftButton.tintColor = [UIColor blueColor];
    [self.navigationItem setLeftBarButtonItem:leftButton];
    
    //navigationBar标题设置
    UIButton *headFind = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    [headFind setTitle:@"发现" forState:UIControlStateNormal];
    [headFind.titleLabel setFont:[UIFont systemFontOfSize:17.0]];
    [headFind setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.navigationItem setTitleView:headFind];
    
    //navigationBar右侧按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"地图" style:UIBarButtonItemStylePlain target:self action:@selector(gotoMap)];
    rightButton.tintColor = [UIColor blueColor];
    [self.navigationItem setRightBarButtonItem:rightButton];
    
    //创建瀑布流tableView
    _first = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 100, 460) style:UITableViewStylePlain];
    [_first setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _first.showsVerticalScrollIndicator = NO;
    _first.delegate = self;
    _first.dataSource = self;
    
    _second = [[UITableView alloc] initWithFrame:CGRectMake(110, 0, 100, 460) style:UITableViewStylePlain];
    [_second setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _second.showsVerticalScrollIndicator = NO;
    _second.delegate = self;
    _second.dataSource = self;
    
    _third = [[UITableView alloc] initWithFrame:CGRectMake(210, 0, 100, 460) style:UITableViewStylePlain];
    [_third setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _third.delegate = self;
    _third.dataSource = self;
    
    [self.view addSubview:_first];
    [self.view addSubview:_second];
    [self.view addSubview:_third];
}

- (void)gotoMap{
    MapViewController *mapView = [[MapViewController alloc] init];
    [self.navigationController pushViewController:mapView animated:YES];
}

- (void)goBack{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)gotoHot{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//网络数据请求，解析
- (void)connectionInfo{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"121.5485881848139",@"lng",@"38.88689188997738",@"lat", nil];
    [AsyMid asynGetWithUrl:FindConnection parmaters:dic finishBlock:^(id response){
        if ([response isKindOfClass:[NSDictionary class]]) {
            [_infoDic addEntriesFromDictionary:response];
            [_arr addObjectsFromArray:[_infoDic objectForKey:@"items"]];
        }
        if ([response isKindOfClass:[NSArray class]]) {
            [_allArray addObjectsFromArray:response];
        }
        [_first reloadData];
        [_second reloadData];
        [_third reloadData];
    }];
}

#pragma mark -
#pragma mark TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [_arr count] / 3;
    NSInteger value = [_arr count]%3;
    if (_first == tableView) {
        if (value > 0) {
            count++;
        }
    }
    if (_second == tableView) {
        if (value > 1) {
            count++;
        }
    }
       return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentafy = @"first";
    FindCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentafy];
    if (!cell) {
        cell = [[[FindCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentafy] autorelease];
    }
    NSInteger index = indexPath.row * 3;
    if (_second == tableView) {
        index++;
    }
    if (_third == tableView) {
        index += 2;
    }
    NSDictionary *dic = [[_arr objectAtIndex:index] firstObject];
    NSString *str = [dic objectForKey:@"photo"];
    NSURL *url = [NSURL URLWithString:str];
    [cell.cellImages setImageWithURL:url];
    cell.positionLabel.text = [dic objectForKey:@"city"];
    cell.timeLabel.text = [dic objectForKey:@"local_time"];
    cell.messageLabel.text = [dic objectForKey:@"text"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row * 3;
    if (_second == tableView) {
        index++;
    }
    if (_third == tableView) {
        index += 2;
    }
 //   NSString *name = [_arr objectAtIndex:index];
 //   UIImage *newImage = [UIImage imageNamed:name];
//    NSURL *url = [[[_arr objectAtIndex:index] firstObject] objectForKey:@"photo"];
//    UIImageView *newImage = [[UIImageView alloc] init];
//    [newImage setImageWithURL:url];
//    CGSize size = newImage.size;
//    CGSize size = newImage.image.size;
//    CGFloat scale = size.width / 100.0;
//    CGFloat height = size.height / scale;
//    if (height == 0) {
//        return 50;
//    }else{
    return 180;
//    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //取消选中状态
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _first.contentOffset = scrollView.contentOffset;
    _second.contentOffset = scrollView.contentOffset;
    _third.contentOffset = scrollView.contentOffset;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
