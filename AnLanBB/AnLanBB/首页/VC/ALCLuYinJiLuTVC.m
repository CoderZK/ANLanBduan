//
//  ALCLuYinJiLuTVC.m
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCLuYinJiLuTVC.h"
#import "ALCLuYinJiLuCell.h"
#import "ALCLuYinDetailTVC.h"
@interface ALCLuYinJiLuTVC ()<UITextFieldDelegate>
@property(nonatomic,strong)UIButton *editBt,*footbt;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSMutableArray<ALMessageModel *> *dataArray;
@property(nonatomic,strong)NSString *searchWord;
@end

@implementation ALCLuYinJiLuTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHeadView];
    [self.tableView registerNib:[UINib nibWithNibName:@"ALCLuYinJiLuCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
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
    dict[@"keyword"] = self.searchWord;
    [zkRequestTool networkingPOST:[QYZJURLDefineTool user_appB_findUserVoiceRecordListURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD dismiss];
        if ([[NSString stringWithFormat:@"%@",responseObject[@"key"]] integerValue] == 1) {
            NSArray<ALMessageModel *>*arr = [ALMessageModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
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


- (void)setHeadView {
    
    ALCSearchView * titleView = [[ALCSearchView alloc] initWithFrame:CGRectMake(0, 0, ScreenW - 120, 44)];
    titleView.searchTF.delegate = self;
    titleView.isPush = NO;
    self.navigationItem.titleView = titleView;
    @weakify(self);
    [[titleView.clickBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        
        
    }];
    UIButton * submitBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 200, 44, 44)];
//    submitBtn.layer.cornerRadius = 22;
//    submitBtn.layer.masksToBounds = YES;
    [submitBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [submitBtn setTitle:@"取消" forState:UIControlStateSelected];
    
    [submitBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [submitBtn setImage:[UIImage imageNamed:@"jkgl1"] forState:UIControlStateNormal];
    submitBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [submitBtn addTarget:self action:@selector(submitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.editBt = submitBtn;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:submitBtn];
    

    UIButton * footBt = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenH - 50 - sstatusHeight - 44, ScreenW, 50)];
    footBt.backgroundColor = [UIColor whiteColor];
    [footBt setImage:[UIImage imageNamed:@"jkgl120"] forState:UIControlStateNormal];
    [[footBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           @strongify(self);
        [self delectAction];
       }];
    self.footbt = footBt;
    [self.view addSubview:footBt];
    self.footbt.hidden = YES;
    
}

- (void)delectAction{
    
    NSMutableArray * arr = @[].mutableCopy;
    NSMutableArray * arrTwo = @[].mutableCopy;
    for (ALMessageModel * model in self.dataArray) {
        if (model.isSelect) {
            [arr addObject:model.voiceMessageId];
        }else {
            [arrTwo addObject:model];
        }
    }
    if (arr.count == 0) {
        [SVProgressHUD showErrorWithStatus:@"至少选择删除一条记录"];
        return;
    }
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"voiceMessageIds"] = [arr componentsJoinedByString:@","];
    [zkRequestTool networkingPOST:[QYZJURLDefineTool addB_deleteUserVoiceRecordURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {
            self.dataArray = arrTwo.mutableCopy;
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
    return 94;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ALCLuYinJiLuCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (self.editBt.isSelected) {
        cell.backVCons.constant = 60;
        cell.leftImgV.hidden = NO;
    }else {
        cell.backVCons.constant = 15;
        cell.leftImgV.hidden = YES;
    }
    ALMessageModel * model = self.dataArray[indexPath.row];
    cell.titleLB.text = [NSString stringWithFormat:@"%@  %@",model.customerName,model.phone];
    cell.timeLB.text = model.createTime;
    cell.timeTwoLB.text = [NSString stringWithVideoTime:model.duration];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = model;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.editBt.titleLabel.text isEqualToString:@"取消"]) {
        self.dataArray[indexPath.row].isSelect =  !self.dataArray[indexPath.row].isSelect;
        [self.tableView reloadData];
    }else {
        ALCLuYinDetailTVC * vc =[[ALCLuYinDetailTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
        vc.hidesBottomBarWhenPushed = YES;
        vc.voiceMessageId = self.dataArray[indexPath.row].voiceMessageId;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
       
    
    
}

- (void)submitBtnClick:(UIButton *)button {
    
    button.selected = !button.selected;
    
    self.footbt.hidden = !button.selected;
    if (button.isSelected) {
        self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH - 50-sstatusHeight- 44);
        if (sstatusHeight > 20) {
            self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH - 50-sstatusHeight- 44  - 34);
           self.footbt.frame = CGRectMake(0, ScreenH - sstatusHeight - 44 - 60 - 34, ScreenW, 60);
        }
        
    }else {
        self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH );
    }
    
    [self.tableView reloadData];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.searchWord = textField.text;
    self.page = 1;
    [self getData];
    return YES;
}


@end
