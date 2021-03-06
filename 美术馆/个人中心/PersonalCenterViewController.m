//
//  PersonalCenterViewController.m
//  美术馆
//
//  Created by 邓超 on 15/11/24.
//  Copyright © 2015年 邓超. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalCenterTableViewCell.h"
#import "Utils.h"
#import "RecommendAttentionViewController.h"
#import "PersonalCenterTableHeaderView.h"
#import "AppDelegate.h"

@interface PersonalCenterViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *imageNameArray;
    NSArray *titleArray;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        
    [self.tableView registerNib:[UINib nibWithNibName:@"PersonalCenterTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [Utils removeTheBottomLineWithTableView:self.tableView];
    [self getDatasource];
    
    self.tableView.bounces = NO;
    
    self.tableView.tableHeaderView = [[NSBundle mainBundle] loadNibNamed:@"PersonalCenterTableHeaderView" owner:nil options:nil].firstObject;
}

- (void)getDatasource
{
    imageNameArray = @[@"iconfont-home-拷贝", @"iconfont-like", @"iconfont-search", @"iconfont-edit", @"iconfont-icon09", @"iconfont-addressbook", @"iconfont-settings", @"iconfont-exit-door"];
    titleArray = @[@"主页", @"推荐关注", @"搜索", @"订单中心", @"统计", @"联系人", @"设置", @"退出"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleImageView.image = [UIImage imageNamed:imageNameArray[indexPath.row]];
    cell.titleLabel.text = titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    if (indexPath.row == 1) {
        RecommendAttentionViewController *recommendVC = [[RecommendAttentionViewController alloc] initWithNibName:@"RecommendAttentionViewController" bundle:nil];
        recommendVC.hidesBottomBarWhenPushed = YES;
        
        UITabBarController *tab = (UITabBarController *)app.drawerController.centerViewController;
        
        [tab.selectedViewController pushViewController:recommendVC animated:NO];
    }
    
    
    [app.drawerController closeDrawerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
