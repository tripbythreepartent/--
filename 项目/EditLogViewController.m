//
//  EditLogViewController.m
//  项目
//
//  Created by 啊啊 on 14-3-7.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "EditLogViewController.h"
#import "LogViewController.h"
#import "NBPerCell.h"

@interface EditLogViewController ()

@end

@implementation EditLogViewController

-(void)dealloc{
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

- (void)editNavigation{
    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    self.navigationItem.title = @"旅程日志";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)createPage{
    UIButton * editButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 70, 100, 50)];
    [editButton setTitle:@"编辑日志" forState:UIControlStateNormal];
    [editButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(pushLogAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:editButton];
    [editButton release];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 132, 320, 300) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"hello";
    NBPerCell * cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NBPerCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
    }
    NSURL * imageHead = [[[[_arr objectAtIndex:indexPath.section] firstObject] objectForKey:@"user"] objectForKey:@"avatar_m"];
    [cell.userImage setImageWithURL:imageHead];
    
    NSString * name = [[[[_arr objectAtIndex:indexPath.section] firstObject] objectForKey:@"user"] objectForKey:@"name"];
    [cell.userName setText:name];
    
    NSString * trip_name =[[[_arr objectAtIndex:indexPath.section] firstObject] objectForKey:@"trip_name"] ;
    [cell.traverName setText:trip_name];
    
    NSURL * photo = [[[_arr objectAtIndex:indexPath.section] firstObject] objectForKey:@"photo_w640"] ;
    [cell.backImage setImageWithURL:photo];
    
    NSString * text = [[[_arr objectAtIndex:indexPath.section] firstObject] objectForKey:@"text"] ;
    [cell.describeLable setText:text];
    
//    NSString * trip_date = [NSString stringWithFormat:@"%@", [[[_arr objectAtIndex:indexPath.section] firstObject] objectForKey:@"trip_date"]];
//    NSDate * date = [NSDate dateWithTimeIntervalSinceNow:[trip_date doubleValue]];
//    NSString * str = [NSString stringWithFormat:@"%@",date];
//    [cell.timeLable setText:str];
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_arr count];
}

#pragma mark -
#pragma mark 网络数据请求，解析
- (void)connection{
    
    [AsyMid asynGetWithUrl:LogConnection parmaters:Nil finishBlock:^(id response){
        if ([response isKindOfClass:[NSDictionary class]]) {
            [_allDic addEntriesFromDictionary:response];
            [_arr addObjectsFromArray:[_allDic objectForKey:@"items"]];
            NSLog(@"_arr == %@",_arr);
            [_tableView reloadData];
        }
        if ([response isKindOfClass:[NSArray class]]) {
            [_infoArray addObjectsFromArray:response];
        }
    }];
}


- (void)pushLogAction:(id)sender{
    LogViewController * log = [[LogViewController alloc] init];
    [self presentViewController:log animated:NO completion:Nil];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self connection];
    [self editNavigation];
    [self createPage];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
