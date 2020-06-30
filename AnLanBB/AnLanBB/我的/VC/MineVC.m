//
//  MineVC.m
//  AnLanBB
//
//  Created by kunzhang on 2018/7/2.
//  Copyright © 2018年 kunzhang. All rights reserved.
//

#import "MineVC.h"
#import "ALCInquiryMessageTVC.h"
#import "ACLMineMessageTVC.h"
#import "ALCProductHelpTVC.h"
#import "ALCFaceBackTVC.h"
@interface MineVC ()
@property(nonatomic,strong)UIView *headV;
@property(nonatomic,strong)UIButton *headBt;
@property(nonatomic,strong)UILabel *phoneLB;
@property(nonatomic,strong)NSArray *leftArr;
@property(nonatomic,strong)QYZJUserModel  *model;
@property(nonatomic,strong)UIImage *image;
@end

@implementation MineVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
      [self getData];
     [self addheadV];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
    
    
}

- (void)getData {
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    [zkRequestTool networkingPOST:[QYZJURLDefineTool user_appB_countMessageURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {
            
            self.model = [QYZJUserModel mj_objectWithKeyValues:responseObject[@"data"]];
            [self.tableView reloadData];
            
        }else {
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
    }];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    self.leftArr = @[@"消息",@"设备链接",@"产品帮助",@"用户反馈"];
    
    
    self.tableView.frame = CGRectMake(0, -sstatusHeight, ScreenW, ScreenH);
    
    [self.tableView registerClass:[TongYongOneCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = WhiteColor;
    
  
    
}

- (void)addheadV {
    
    self.headV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 10)];
    
    UIImageView * imgVOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 220)];
    imgVOne.image = [UIImage imageNamed:@"jkgl95"];
    [self.headV addSubview:imgVOne];
    
    UIView * viewTwo = [[UIView alloc] init];;
    viewTwo.backgroundColor = WhiteColor;
    [self.headV addSubview:viewTwo];
    [viewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headV).offset((CGRectGetMaxY(imgVOne.frame)));
        make.bottom.left.right.equalTo(self.headV).offset(0);
        
    }];
    
    self.headV.mj_h =220;
    self.tableView.tableHeaderView = self.headV;
    
    self.headBt = [[UIButton alloc] initWithFrame:CGRectMake((ScreenW - 45)/2, (220-45)/2, 45, 45)];
    self.headBt.layer.cornerRadius = 22.5;
    self.headBt.clipsToBounds = YES;
    self.headBt.layer.borderColor = WhiteColor.CGColor;
    self.headBt.layer.borderWidth = 0.8;
    //    [self.headBt setBackgroundImage:[UIImage imageNamed:@"369"] forState:UIControlStateNormal];
    [self.headBt sd_setBackgroundImageWithURL:[NSURL URLWithString:[zkSignleTool shareTool].avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"369"]];
    [self.headV addSubview:self.headBt];
    [[self.headBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        
        [self addPict];
        
    }];
    
    self.phoneLB = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headBt.frame) + 10, ScreenW, 18)];
    self.phoneLB.textAlignment = NSTextAlignmentCenter;
    self.phoneLB.font = kFont(14);
    self.phoneLB.textColor = WhiteColor;
    self.phoneLB.text = [zkSignleTool shareTool].nick_name;
    [self.headV addSubview:self.phoneLB];
    
    
}

- (void)addPict {
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([self isCanUsePhotos]) {
            
            
            [self showMXPhotoCameraAndNeedToEdit:YES completion:^(UIImage *image, UIImage *originImage, CGRect cutRect) {
                
                self.image = image;
                [self updateImgsToQiNiuYun];
                
                //                    [self.picsArr addObject:image];
                //                    [self addPicsWithArr:self.picsArr];
                //                    [self updateImgsToQiNiuYun];
            }];
            
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([self isCanUsePicture]) {
            [self showMXPickerWithMaximumPhotosAllow:1 completion:^(NSArray *assets) {
                
                if (assets.count>0) {
                    ALAsset *asset = assets[0];
                    ALAssetRepresentation *assetRep = [asset defaultRepresentation];
                    CGImageRef imgRef = [assetRep fullResolutionImage];
                    UIImage *image = [[UIImage alloc] initWithCGImage:imgRef
                                                                scale:assetRep.scale
                                                          orientation:(UIImageOrientation)assetRep.orientation];
                    
                    if (!image) {
                        image = [[UIImage alloc] initWithCGImage:[[asset defaultRepresentation] fullScreenImage]
                                                           scale:assetRep.scale
                                                     orientation:(UIImageOrientation)assetRep.orientation];
                        
                    }
                    if (!image) {
                        CGImageRef thum = [asset aspectRatioThumbnail];
                        image = [UIImage imageWithCGImage:thum];
                    }
                    self.image = image;
                    [self updateImgsToQiNiuYun];
                    [self.headBt setBackgroundImage:image forState:UIControlStateNormal];
                }
                
                
            }];
            
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
    
    UIAlertAction * action4 = [UIAlertAction actionWithTitle:@"看大图" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
        NSString * str = [zkSignleTool shareTool].avatar;
        if (str.length > 0) {
            [[zkPhotoShowVC alloc] initWithArray:@[[zkSignleTool shareTool].avatar] index:0];
        }
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [ac addAction:action1];
    [ac addAction:action2];
    [ac addAction:action4];
    [ac addAction:action3];
    
    [self.navigationController presentViewController:ac animated:YES completion:nil];
    
}


- (void)updateImgsToQiNiuYun {
    
    [zkRequestTool NetWorkingUpLoad:[QYZJURLDefineTool upload_file_to_qiniuURL] images:@[self.image] name:@"file" parameters:@{@"type":@1} success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[@"key"] intValue]== 1) {
            
            NSArray * arr = responseObject[@"data"];
            if (arr.count > 0) {
                [self updateServWithStr:[NSString stringWithFormat:@"http://%@",arr[0][@"qiniu_url"]]];
                [zkSignleTool shareTool].avatar = [NSString stringWithFormat:@"http://%@",arr[0][@"qiniu_url"]];
            }
        }else {
            [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
}

- (void)updateServWithStr:(NSString *  )str  {
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"avatar"] = str;
    [zkRequestTool networkingPOST:[QYZJURLDefineTool user_appB_uploadAvatarURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        [zkSignleTool shareTool].avatar = str;;
        [self.headBt sd_setBackgroundImageWithURL:[str getPicURL] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"369"]];
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [SVProgressHUD dismiss];
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

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 200;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"head"];
    if(view == nil) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 300)];
        UILabel * leftLB = [[UILabel alloc] initWithFrame:CGRectMake(15, 15,150, 20)];
        leftLB.textColor = CharacterBlack100;
        leftLB.font = kFont(14);
        leftLB.text = @"应用程序版本";
        [view addSubview:leftLB];
        
        UILabel * rightLB = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW - 115, 15, 100, 20)];
//        rightLB.textColor = CharacterBlack100;
        rightLB.textAlignment = NSTextAlignmentRight;
        rightLB.text = @"应用程序版本";
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString * app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        rightLB.text = app_Version;
        rightLB.font = kFont(14);
        [view addSubview:rightLB];
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake((ScreenW - 180)/2, 100,180 , 40)];
        [button setTitleColor:WhiteColor forState:UIControlStateNormal];
        button.titleLabel.font = kFont(14);
        button.tag = 100;
        button.layer.cornerRadius = 5;
        button.clipsToBounds = YES;
        [button setBackgroundImage:[UIImage imageNamed:@"gback"] forState:UIControlStateNormal];
        [button setTitle:@"退出登录" forState:UIControlStateNormal];
        
        [view addSubview:button];
        
    }
    
    UIButton * button = (UIButton *)[view viewWithTag:100];
    [button addTarget:self action:@selector(outLogin) forControlEvents:UIControlEventTouchUpInside];
    
    view.clipsToBounds = YES;
    return view;
}

- (void)outLogin {
    
    [zkSignleTool shareTool].session_token = nil;
    [zkSignleTool shareTool].isLogin = NO;
    self.tabBarController.selectedIndex = 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TongYongOneCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.leftImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"jkgl%ld",126+indexPath.row]];
    cell.leftLB.text = self.leftArr[indexPath.row];
    
    if (indexPath.row == 0 && self.model.countDetailCalender + self.model.countSystem  >  0 ) {
        CGFloat w = [[NSString stringWithFormat:@"%ld",self.model.countDetailCalender + self.model.countSystem] getWidhtWithFontSize:10];
        cell.rightLB.layer.cornerRadius = 10;
        cell.rightLB.clipsToBounds = YES;
        cell.rightLB.hidden = NO;
        cell.rightLB.mj_x = ScreenW - 20-15;
        cell.rightLB.backgroundColor = GreenColor;
        cell.rightLB.textColor = WhiteColor;
        cell.rightLB.font = kFont(10);
        cell.rightLB.text = [NSString stringWithFormat:@"%ld",self.model.countDetailCalender + self.model.countSystem + self.model.countImmediateLog];
        if (w+10 < 20) {
            cell.rightLB.mj_w = 20;
            cell.rightLB.mj_x = ScreenW - 20- 35;
        }else {
            cell.rightLB.mj_w = w+10;
            cell.rightLB.mj_x = ScreenW - w -10 -35;
        }
        
        
    }else {
        cell.rightLB.hidden = YES;
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        ACLMineMessageTVC * vc =[[ACLMineMessageTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1) {
        
    }else if (indexPath.row == 2) {
        ALCProductHelpTVC * vc =[[ALCProductHelpTVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else {
        ALCFaceBackTVC * vc =[[ALCFaceBackTVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
