//
//  ALCLuYinDetailTVC.m
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCLuYinDetailTVC.h"
#import "ALCLuYinDetailHeadView.h"
#import "ALCLuYinDetailCell.h"

@interface ALCLuYinDetailTVC ()<ALCLuYinDetailCellDelegate>
@property(nonatomic,strong)ALCLuYinDetailHeadView *headV;
@property(nonatomic,strong)ALMessageModel *dataModel;
@end

@implementation ALCLuYinDetailTVC

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.headV.isFinsh = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"录音详情";
    
   
    
    [self.tableView registerClass:[ALCLuYinDetailCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = WhiteColor;
    
    
    [self getData];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self getData];
    }];
    
    
}

- (void)getData {
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"voiceMessageId"] = self.voiceMessageId;
    [zkRequestTool networkingPOST:[QYZJURLDefineTool appB_findVoiceMessageMapURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {
            
            self.dataModel = [ALMessageModel mj_objectWithKeyValues:responseObject[@"data"]];
            [self.tableView reloadData];
            self.headV = [[ALCLuYinDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 145)];
               self.tableView.tableHeaderView = self.headV;
               self.headV.clipsToBounds = YES;
            self.headV.media_url = self.dataModel.audio;
            self.headV.titleLB.text = [NSString stringWithFormat:@"%@ %@",self.dataModel.customerName,self.dataModel.phone];
            
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
    if (self.dataModel.list.count == 0) {
        return 0;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataModel.list.count == 0) {
        return 0;
    }
    return 20+45*self.dataModel.list.count+45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ALCLuYinDetailCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.dataArray = self.dataModel.list;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = cell.contentView.backgroundColor = WhiteColor;
    cell.clipsToBounds = YES;
    return cell;
    

    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}

- (void)didClickALCLuYinDetailCell:(ALCLuYinDetailCell *)cell withIndex:(NSInteger)index {
    
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    
    
    ALMessageModel *model = self.dataModel.list[index];
    
    if (model.type == 2) {
        [PublicFuntionTool presentVideoVCWithNSString:model.url isBenDiPath:NO];
    }else if (model.type == 1) {
        [[zkPhotoShowVC alloc] initWithArray:@[model.url] index:0];
    }
    
    
    
}


@end
