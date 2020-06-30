//
//  ALCTiXingDetailTVC.m
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCTiXingDetailTVC.h"
#import "ALCFaceBackCell.h"
#import "TongYongOneCell.h"
#import "ALCSendPeopleTVC.h"
@interface ALCTiXingDetailTVC ()

@end

@implementation ALCTiXingDetailTVC

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.isSendBlock != nil) {
        self.isSendBlock(self.dataModel.ID);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"提醒详情";
    [self.tableView registerClass:[TongYongOneCell class] forCellReuseIdentifier:@"cell"];
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"ALCFaceBackCell" bundle:nil] forCellReuseIdentifier:@"ALCFaceBackCell"];
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = WhiteColor;
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH - 50-sstatusHeight- 44);
    if (sstatusHeight > 20) {
        self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH - 50-sstatusHeight- 44  - 34);
    }
    @weakify(self);
    if (!self.dataModel.isSend) {
        UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 50, 30);
        [button setTitle:@"发送" forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.layer.cornerRadius = 0;
        button.clipsToBounds = YES;
      
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            
            ALCSendPeopleTVC * vc =[[ALCSendPeopleTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
            vc.hidesBottomBarWhenPushed = YES;
            vc.sendSuccessBlock = ^{
                button.hidden = YES;
            };
            vc.calendarId = self.dataModel.calendarId;
            [self.navigationController pushViewController:vc animated:YES];
            
            
        }];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }

    UIButton * footBt = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenH - 50 - sstatusHeight - 44, ScreenW, 50)];
    footBt.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [footBt setImage:[UIImage imageNamed:@"jkgl120"] forState:UIControlStateNormal];
    [[footBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self delectData];
       }];
    [self.view addSubview:footBt];
    
    
    if (self.dataModel == nil && self.ID.length > 0) {
        [self getData];
    }
    
    
}

- (void)delectData {
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"calendarId"] = self.dataModel.calendarId;
    [zkRequestTool networkingPOST:[QYZJURLDefineTool appb_deleteUserCalendarURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {

            [SVProgressHUD showSuccessWithStatus:@"删除提醒成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });

        }else {
            [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];

    }];
}


- (void)getData {
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"calendarId"] = self.ID;
    [zkRequestTool networkingPOST:[QYZJURLDefineTool user_appB_findCalendarInfoURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {

            self.dataModel = [ALMessageModel mj_objectWithKeyValues:responseObject[@"data"]];
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
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        ALCFaceBackCell * cell =[tableView dequeueReusableCellWithIdentifier:@"ALCFaceBackCell" forIndexPath:indexPath];
        if (self.dataModel.isSend) {
            cell.imgV.image = [UIImage imageNamed:@"jkgl42"];
        }else{
            cell.imgV.image = [UIImage imageNamed:@"jkgl34"];
        }
        cell.imgV.hidden = YES;
        cell.leftCons.constant = 15;
        cell.nameLB.text = self.dataModel.remindTime;
        cell.nameLB.textColor = GreenColor;
        return cell;
    }else {
        TongYongOneCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.leftLB.text = self.dataModel.content;
        cell.lineV.hidden = cell.moreImgV.hidden = YES;
        cell.leftLB.mj_x = 15;
        return cell;
    }
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}





@end
