//
//  ALCSearchPeopleTVC.m
//  AnLanCustomers
//
//  Created by zk on 2020/3/26.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCSearchPeopleTVC.h"
#import "ALCInquiryMessageCell.h"
#import "ALChatMessageTVC.h"
@interface ALCSearchPeopleTVC ()<UITextFieldDelegate>
@property(nonatomic,strong)UIButton *editBt;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSMutableArray<QYZJUserModel *> *dataArray;
@property(nonatomic,strong)NSString *searchWord;
@end

@implementation ALCSearchPeopleTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHeadView];
    
  
    
    [self.tableView registerClass:[ALCInquiryMessageCell class] forCellReuseIdentifier:@"cell"];

        self.tableView.backgroundColor = WhiteColor;
    
    
    self.page = 1;
      self.dataArray = @[].mutableCopy;
      [self getData];
      self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
          self.page = 1;
          [self getData];
      }];
    
    if (!self.isComeLuYin) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.page++;
            [self getData];
        }];
    }

}

- (void)setHeadView {
    
    ALCSearchView * searchTitleView = [[ALCSearchView alloc] initWithFrame:CGRectMake(0, 0, ScreenW - 70, 44)];
    searchTitleView.searchTF.delegate = self;
    searchTitleView.isPush = NO;
    self.navigationItem.titleView = searchTitleView;
    @weakify(self);
    [[[searchTitleView.searchTF rac_textSignal] filter:^BOOL(NSString * _Nullable value) {
        @strongify(self);
        if (value.length > 0) {
            return YES;
        }else {
            return NO;
        }
    }] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"======\n%@",x);
        self.searchWord = x;
        self.page = 1;
        [self getData];
    }];
    self.navigationItem.titleView = searchTitleView;
    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc] initWithCustomView:nil];

}


- (void)getData {
    
    
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"page"] = @(self.page);
    dict[@"pageSize"] = @(20);
    dict[@"token"] = [zkSignleTool shareTool].session_token;
    
    NSString * urlStr  = [QYZJURLDefineTool appB_findNewFrindByPhoneURL];
    if (self.isComeLuYin) {
        urlStr = [QYZJURLDefineTool appB_findDoctorByPhoneURL];
    }
    
    [zkRequestTool networkingPOST:urlStr parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD dismiss];
        if ([[NSString stringWithFormat:@"%@",responseObject[@"key"]] integerValue] == 1) {
            NSArray<QYZJUserModel *>*arr = @[];
            if (self.isComeLuYin) {
               arr =   [QYZJUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            }else {
              arr =   [QYZJUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
            }
           
            if (self.page == 1) {
                [self.dataArray removeAllObjects];
            }
            [self.dataArray addObjectsFromArray:arr];
            [self.tableView reloadData];
            
        }else {
            [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ALCInquiryMessageCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.rightBt.hidden = YES;
    cell.timeLB.hidden = YES;
    cell.isNewFriends = YES;
    cell.model = self.dataArray[indexPath.row];
    cell.desLB.text = self.dataArray[indexPath.row].customerName;
    
    if (self.isComeLuYin) {
        cell.desLB.text = [NSString stringWithFormat:@"%@ %@",self.dataArray[indexPath.row].doctorName,self.dataArray[indexPath.row].level];
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if  (self.isComeLuYin) {
        if (self.sendDorBlock != nil) {
            QYZJUserModel * model = self.dataArray[indexPath.row];
            self.sendDorBlock(model);
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else {
         ALChatMessageTVC * vc =[[ALChatMessageTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
           vc.toUserId = self.dataArray[indexPath.row].baseId;
           vc.nameStr = self.dataArray[indexPath.row].customerName;
           vc.toAvatar = self.dataArray[indexPath.row].avatar;
           vc.hidesBottomBarWhenPushed = YES;
          [self.navigationController pushViewController:vc animated:YES];
    }
   
}

- (void)submitBtnClick:(UIButton *)button {
    
}

@end
