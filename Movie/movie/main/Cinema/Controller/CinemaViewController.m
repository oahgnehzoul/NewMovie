//
//  CinemaViewController.m
//  movie
//
//  Created by oahgnehzoul on 15/7/17.
//  Copyright (c) 2015年 oahgnehzoul. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaCell.h"
#import "CinemaModal.h"
#import "DataService.h"
#import "common.h"
#import "DistrictModal.h"
@interface CinemaViewController ()
{
    NSArray *districtArray;
    NSMutableArray *dicArray;
    BOOL flags[100];
}
@end

@implementation CinemaViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"影院";
    }
    return self;
}
- (void)_createCinemaTableView {
    _cinemaTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _cinemaTableView.backgroundColor = [UIColor blackColor];
    UINib *nib = [UINib nibWithNibName:@"CinemaCell" bundle:nil];
    [_cinemaTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    _cinemaTableView.dataSource = self;

    _cinemaTableView.delegate = self;
   // NSLog(@"%@",_cinemaTableView.delegate);
    [self.view addSubview:_cinemaTableView];
    //self.view.backgroundColor = [UIColor blackColor];
   // _cinemaTableView.tableHeaderView =
}

- (void)_loadData {
    _cinemaModalArray = [[NSMutableArray alloc] init];
    NSDictionary *cinemaDic = [DataService getJsonDataFromFile:CinemaListFile];
    NSArray *cinemaArray = [cinemaDic objectForKey:@"cinemaList"];
    for (NSDictionary *dic in cinemaArray) {
        CinemaModal *cinemaModal = [[CinemaModal alloc] init];
        [cinemaModal setValuesForKeysWithDictionary:dic];
        [_cinemaModalArray addObject:cinemaModal];
    }
    
    NSDictionary *districDic = [DataService getJsonDataFromFile:DistrictListFile];
    districtArray = [districDic objectForKey:@"districtList"];
    dicArray = [[NSMutableArray alloc] init];
    for (int i=0; i<districtArray.count; i++) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        NSMutableArray *newCinemaModalArray = [[NSMutableArray alloc] init];
        NSString *str = [districtArray[i] objectForKey:@"id"];

        for (CinemaModal *modal in _cinemaModalArray) {
            if ([modal.districtId isEqualToString:str]) {
                [newCinemaModalArray addObject:modal];
            }
        }
        [dic setObject:newCinemaModalArray forKey:@"array"];
        NSString *districName = [districtArray[i] objectForKey:@"name"];
        [dic setValue:districName forKey:@"districtName"];
        [dicArray addObject:dic];
    }
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    [self _createCinemaTableView];
    [self _loadData];
 //   NSLog(@"%ld",dicArray.count);
}

#pragma mark - tableViewCellDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //  NSLog(@"%ld",dicArray.count);
    return dicArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   // NSDictionary *dic = dicArray[section];
     NSArray *modalArray = [dicArray[section] objectForKey:@"array"];
    
   // NSLog(@"%ld",modalArray.count);
    if (flags[section] == NO) {
        return 0;
    }
    return modalArray.count;
    //return _cinemaModalArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSArray *modalArray = [dicArray[indexPath.section] objectForKey:@"array"];
  //  NSLog(@"%ld",indexPath.section);
 //   NSLog(@"%ld",indexPath.row);
    
    CinemaModal *modal = modalArray[indexPath.row];
  //  NSLog(@"%@",modal);
    cell.modal = modal;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
//设了header间距才会调用
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton *button = [[UIButton alloc] init];
    //button.backgroundColor = [UIColor grayColor];
    [button setBackgroundImage:[UIImage imageNamed:@"hotMovieBottomImage"] forState:UIControlStateNormal];
    NSDictionary *dic = dicArray[section];
    NSString *str = [dic objectForKey:@"districtName"];
    
   // NSLog(@"%@",str);
    [button setTitle:str forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = section;
    return button;
}
- (void)btnAction:(UIButton *)button {
    NSInteger index = button.tag;
    flags[index] = !flags[index];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:index];
    [_cinemaTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
