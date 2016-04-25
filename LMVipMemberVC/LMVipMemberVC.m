//
//  LMVipMemberVC.m
//  LMVipMemberVC
//
//  Created by zhuo on 16/4/25.
//  Copyright © 2016年 com.lrts.zhuo. All rights reserved.
//

#import "LMVipMemberVC.h"
#import "LMVipDes.h"
#import "LMVipMemberCell.h"
// vip 界面

@interface LMVipMemberVC ()<UITableViewDataSource>

@property (nonatomic, strong) NSArray *vipDesArray;//vip会员权益描述内容
@property (nonatomic, strong) UITableView *tableView; // tableview
// 会员类型
@property (nonatomic, strong) NSString *memberType;

@property (nonatomic, strong)NSArray* VipAccountTitles; // 当前账号的类型描述
@property (nonatomic, strong)NSDictionary* BuyVipDecs;       // 开通会员的信息
@property (nonatomic, strong) NSMutableArray *titles;    // tableview的标题
@property (nonatomic, strong) NSMutableArray *descriptions;// 描述

@end

@implementation LMVipMemberVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor orangeColor];
    [self getVipDes];
    [self loadDatas];
    [self tableView];
    
    self.title = @"VIP会员";
    
    //生成vip权益描述内容
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tabel view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *vipMemberCellId = @"vipMemberCell";
    LMVipMemberCell *cell = nil;// [tableView dequeueReusableCellWithIdentifier:vipMemberCellId];
    
    NSInteger row = indexPath.row;
    if (cell == nil) {
        
    }
    
//    //vip会员权益所在cell的index
//    NSInteger vipTitleIndex = 4+[self.memberStraterys count];
  /*  if (row == 0)
    {
        cell = [[LMVipMemberCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vipMemberCellId cellType:LMVipMemberCellTypeTitle];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }else */if (row >= 0){
        cell = [[LMVipMemberCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vipMemberCellId cellType:LMVipMemberCellTypeVipDes];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //
//
//    if (row == 1) {
//        
//        // 设置会员类型
//        // ....
//        cell.memberTypeLabel.text = self.memberType;
//        
//    } else if (row == 2) {
//        cell.rightButton.hidden = YES;
//        LMUser *user = [[LMUserManager shareUserManager] activeUser];
//        if (user.feeType) {
//            cell.titleLabel.hidden = NO;
//            cell.memberTypeLabel.hidden = NO;
//            cell.memberTypeLabel.text = [NSString stringWithFormat:@"还剩%@天",@(user.timeRemaining)];
//        }else {
//            cell.titleLabel.hidden = YES;
//            cell.memberTypeLabel.hidden = YES;
//        }
//        
//    }else if (row > ([self.memberStraterys count] + 4) && indexPath.row <
            LMVipDes *vipDes = (LMVipDes *)[self.vipDesArray objectAtIndex:row];
        
        [cell configureVipDesWithImage:vipDes.imageName vipTitle:vipDes.vipTitle vipDes:vipDes.vipDes];
    
    //}
//
//   [cell configureCellWithTitle:[self.titles objectAtIndex:row] andDescription:[self.descriptions objectAtIndex:row]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%s", __func__);
}

#pragma mark - load data
// 得到vip会员权益
- (void)getVipDes {
    LMVipDes *lmvipDes1 = [[LMVipDes alloc] init];
    lmvipDes1.imageName = @"vip_noad_icon";
    lmvipDes1.vipTitle = @"免广告";
    lmvipDes1.vipDes = @"界面更加简洁，提升听书体验";
    
    LMVipDes *lmvipDes2 = [[LMVipDes alloc] init];
    lmvipDes2.imageName = @"vip_download_icon";
    lmvipDes2.vipTitle = @"不限下载";
    lmvipDes2.vipDes = @"不受每天下载100章的限制";
    
    LMVipDes *lmvipDes3 = [[LMVipDes alloc] init];
    lmvipDes3.imageName = @"vip_special_icon";
    lmvipDes3.vipTitle = @"身份标识";
    lmvipDes3.vipDes = @"会员专属标识，彰显尊贵身份";
    
    LMVipDes *lmvipDes4 = [[LMVipDes alloc] init];
    lmvipDes4.imageName = @"vip_more_icon";
    lmvipDes4.vipTitle = @"其他特权";
    lmvipDes4.vipDes = @"更多会员特权敬请期待，不断补充中";
    
    self.vipDesArray = [NSArray arrayWithObjects:lmvipDes1,lmvipDes2,lmvipDes3,lmvipDes4, nil];
}

// 加载当前账号信息
- (void)loadCurrentAccountDatas {
    
    NSString *type = nil;
    type = @"普通会员";
    self.VipAccountTitles = @[ @"当前账户", @"会员类型"];
}

- (void)loadDatas {
    
    NSString *type = @"普通会员";

    NSString *vipTitle = @"开通会员";

        NSArray *titles = @[ @"当前账户", @"会员类型", @"VIP到期时间", vipTitle,@"VIP会员权益",@"",@"",@"",@"",@"账户记录",@"消费记录"];
        NSArray *descriptions = @[ @"", @"", @"", @"",@"",@"",@"",@"",@"",@"",@""];
                self.titles = [NSMutableArray arrayWithArray:titles];
        self.descriptions = [NSMutableArray arrayWithArray:descriptions];

    NSArray* strategy = @[@"6", @"12", @"18", @"30"];
        NSInteger insertIndex = 4;
        for (int i= 0; i < 4; i++) {
            [self.titles insertObject:@"" atIndex:insertIndex];
            [self.descriptions insertObject:[NSString stringWithFormat:@"¥%@元", strategy[insertIndex]] atIndex:insertIndex];
            
            insertIndex++;
        }
        
        [self.tableView reloadData];

}


- (void) loadBuyVipDec
{
    //self.BuyVipDecs = @{};
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        CGFloat width = self.view.frame.size.width;
        CGFloat height = self.view.frame.size.height - GLOBAL_NAVIGATIONBAR_HEIGHT;
        if ( [self getSystemVersion] >= 7.0) {
            height -= 20;
        }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = self.view.backgroundColor;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

- (CGFloat)getSystemVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}


@end
