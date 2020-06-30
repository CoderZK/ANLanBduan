//
//  HomeVC.m
//  AnLanBB
//
//  Created by kunzhang on 2018/7/2.
//  Copyright © 2018年 kunzhang. All rights reserved.
//

#import "HomeVC.h"
#import "ALCLoginOneVC.h"
#import "ALCLuYinJiLuTVC.h"
#import "ALCHomeFootV.h"
#import "ALCHomeHeadView.h"
#import "ALCHomeLuYinCell.h"
#import "ALCShowView.h"
#import "ALCLuYinDetailTVC.h"
#import "ALCLuYinDongTaiView.h"
#import "ALCJianKangRiZhiTVC.h"
#import "ALCSearchPeopleTVC.h"
#import "ALCHomeNewHeadView.h"

@interface HomeVC ()<TZImagePickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,AVAudioPlayerDelegate>
@property(nonatomic,strong)ALCHomeFootV *footV;
//@property(nonatomic,strong)ALCHomeHeadView *headV;
@property(nonatomic,strong)ALCShowView *showView;
@property(nonatomic,strong)ALCLuYinDongTaiView *luYinBoView;
@property(nonatomic,assign)NSInteger showType;
@property(nonatomic,assign)BOOL isChooseVideo ,isDiss;
@property(nonatomic,strong)NSMutableArray<ALMessageModel *> *picsArr;
@property(nonatomic,strong)NSString *videoStr;
//@property(nonatomic,strong)NSMutableArray *numberArr;
@property(nonatomic,strong)CAShapeLayer *itemline;
@property(nonatomic,strong)CAGradientLayer *yy;
@property(nonatomic,assign)CGFloat timeNumber;
@property(nonatomic,strong)NSString *appointment_id;
@property(nonatomic,strong)NSString *audioStr,*fileName;
@property(nonatomic,strong)NSString *customerId;
@property(nonatomic,strong)NSString *qiNiuToken;
@property(nonatomic,strong)NSString *hashStr;
@property(nonatomic,strong)NSString *dortID;
@property(nonatomic,strong)NSString *nameStr,*phoneStr,*markStr;
@property(nonatomic,strong)ALCHomeNewHeadView *newheadV;
@property(nonatomic,strong)NSMutableArray *markTimeArr;
@property(nonatomic,strong)NSString *appointmentType,*patientId;




@end

@implementation HomeVC

- (ALCShowView *)showView {
    if (_showView == nil) {
        _showView = [[ALCShowView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    }
    return _showView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.picsArr = @[].mutableCopy;
    self.markTimeArr = @[].mutableCopy;
//    self.numberArr = @[].mutableCopy;
//    for (int i = 0 ; i < 50; i++) {
//        [self.numberArr addObject:@(0)];
//    }
    
    self.navigationItem.title = @"录音";
    self.customerId = @"-1";
    self.appointment_id = @"-1";
    
    [self setnavigateV];
    
    [self setFootView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ALCHomeLuYinCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.showType = 1;
    
    self.luYinBoView = [[ALCLuYinDongTaiView alloc] initWithFrame:CGRectMake((ScreenW - 248)/2, 40, 248, 70)];
    //    [self.headV addSubview:self.luYinBoView];
    
    [self getaudioToken];
    [self getaudioToken];
    
    
    //    ALCHomeNewHeadView * newheadV = [[ALCHomeNewHeadView alloc] initWithFrame:CGRectMake(0, 100, ScreenW, sstatusHeight + 44 + 330)];
    //    newheadV.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:newheadV];
    //    self.newheadV = newheadV;
    
}

//- (void)gogo {
//
//    self.timeNumber+=1;
//    self.yy.frame = CGRectMake(10*(self.timeNumber%15), (200- 10- (self.timeNumber%15) * 6)/2, 10, 10+ (self.timeNumber % 15) * 6);
//
//}

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


- (void)setFootView{
    
    self.footV = [[ALCHomeFootV alloc] initWithFrame:CGRectMake(0, ScreenH - 80 , ScreenW, 80)];
    [self.view addSubview:self.footV];
    self.footV.hidden = YES;
    self.footV.backgroundColor = self.tableView.backgroundColor = self.view.backgroundColor = RGB(59, 59, 69);
    
    ALCHomeNewHeadView * newheadV = [[ALCHomeNewHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, sstatusHeight + 44 + 330)];
    [self.view addSubview:newheadV];
    self.newheadV = newheadV;
    [self.view addSubview:self.newheadV];
    
    //    self.headV = [[ALCHomeHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, sstatusHeight + 44 + 330)];
    //    [self.view addSubview:self.headV];
    
    self.footV.frame = CGRectMake(0, ScreenH - 80 , ScreenW, 80);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.newheadV.mas_bottom);
        make.bottom.equalTo(self.footV.mas_top);
    }];
    
//    self.tableView.frame = CGRectMake(0, sstatusHeight + 44 + 330, ScreenW, ScreenH - 80 - (sstatusHeight + 44 + 330));
//    if (sstatusHeight > 20) {
//        self.tableView.frame = CGRectMake(0, sstatusHeight + 44 + 330, ScreenW, ScreenH - 80 - 34-(sstatusHeight + 44 + 330));
//        self.footV.frame = CGRectMake(0, ScreenH - 80 , ScreenW, 80);
//    }
//
    [self.footV.centerBt addTarget:self action:@selector(footClickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    Weak(weakSelf);
    self.newheadV.clickButtonBlock = ^(NSInteger tag) {
        if (tag == 99) {
            self.isDiss = YES;
            [[ALCAudioTool shareTool] stopRecord];
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }else if (tag == 100) {
            if ([weakSelf.newheadV.centerBt.currentImage isEqual:[UIImage imageNamed:@"jkgl150"]]) {
                [SVProgressHUD showErrorWithStatus:@"先暂停录音,在操作"];
                return;
            }else {
                [weakSelf showAlertV];
            }
        }else if (tag == 101) {
            
            AVAuthorizationStatus videoAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
            if (videoAuthStatus == AVAuthorizationStatusNotDetermined) {
                AVAudioSession *audioSession = [AVAudioSession sharedInstance];
                [audioSession respondsToSelector:@selector(requestRecordPermission:)];
                [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {}];
                return;
            }
            
            if (![[ALCAudioTool shareTool] checkMicrophonePermission]) {
                [[ALCAudioTool shareTool] popUpMicrophonePermissionAlertView];
                return;
            }
            
            
            if ([weakSelf.newheadV.centerBt.currentImage isEqual:[UIImage imageNamed:@"jkgl152"]]) {
                [[ALCAudioTool shareTool] startRecord];
                weakSelf.footV.hidden = NO;
                //                    Weak(weakSelf);
                [[ALCAudioTool shareTool] setAveragePowerBlock:^(CGFloat averagePower, NSInteger timeNumber) {
                    //                weakSelf.headV.timeLB.text = [NSString stringHHMMSSWithTime:[[NSString stringWithFormat:@"%ld",(long)timeNumber] floatValue]];
                    //                [weakSelf.numberArr addObject:@(averagePower)];
                    //                [weakSelf.numberArr removeObjectAtIndex:0];
                    //                weakSelf.luYinBoView.dataArray = weakSelf.numberArr;
                    weakSelf.newheadV.timeNumber = timeNumber/10.0;
                    weakSelf.timeNumber = timeNumber/10.0;
                    if (timeNumber % 5 == 0) {
                        weakSelf.newheadV.powerValue = averagePower;
                    }
                }];
                [weakSelf.newheadV.centerBt setImage:[UIImage imageNamed:@"jkgl150"] forState:UIControlStateNormal];
            }else {
                [[ALCAudioTool shareTool] pauaseRecord];
                [weakSelf.newheadV.centerBt setImage:[UIImage imageNamed:@"jkgl152"] forState:UIControlStateNormal];
            }
            
        }else if (tag == 102){
            //标记
            NSDictionary * dict = @{@"id":[NSString stringWithFormat:@"%ld",self.markTimeArr.count +1],@"flagTime":@(self.timeNumber * 1000)};
            [self.markTimeArr addObject:dict];
            
            
        }
    };
    
    
}

- (void)footClickAction:(UIButton *)button {
    
    if (self.audioStr.length > 0) {
        [self showAleart];
    }
    Weak(weakSelf);
    [[ALCAudioTool shareTool] stopRecord];
    //                Weak(weakSelf);
    [[ALCAudioTool shareTool] setStatusBlock:^(BOOL isFinsh, NSData * _Nonnull mediaData) {
        [weakSelf.newheadV isOver];
        NSLog(@"%@",@"录音完成");
        [weakSelf.newheadV.centerBt setImage:[UIImage imageNamed:@"jkgl152"] forState:UIControlStateNormal];
        if (weakSelf.isDiss) {
            return ;
        }
        [weakSelf updateImgsToQiNiuYunWithImageArr:nil andData:mediaData withType:3];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.picsArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ALCHomeLuYinCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    ALMessageModel * model = self.picsArr[indexPath.row];
    cell.model = model;
    cell.numberLB.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.delectBt.tag = indexPath.row;
    [cell.delectBt addTarget:self action:@selector(delectAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}




//点击删除
- (void)delectAction:(UIButton *)button {
    [self.picsArr removeObjectAtIndex:button.tag];
    [self.tableView reloadData];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ALMessageModel * model = self.picsArr[indexPath.row];
    if (model.type == 2) {
        [PublicFuntionTool presentVideoVCWithNSString:model.qiniu_url isBenDiPath:NO];
    }else if (model.type == 1) {
        [[zkPhotoShowVC alloc] initWithArray:@[model.qiniu_url] index:0];
    }
    
}






- (void)showAlertV {
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"相机拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([self isCanUsePhotos]) {
            
            [self showMXPhotoCameraAndNeedToEdit:YES completion:^(UIImage *image, UIImage *originImage, CGRect cutRect) {
                [self updateImgsToQiNiuYunWithImageArr:@[image] andData:nil withType:1];
            }];
            
            
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"相册图片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.isChooseVideo = NO;
        [self choosePicOrVideo];
    }];
    
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"相机录像" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([self isCanUsePhotos]) {
            
            if (self.picsArr.count > 0 && self.picsArr[0].type  == 2) {
                [SVProgressHUD showErrorWithStatus:@"只能添加一个视频,如有需要请删除原有视频"];
                return ;
            }
            
            [self captureVideoButtonClick];
            
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }];
    UIAlertAction *action5 = [UIAlertAction actionWithTitle:@"相册视频" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([self isCanUsePhotos]) {
            self.isChooseVideo = YES;
            if (self.picsArr.count > 0 && self.picsArr[0].type  == 2) {
                [SVProgressHUD showErrorWithStatus:@"只能添加一个视频,如有需要请删除原有视频"];
                return ;
            }
            [self choosePicOrVideo];
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [ac addAction:action1];
    [ac addAction:action2];
    [ac addAction:action4];
    [ac addAction:action5];
    [ac addAction:action3];
    
    [self.navigationController presentViewController:ac animated:YES completion:nil];
    
}


- (void)choosePicOrVideo {
    
    if ([self isCanUsePicture]) {
        
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:MAXFLOAT columnNumber:4 delegate:self pushPhotoPickerVc:YES];
        if (self.isChooseVideo) {
            imagePickerVc.allowTakeVideo = YES;
            imagePickerVc.allowPickingVideo = YES;
            imagePickerVc.allowPickingImage = NO;
            imagePickerVc.allowTakePicture = NO;
        }else {
            imagePickerVc.allowTakeVideo = NO;
            imagePickerVc.allowPickingVideo = NO;
            imagePickerVc.allowPickingImage = YES;
            imagePickerVc.allowTakePicture = YES;
        }
        imagePickerVc.showSelectBtn = NO;
        imagePickerVc.allowCrop = YES;
        imagePickerVc.needCircleCrop = NO;
        imagePickerVc.cropRectPortrait = CGRectMake(0, (ScreenH - ScreenW)/2, ScreenW, ScreenW);
        imagePickerVc.cropRectLandscape = CGRectMake(0, (ScreenW - ScreenH)/2, ScreenH, ScreenH);
        imagePickerVc.circleCropRadius = ScreenW/2;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            //                [self.picsArr addObjectsFromArray:photos];
            //                [self addPicsWithArr:self.picsArr];
            [self updateImgsToQiNiuYunWithImageArr:photos andData:nil withType:1];
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}


- (void)captureVideoButtonClick{
    [PublicFuntionTool showCameraVideoWithViewController:self];
    Weak(weakSelf);
    [PublicFuntionTool shareTool].videoBlock = ^(NSData *data) {
        [weakSelf updateImgsToQiNiuYunWithImageArr:nil andData:data withType:2];
    };
    
}


- (void)play {
    [PublicFuntionTool presentVideoVCWithNSString:[QYZJURLDefineTool getVideoURLWithStr:self.videoStr] isBenDiPath:NO];
}

#pragma mark ------ 如下是图片和视频的处理上传过程 ------
//视频选择结束
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(PHAsset *)asset {
    
    [SVProgressHUD show];
    
    [PublicFuntionTool getImageFromPHAsset:asset Complete:^(NSData * _Nonnull data, NSString * _Nonnull str) {
        [self updateImgsToQiNiuYunWithImageArr:nil andData:data withType:2];
    }];
}

- (void)updateImgsToQiNiuYunWithImageArr:(NSArray *)imageArr andData:(NSData *)data withType:(NSInteger)type{
    
    if (![zkSignleTool shareTool].isLogin) {
        [self gotoLoginVC];
        return;
    }
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"type"] = @(type);
    [SVProgressHUD show];
    
    NSString * fileName = @"mp3";
    if (type == 2) {
        fileName = @"mp4";
    }
    
    [zkRequestTool NetWorkingUpLoad:[QYZJURLDefineTool upload_file_to_qiniuURL] images:imageArr imgName:@"file" fileData:data andFileName:fileName parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {
            
            if (type == 1) {//图片
                NSArray<ALMessageModel *> *arr = [ALMessageModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                for (ALMessageModel * model in arr) {
                    model.type = 1;
                    model.qiniu_url = [NSString stringWithFormat:@"http://%@",model.qiniu_url];
                    [self.picsArr addObject:model];
                }
                [self.tableView reloadData];
            }else if (type == 2) {//视频
                NSArray<ALMessageModel *> *arr = [ALMessageModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                for (ALMessageModel * model in arr) {
                    model.type = 2;
                    model.qiniu_url = [NSString stringWithFormat:@"http://%@",model.qiniu_url];
                    model.duration = [NSString stringWithFormat:@"%ld",[NSString durationWithVideo:model.qiniu_url]];;
                    [self.picsArr insertObject:model atIndex:0];
                }
                [self.tableView reloadData];
            }else if (type == 3){//音频
                
                NSArray<ALMessageModel *> *arr = [ALMessageModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                if (arr.count > 0) {
                    self.audioStr = [NSString stringWithFormat:@"http://%@",arr[0].qiniu_url];
                    self.fileName = [NSString stringWithFormat:@"%@",arr[0].fname];
                    self.hashStr = [NSString stringWithFormat:@"%@",arr[0].hashStr];
                }
                
                [self showAleart];
                
                //  [self showOkView];
                
                
            }
        }else {
            [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
        }
        
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    
    
}

- (void)showAleart {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"客户是否与预约" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"有预约" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        ALCJianKangRiZhiTVC * vc =[[ALCJianKangRiZhiTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
        vc.hidesBottomBarWhenPushed = YES;
        Weak(weakSelf);
        //点击有预约的时候
        vc.sendYuYueIDBlock = ^(NSString * _Nonnull dorID,NSString * _Nonnull appID ,NSString * _Nonnull consumerID, NSString * _Nonnull nameStr, NSString * _Nonnull phnoeStr,NSString * _Nonnull appointmentType, NSString * _Nonnull patientId) {
            [weakSelf showOkView];
            weakSelf.dortID = dorID;
            weakSelf.appointment_id = appID;
            weakSelf.customerId = consumerID;
            weakSelf.showView.TFOne.text = nameStr;
            weakSelf.showView.TFTwo.text = phnoeStr;
            weakSelf.patientId = patientId;
            weakSelf.appointmentType = appointmentType;
        };
        [self.navigationController pushViewController:vc animated:YES];
        
        
        
        
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"无预约" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        
        
        [self.showView showWithType:1];
        self.showView.hidden = NO;
        Weak(weakSelf);
        self.showView.sendDataBlcok = ^(NSString * _Nonnull nameStr, NSString * _Nonnull phoneStr, NSString * _Nonnull desStr, NSInteger type) {
            
            [weakSelf uploadServerWith:nameStr phoneStr:phoneStr desStr:desStr];
            
            
        };
        self.showView.chooseDorBlock = ^{
            weakSelf.showView.hidden = YES;
            //点击选择医生的时候
            ALCSearchPeopleTVC* vc =[[ALCSearchPeopleTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
            vc.hidesBottomBarWhenPushed = YES;
            vc.isComeLuYin = YES;
            vc.sendDorBlock = ^(QYZJUserModel * _Nonnull model) {
                weakSelf.showView.hidden = NO;
                weakSelf.dortID = model.doctorId;
                weakSelf.customerId = @"-1";
                weakSelf.appointment_id = @"-1";
                weakSelf.showView.TFFour.text = [NSString stringWithFormat:@"%@ %@",model.doctorName,model.departName];
            };
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        
    }];
    [ac addAction:action1];
    [ac addAction:action2];
    [self.navigationController presentViewController:ac animated:YES completion:nil];
    
    
}


- (void)showOkView {
    
    [self.showView showWithType:2];
    Weak(weakSelf);
    self.showView.sendDataBlcok = ^(NSString * _Nonnull nameStr, NSString * _Nonnull phoneStr, NSString * _Nonnull desStr, NSInteger type) {
        
        [weakSelf uploadServerWith:nameStr phoneStr:phoneStr desStr:desStr];
        
        
    };
    
}

- (void)uploadServerWith:(NSString *)nameStr phoneStr:(NSString *)phoneStr desStr:(NSString *)desStr {
    
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"url"] = self.audioStr;
    dict[@"phone"] = phoneStr;
    dict[@"remark"]= desStr;
    dict[@"duration"] = @([NSString durationWithVideo:self.audioStr]);
    dict[@"deviceId"] = @"123456";
    dict[@"type"] = @"3";
    dict[@"appointment_id"] = self.appointment_id;
    dict[@"customerId"] = self.customerId;
    dict[@"customerName"] = nameStr;
    dict[@"fileName"] =  self.fileName;
    dict[@"hash"] = self.hashStr;
    dict[@"doctorId"] = self.dortID;
    dict[@"signVoice"] = self.markTimeArr;
    dict[@"patientId"] = self.patientId;
    dict[@"appointmentType"] = self.appointmentType;
    NSMutableArray * arr = @[].mutableCopy;
    
    self.phoneStr = phoneStr;
    self.nameStr = nameStr;
    self.markStr = desStr;
    
    for (ALMessageModel * model in self.picsArr) {
        NSMutableDictionary * dd = @{}.mutableCopy;
        dd[@"type"] = @(model.type);
        dd[@"duration"] = model.duration;
        dd[@"url"] = model.qiniu_url;
        [arr addObject:dd];
    }
    
    dict[@"list"] = arr;
    NSString * str = [NSString convertToJsonDataWithDict:dict];
    
    [zkRequestTool networkingPOST:[QYZJURLDefineTool user_appB_addVoiceRecordURL] parameters:@{@"jsonString":str} success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {
            [self.showView showWithType:3];
            [self.picsArr removeAllObjects];
            [self.tableView reloadData];
            
            self.customerId = @"-1";
            self.appointment_id = @"-1";
            self.audioStr = @"";
            
            //            self.headV.timeLB.text = @"00:00";
            self.luYinBoView.isOk = YES;
            
        }else {
            [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
            //            [self.showView showWithType:4];
            [self.showView diss];
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [self.showView diss];
        
    }];
    
    
}


- (void)getaudioToken {
    
    [zkRequestTool networkingPOST:[QYZJURLDefineTool getTokenAudioURL] parameters:@{} success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject[@"key"] intValue] == 1) {
            self.qiNiuToken = responseObject[@"data"];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    
}

- (void)updateLoadMediaWithData:(NSData *)data {
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"token"] = self.qiNiuToken;
    [zkRequestTool NetWorkingUpLoadMediaWithfileData:data parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        //               [SVProgressHUD showSuccessWithStatus:@"上传音频成功"];
        //               self.dataArray[indexPath.section].mediaUrl = responseObject[@"key"];
        //               [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"\n\n------%@",error);
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
