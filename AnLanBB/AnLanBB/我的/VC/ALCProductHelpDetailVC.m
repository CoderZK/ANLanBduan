//
//  ALCProductHelpDetailVC.m
//  AnLanBB
//
//  Created by zk on 2020/3/30.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCProductHelpDetailVC.h"

@interface ALCProductHelpDetailVC ()

@end

@implementation ALCProductHelpDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    self.titleLB.text = self.titleStr;
}

- (void)getData {
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"baseInfoId"] = self.baseInfoId;
    [zkRequestTool networkingPOST:[QYZJURLDefineTool appB_findProductInfoURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {

        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {
            
            self.TV.text = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"content"]];
            
            
        }else {
            [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
   
        
    }];
}




@end
