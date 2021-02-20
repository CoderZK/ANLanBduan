//
//  ALCNewHomeOneVC.m
//  AnLanBB
//
//  Created by zk on 2020/6/3.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCNewHomeOneVC.h"
#import "ALCLuYinJiLuTVC.h"
#import "HomeVC.h"
@interface ALCNewHomeOneVC ()

@end

@implementation ALCNewHomeOneVC


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    if ([zkSignleTool shareTool].isLogin == NO) {
//        ALCLoginOneVC * vc =[[ALCLoginOneVC alloc] init];
//        vc.modalPresentationStyle = UIModalPresentationFullScreen;
//        [self presentViewController:vc animated:YES completion:nil];
//    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
//               self.tabBarController.tabBar.subviews[0].subviews[1].hidden = YES;
//       
//       }
    
    
    [self setnavigateV];
    self.tableView.backgroundColor = self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_1"]];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW/2.0-150/2.0, ScreenH/2.0 - 150 , 150, 150)];
    [button setBackgroundImage:[UIImage imageNamed:@"jkgl151"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    @weakify(self);
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        
        BaseNavigationController * bavc = [[BaseNavigationController alloc] initWithRootViewController:[[HomeVC alloc] init]];
        [self presentViewController:bavc animated:YES completion:nil];
        
        
    }];
    
    
}


- (void)setnavigateV {
    
    
    UIButton * buttonT =[UIButton buttonWithType:UIButtonTypeCustom];
    buttonT.frame = CGRectMake(0, 0, 50, 30);
    [buttonT setTitle:@"记录" forState:UIControlStateNormal];
    
    buttonT.titleLabel.font = [UIFont systemFontOfSize:14];
    [buttonT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttonT.layer.cornerRadius = 0;
    buttonT.clipsToBounds = YES;
    @weakify(self);
    [[buttonT rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        ALCLuYinJiLuTVC * vc =[[ALCLuYinJiLuTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonT];
}


@end
