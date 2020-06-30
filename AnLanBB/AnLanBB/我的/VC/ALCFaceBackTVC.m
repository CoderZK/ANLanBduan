//
//  ALCFaceBackTVC.m
//  AnLanBB
//
//  Created by zk on 2020/3/30.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCFaceBackTVC.h"
#import "ALCFaceBackCell.h"
@interface ALCFaceBackTVC ()

@property(nonatomic,strong)UIView *headV;

@property(nonatomic,strong)NSMutableArray<QYZJUserModel *> *dataArray;
@end

@implementation ALCFaceBackTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ALCFaceBackCell" bundle:nil] forCellReuseIdentifier:@"cell"];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.title = @"意见反馈";
    [self setFootV];
    [self setheadVV];
}


- (void)setheadVV {
    self.headV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 100)];
    
    UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, ScreenW - 30, 20)];
    lb.text = @"关于该应用程序，您有哪里不满意吗？";
    lb.font = kFont(14);
    lb.textAlignment = NSTextAlignmentCenter;
    lb.textColor = CharacterColor50;
    [self.headV addSubview:lb];
    
    UIButton * button  = [[UIButton alloc] initWithFrame:CGRectMake(15, 50, ScreenW - 30, 40)];
    [button setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    [button setTitle:@"勾选所有适合的选项" forState:UIControlStateNormal];
    @weakify(self);
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        
        for (ALMessageModel * model in self.dataArray) {
            model.isSelect = YES;
        }
        [self.tableView reloadData];
        
    }];
    button.titleLabel.font = kFont(14);
    button.titleLabel.textColor = WhiteColor;
    [self.headV addSubview:button];
    self.tableView.tableHeaderView = self.headV;
    
    self.dataArray = @[].mutableCopy;
    [self getData];

    
}


- (void)getData {
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    [zkRequestTool networkingPOST:[QYZJURLDefineTool appB_findFeedBackDictionaryURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {
            
            self.dataArray = [QYZJUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            [self.tableView reloadData];
            
        }else {
            [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
    }];
}


- (void)setFootV {
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH - 60);
    if (sstatusHeight > 20) {
        self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH  - 60 - 34);
    }
    
    KKKKFootView * view = [[PublicFuntionTool shareTool] createFootvWithTitle:@"发送反馈" andImgaeName:@""];
    Weak(weakSelf);
    view.footViewClickBlock = ^(UIButton *button) {
       
        [weakSelf sendFanKui];
        
    };
    [self.view addSubview:view];
}

- (void)sendFanKui {
    
    NSMutableArray * arr = @[].mutableCopy;
    for (QYZJUserModel * model  in self.dataArray) {
        if (model.isSelect) {
            [arr addObject:model.feedBackDictionaryId];
        }
    }
    if (arr.count == 0) {
        [SVProgressHUD showErrorWithStatus:@"至少选择一个问题"];
        return;
    }
    
    
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"feedBackDictionaryIds"] = [arr componentsJoinedByString:@","];
    [zkRequestTool networkingPOST:[QYZJURLDefineTool user_appB_addUserFeedBackURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {

        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {
            
            [SVProgressHUD showSuccessWithStatus:@"反馈成功,感谢您的宝贵意见"];
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ALCFaceBackCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.nameLB.text = self.dataArray[indexPath.row].name;
    if (self.dataArray[indexPath.row].isSelect) {
        cell.imgV.image = [UIImage imageNamed:@"jkgl42"];
    }else {
       cell.imgV.image = [UIImage imageNamed:@"jkgl34"];
    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.dataArray[indexPath.row].isSelect = !self.dataArray[indexPath.row].isSelect;
    [self.tableView reloadData];
}

@end
