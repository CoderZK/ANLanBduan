//
//  ALCInquiryMessageTVC.m
//  AnLanCustomers
//
//  Created by zk on 2020/3/26.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCInquiryMessageTVC.h"
#import "ALCInquiryMessageCell.h"
#import "ALCSearchPeopleTVC.h"
#import "ALChatMessageTVC.h"
#import "ALCMineInquiryMessageDeyailTVC.h"
#import "ALCJianKangRiZhiDetailTVC.h"
#import "ALCMineHeathTVC.h"
@interface ALCInquiryMessageTVC ()
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSMutableArray<QYZJUserModel *> *dataArray;
@end

@implementation ALCInquiryMessageTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.navigationItem.title = @"问诊消息";
    if (self.isNewFriend) {
        self.navigationItem.title = @"新朋友";
        UIButton * submitBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 200, 44, 44)];
        [submitBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        submitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [submitBtn setImage:[UIImage imageNamed:@"jia"] forState:UIControlStateNormal];
        submitBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
 

        [submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [submitBtn addTarget:self action:@selector(submitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:submitBtn];
    }
    
    [self.tableView registerClass:[ALCInquiryMessageCell class] forCellReuseIdentifier:@"cell"];
    self.page = 1;
    self.dataArray = @[].mutableCopy;
    [self getData];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self getData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.page++;
        [self getData];
    }];
    
}


- (void)getData {
    
    
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"page"] = @(self.page);
    dict[@"pageSize"] = @(20);
    dict[@"token"] = [zkSignleTool shareTool].session_token;
    
    NSString * urlStr = [QYZJURLDefineTool user_appB_findDetaiMessagelListURL];
    if (self.isNewFriend) {
        urlStr = [QYZJURLDefineTool user_appB_findUserSessionsListURL];
    }
    
    [zkRequestTool networkingPOST:urlStr parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD dismiss];
        if ([[NSString stringWithFormat:@"%@",responseObject[@"key"]] integerValue] == 1) {
            NSArray<QYZJUserModel *>*arr = [QYZJUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
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
    
    cell.isNewFriends = self.isNewFriend;
    

    

    QYZJUserModel * model = self.dataArray[indexPath.row];
    [cell.headBt.button sd_setBackgroundImageWithURL:[NSURL URLWithString:[QYZJURLDefineTool getImgURLWithStr:model.avatar]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"369"] options:(SDWebImageRetryFailed)];
//    cell.model = model;
    
    if (self.isNewFriend) {
        cell.nameLB.text = model.targetName;
        cell.desLB.text = model.targetPhone;
        cell.headBt.button.tag = indexPath.row;
        [cell.headBt.button addTarget:self action:@selector(gootherMessage:) forControlEvents:UIControlEventTouchUpInside];
        cell.headBt.userInteractionEnabled = YES;
    }else {
        cell.nameLB.text = model.customerPhone;
        cell.desLB.text = model.customerName;
        cell.headBt.userInteractionEnabled = NO;
    }
    cell.headBt.redV.hidden = YES;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.isNewFriend) {
        ALChatMessageTVC * vc =[[ALChatMessageTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
        vc.hidesBottomBarWhenPushed = YES;
        vc.toUserId = self.dataArray[indexPath.row].targetUserId;
        vc.nameStr = self.dataArray[indexPath.row].targetName;
        vc.toAvatar = self.dataArray[indexPath.row].avatar;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        //跳转到问诊详情
        ALCJianKangRiZhiDetailTVC * vc =[[ALCJianKangRiZhiDetailTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
        vc.hidesBottomBarWhenPushed = YES;
        vc.doctorId =  self.dataArray[indexPath.row].doctorId;
        vc.voiceDetailId = self.dataArray[indexPath.row].voiceDetailId;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}

- (void)gootherMessage:(UIButton *)button {
    
    ALCMineHeathTVC * vc =[[ALCMineHeathTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
    vc.hidesBottomBarWhenPushed = YES;
    vc.userId = self.dataArray[button.tag].targetUserId;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)submitBtnClick:(UIButton *)button {
    
    ALCSearchPeopleTVC * vc =[[ALCSearchPeopleTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
           vc.hidesBottomBarWhenPushed = YES;
           [self.navigationController pushViewController:vc animated:YES];
    
    if (self.isNewFriend) {
       
    }else {
       
        
    }
    
    
    
    
}


@end
