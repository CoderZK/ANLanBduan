//
//  ALCProductHelpTVC.m
//  AnLanBB
//
//  Created by zk on 2020/3/30.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCProductHelpTVC.h"
#import "ALCProductHelpDetailVC.h"
@interface ALCProductHelpTVC ()
@property(nonatomic,strong)NSArray<QYZJUserModel *> *leftArr;
@end

@implementation ALCProductHelpTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品帮助";
    
    [self.tableView registerClass:[TongYongThreeCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    
    [self getData];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
      
        [self getData];
    }];

    
}

- (void)getData {
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    [zkRequestTool networkingPOST:[QYZJURLDefineTool appB_findProductListURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {

        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {

            self.leftArr = [QYZJUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            [self.tableView reloadData];

        }else {
            [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {


        
    }];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.leftArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TongYongThreeCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.leftLB.mj_w = ScreenW - 30 -40 ;
    cell.leftLB.text = self.leftArr[indexPath.row].content;
    cell.TF.hidden = YES;
    cell.rightImgV.hidden = NO;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ALCProductHelpDetailVC * vc =[[ALCProductHelpDetailVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.baseInfoId = self.leftArr[indexPath.row].baseInfoId;
    vc.titleStr = self.leftArr[indexPath.row].content;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
