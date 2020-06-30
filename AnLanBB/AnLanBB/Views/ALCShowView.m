//
//  ALCShowView.m
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCShowView.h"
@interface ALCShowView()
@property(nonatomic,strong)UIView *whiteVOne,*whiteViewTwo;
@property(nonatomic,assign)NSInteger showType;
@property(nonatomic,strong)UIView *lineV,*lineTwoV,*LineThreeV;
@property(nonatomic,strong)UIButton *confirmBt,*confirmTwo;
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UILabel *titleLB;
@end


@implementation ALCShowView


- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        UIButton * bb = [[UIButton alloc] initWithFrame:self.bounds];
        [self addSubview:bb];
        [bb addTarget:self action:@selector(diss) forControlEvents:UIControlEventTouchUpInside];
        
        self.whiteVOne = [[UIView alloc] initWithFrame:CGRectMake(30, 150, ScreenW - 60, 230)];
        
        self.whiteVOne.layer.cornerRadius = 5;
        self.whiteVOne.clipsToBounds = YES;
        self.whiteVOne.backgroundColor = WhiteColor;
        [self addSubview:self.whiteVOne];
        
        self.TFOne = [[UITextField alloc] initWithFrame:CGRectMake(15, 10, ScreenW - 90, 30)];
        self.TFOne.placeholder = @"患者姓名(必填)";
        self.TFOne.font = kFont(14);
        [self.whiteVOne addSubview:self.TFOne];
        
        UIView * backVOne =[[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.TFOne.frame) + 9.4 , ScreenW-90, 0.6)];
        backVOne.backgroundColor = lineBackColor;
        [self.whiteVOne addSubview:backVOne];
        
        
        self.TFTwo = [[UITextField alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(backVOne.frame) + 10, ScreenW - 90, 30)];
        self.TFTwo.placeholder = @"患者手机号(必填)";
        self.TFTwo.font = kFont(14);
        [self.whiteVOne addSubview:self.TFTwo];
        
        UIView * backVTwo =[[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.TFTwo.frame) + 9.4, ScreenW-90, 0.6)];
        backVTwo.backgroundColor = lineBackColor;
        
        [self.whiteVOne addSubview:backVTwo];
        self.lineTwoV = backVTwo;
        

        self.TFFour = [[UITextField alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(backVTwo.frame) + 10, ScreenW - 90, 30)];
        self.TFFour.placeholder = @"医生(必选)";
        self.TFFour.font = kFont(14);
        self.TFFour.userInteractionEnabled = NO;
        [self.whiteVOne addSubview:self.TFFour];
        
        

             
        self.chooseBt = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(backVTwo.frame) + 10, ScreenW - 90, 30)];
        [self.whiteVOne addSubview:self.chooseBt];
        
        [self.chooseBt addTarget:self action:@selector(chooseAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        
        UIView * backVFour =[[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.TFFour.frame) + 9.4, ScreenW-90, 0.6)];
             backVFour.backgroundColor = lineBackColor;
             [self.whiteVOne addSubview:backVFour];
        self.LineThreeV = backVFour;
        
        
        self.TFThree = [[UITextField alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(backVTwo.frame) + 10, ScreenW - 90, 30)];
        self.TFThree.placeholder = @"备注选填";
        self.TFThree.font = kFont(14);
        [self.whiteVOne addSubview:self.TFThree];
        
        UIView * backVTh =[[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.TFThree.frame) + 9.4, ScreenW-90, 0.6)];
        backVTh.backgroundColor = lineBackColor;
        [self.whiteVOne addSubview:backVTh];
        self.lineV = backVTh;
        
        self.confirmBt = [[UIButton alloc] initWithFrame:CGRectMake(15, 170, ScreenW - 90, 40)];
        self.confirmBt.titleLabel.font  = kFont(14);
        self.confirmBt.titleLabel.textColor = WhiteColor;
        [self.confirmBt setTitle:@"确定" forState:UIControlStateNormal];
        [self.confirmBt setBackgroundImage:[UIImage imageNamed:@"gback"] forState:UIControlStateNormal];
        [self.whiteVOne addSubview:self.confirmBt];
        self.confirmBt.layer.cornerRadius = 20;
        self.confirmBt.clipsToBounds = YES;
        
        self.whiteViewTwo =  [[UIView alloc] initWithFrame:CGRectMake(30, (ScreenH - 230)/2 - 20 , ScreenW - 60, 230)];
        
        self.whiteViewTwo.layer.cornerRadius = 5;
        self.whiteViewTwo.clipsToBounds = YES;
        self.whiteViewTwo.backgroundColor = WhiteColor;
        
        self.titleLB = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, ScreenW - 80, 20)];
        self.titleLB.text = @"上传成功";
        self.titleLB.font = kFont(14);
        self.titleLB.textAlignment = NSTextAlignmentCenter;
        [self.whiteViewTwo addSubview:self.titleLB];
        
        self.imgV = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenW - 60-183)/2, 50, 183, 110)];
        self.imgV.image = [UIImage imageNamed:@"jkgl124"];
        [self.whiteViewTwo addSubview:self.imgV];
        
        self.confirmTwo = [[UIButton alloc] initWithFrame:CGRectMake(15, 170, ScreenW - 90, 40)];
        self.confirmTwo.titleLabel.font  = kFont(14);
        self.confirmTwo.titleLabel.textColor = WhiteColor;
        [self.confirmTwo setTitle:@"我知道了" forState:UIControlStateNormal];
        [self.confirmTwo setBackgroundImage:[UIImage imageNamed:@"gback"] forState:UIControlStateNormal];
        [self.whiteViewTwo addSubview:self.confirmTwo];
        self.confirmBt.tag = 100;
        self.confirmTwo.tag = 101;
        self.confirmTwo.layer.cornerRadius = 20;
        self.confirmTwo.clipsToBounds = YES;
        [self.confirmBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.confirmTwo addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.whiteViewTwo];
        
    }
    return self;
}

- (void)clickAction:(UIButton *)button {
    if (self.showType == 1 ) {
        if (self.TFOne.text.length == 0) {
            [SVProgressHUD showErrorWithStatus:@"请填写患者名字"];
            return;
        }
        if (self.sendDataBlcok != nil) {
            self.sendDataBlcok(self.TFOne.text,self.TFTwo.text, self.TFThree.text, self.showType);
        }
    }else if (self.showType == 2) {
       if (self.TFOne.text.length == 0) {
            [SVProgressHUD showErrorWithStatus:@"请填写患者名字"];
            return;
        }
        if (self.TFTwo.text.length == 0) {
            [SVProgressHUD showErrorWithStatus:@"请填写患者手机号"];
            return;
        }
        if (self.sendDataBlcok != nil) {
            self.sendDataBlcok(self.TFOne.text,self.TFTwo.text, self.TFThree.text, self.showType);
        }
    }else if (self.showType == 3) {
        
        [self diss];
        
//        self.sendDataBlcok(self.TFOne.text,self.TFTwo.text, self.TFThree.text, self.showType);
        
    }else {
       if (self.sendDataBlcok != nil) {
           self.sendDataBlcok(self.TFOne.text,self.TFTwo.text, self.TFThree.text, self.showType);
        }
    }
    
    
    
}

- (void)showWithType:(NSInteger)type {
    
    self.showType = type;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    }];
    
}

- (void)setShowType:(NSInteger)showType {
    _showType = showType;
    if (showType == 1) {
        self.whiteViewTwo.hidden = YES;
        self.whiteVOne.hidden = NO;
        self.whiteVOne.mj_h = 230+50;
        self.TFFour.hidden = self.LineThreeV.hidden = self.chooseBt.hidden = NO;
        self.TFThree.mj_y = CGRectGetMaxY(self.LineThreeV.frame) + 10;
        self.lineV.mj_y = CGRectGetMaxY(self.TFThree.frame) + 9.4;
        self.TFTwo.placeholder = @"或者手机号(必填)";
        self.confirmBt.mj_y = 170+50;

    }else if (showType == 2) {
        
        self.whiteViewTwo.hidden = YES;
        self.whiteVOne.hidden = NO;
        self.whiteVOne.mj_h = 230;
        self.TFFour.hidden = self.LineThreeV.hidden = self.chooseBt.hidden = YES;
        self.TFThree.mj_y = CGRectGetMaxY(self.lineTwoV.frame) + 10;
        self.lineV.mj_y = CGRectGetMaxY(self.TFThree.frame) + 9.4;
        self.TFTwo.placeholder = @"或者手机号(必填)";
        self.confirmBt.mj_y = 170;
    }else if (showType == 3) {
        self.whiteViewTwo.hidden = NO;
        self.whiteVOne.hidden = YES;
        [self.confirmTwo setTitle:@"我知道了" forState:UIControlStateNormal];
        self.titleLB.text = @"上传成功";
        self.imgV.image = [UIImage imageNamed:@"jkgl124"];
    }else {
        self.whiteViewTwo.hidden = NO;
        self.whiteVOne.hidden = YES;
        [self.confirmTwo setTitle:@"重新上传" forState:UIControlStateNormal];
        self.titleLB.text = @"上传失败";
        self.imgV.image = [UIImage imageNamed:@"jkgl125"];
    }
}


- (void)diss {
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)chooseAction {
    if (self.chooseDorBlock != nil) {
        self.chooseDorBlock();
    }
}


@end
