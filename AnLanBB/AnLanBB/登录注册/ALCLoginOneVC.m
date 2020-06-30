//
//  ALCLoginOneVC.m
//  AnLanCustomers
//
//  Created by zk on 2020/3/19.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCLoginOneVC.h"
@interface ALCLoginOneVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imgVTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imgVOne;
@property (weak, nonatomic) IBOutlet UIImageView *imgVTh;
@property (weak, nonatomic) IBOutlet UITextField *TF;
@property (weak, nonatomic) IBOutlet UITextField *TFTwo;
@property (weak, nonatomic) IBOutlet UIView *viewOne;
@property(nonatomic,strong)NSMutableArray<QYZJUserModel
*> *dataArray;
@end

@implementation ALCLoginOneVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TFTwo.secureTextEntry = YES;
         self.imgVOne.layer.cornerRadius = self.imgVTwo.layer.cornerRadius = self.viewOne.layer.cornerRadius =22.5;
        self.viewOne.clipsToBounds = self.imgVTwo.clipsToBounds = self.imgVOne.clipsToBounds = YES;
        self.imgVTwo.backgroundColor =  self.imgVOne.backgroundColor =[UIColor colorWithWhite:0.6 alpha:0.4];
        self.viewOne.backgroundColor = [UIColor colorWithRed:0/255.0 green:221/255.0 blue:183/255.0 alpha:0.6];
        
    //    [self.TF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        
        
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:
        @{NSForegroundColorAttributeName:[UIColor whiteColor],
        NSFontAttributeName:self.TF.font
        }];
        self.TF.attributedPlaceholder = attrString;
    
    NSAttributedString *attrStringTwo = [[NSAttributedString alloc] initWithString:@"输入密码" attributes:
        @{NSForegroundColorAttributeName:[UIColor whiteColor],
        NSFontAttributeName:self.TFTwo.font
        }];
        self.TFTwo.attributedPlaceholder = attrStringTwo;
    
    self.dataArray = @[].mutableCopy;
    
}
- (IBAction)sourceAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.TFTwo.secureTextEntry = !sender.selected;
}

- (IBAction)action:(UIButton *)button  {
    if (button.tag == 100) {
        //注册
 
     
        
    }else if (button.tag == 101) {
        //电话区域
                [zkRequestTool NetWorkingUpLoad:[QYZJURLDefineTool upload_file_to_qiniuURL] images:@[[UIImage imageNamed:@"369"],[UIImage imageNamed:@"369"]] name:@"file" parameters:@{@"type":@1} success:^(NSURLSessionDataTask *task, id responseObject) {
                    
                    if ([responseObject[@"key"] intValue]== 1) {
        
                    }else {
                        [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    NSLog(@"%@",error);
        
                }];
                return;
        
    }else if (button.tag == 102) {
        
        

        
        //确定
        if (self.TF.text.length != 11) {
            [SVProgressHUD showErrorWithStatus:@"请输入11位手机号"];
            return;
        }
        if (self.TFTwo.text.length  == 0) {
            [SVProgressHUD showErrorWithStatus:@"请输入密码"];
            return;
        }
        [self getData];
        
    }else if (button.tag == 103) {
        //忘记密码
   
    }else if (button.tag == 104) {
        //微信
        
    }else if (button.tag == 105) {
//qq
        
    }else if (button.tag == 106) {
        //勾选
    }else if (button.tag == 107) {
        //协议
        
    }
    
    
    
    
    
}

- (void)getData {
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"phone"] = self.TF.text;
    dict[@"password"] = self.TFTwo.text;
    [zkRequestTool networkingPOST:[QYZJURLDefineTool appB_loginURL] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
   
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {
            
            self.dataArray = [QYZJUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            if (self.dataArray.count == 1) {
                QYZJUserModel * userModel = self.dataArray[0];
                
                [zkSignleTool shareTool].session_token = userModel.token;
                [zkSignleTool shareTool].isLogin = YES;
                [zkSignleTool shareTool].avatar = userModel.avatar;
                [zkSignleTool shareTool].nick_name = userModel.name;;
                 [[zkSignleTool shareTool] uploadDeviceToken];
                [self dismissViewControllerAnimated:YES completion:nil];
            }else {
            
                [self showAlertV];

            }
            
             
            
        }else {
            [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        

        
    }];
}


- (void)showAlertV {
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您有两种身份请选择其中一种身份进入APP" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"医生身份" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        for (QYZJUserModel * model  in self.dataArray) {
            if (model.type == 3) {
                QYZJUserModel * userModel = model;
                
                [zkSignleTool shareTool].session_token = userModel.token;
                [zkSignleTool shareTool].isLogin = YES;
                [zkSignleTool shareTool].avatar = userModel.avatar;
                [zkSignleTool shareTool].nick_name = userModel.name;;
                [[zkSignleTool shareTool] uploadDeviceToken];
                [self dismissViewControllerAnimated:YES completion:nil];
                break;
            }
        }
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"销售身份" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        for (QYZJUserModel * model  in self.dataArray) {
            if (model.type == 2) {
                QYZJUserModel * userModel = model;
                
                [zkSignleTool shareTool].session_token = userModel.token;
                [zkSignleTool shareTool].isLogin = YES;
                [zkSignleTool shareTool].avatar = userModel.avatar;
                [zkSignleTool shareTool].nick_name = userModel.name;;
                 [[zkSignleTool shareTool] uploadDeviceToken];
                [self dismissViewControllerAnimated:YES completion:nil];
                break;
            }
        }
      
    }];
    
    [ac addAction:action1];
    [ac addAction:action2];
    [self presentViewController:ac animated:YES completion:nil];
    
}





- (IBAction)diss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
