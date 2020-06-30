//
//  ALCHomeNewHeadView.m
//  AnLanBB
//
//  Created by zk on 2020/6/2.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCHomeNewHeadView.h"


//么条先宽度 0.5

#define cellWidth 2
#define allTime 86400
#define boWW 1
#define space 1
#define avger 30;
#define timeW 120

@interface ALCHomeNewHeadView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UIView *boxingView;

@property(nonatomic,strong)NSMutableArray *itemLayerArr;
@property(nonatomic,assign)CGRect lastFrame;
@property(nonatomic,assign)CGFloat allx;
@property(nonatomic,assign)NSInteger labelNumber , imgVNumer;
@property(nonatomic,strong)UIView *lineV;

@property(nonatomic,strong)UIView *btView;
@property(nonatomic,strong)UILabel *timeLB;

@property(nonatomic,strong)UIView *tableFootView;


@end

@implementation ALCHomeNewHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        
        self.imgVNumer = 0;
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW - 60, sstatusHeight + 2, 40, 40)];
//        button.backgroundColor = [UIColor redColor];
        [button setImage:[UIImage imageNamed:@"cha"] forState:UIControlStateNormal];
        button.tag = 99;
        [self addSubview:button];
        
        
        UIScrollView * sc1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0,sstatusHeight + 44, ScreenW , 20 + 120 + 30)];
        sc1.contentSize =  CGSizeMake(cellWidth * allTime + 80 * cellWidth , 140);
        [self addSubview:sc1];
        sc1.showsVerticalScrollIndicator = NO;
        sc1.showsHorizontalScrollIndicator = NO;
        
        self.scrollView = sc1;
        self.scrollView.scrollEnabled = NO;
        self.scrollView.backgroundColor = RGB(47, 47, 57);
//        sc1.backgroundColor = [UIColor redColor];
        
        self.boxingView = [[UIView alloc] initWithFrame:CGRectMake(0, 20 , cellWidth * allTime + 80 * cellWidth, 120)];
        [sc1 addSubview:self.boxingView];
        NSArray * arr = @[@"00:00",@"00:30",@"01:00",@"01:30",@"02:00"];
        for (int i = 0 ; i < arr.count ; i++) {
            UILabel * timeLB = [[UILabel alloc] initWithFrame:CGRectMake(timeW * i, 0, 60, 20)];
            timeLB.font = kFont(10);
            timeLB.textAlignment = NSTextAlignmentLeft;
            timeLB.textColor = CharacterColor180;
            timeLB.text = arr[i];
            [sc1 addSubview:timeLB];
        }
        
        self.labelNumber = arr.count;
        self.lineV = [[UIView alloc] initWithFrame:CGRectMake(-1, 20 , boWW, 120)];
        [sc1 addSubview:self.lineV];
        self.lineV.backgroundColor = RGB(0, 129, 112);
        
        
        self.btView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView.frame), ScreenW, 170)];
        [self addSubview:self.btView];
        self.btView.backgroundColor = RGB(59, 59, 69);
        
        self.timeLB = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, ScreenW, 30)];
        self.timeLB.font = [UIFont systemFontOfSize:18 weight:0.2];
        [self.btView addSubview:self.timeLB];
        self.timeLB.textAlignment = NSTextAlignmentCenter;
        self.timeLB.textColor = WhiteColor;
        self.timeLB.text = @"00:00";
        
        
        self.centerBt = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW /2 - 35, 70 , 70, 70)];
        [self.centerBt setImage:[UIImage imageNamed:@"jkgl152"] forState:UIControlStateNormal];
        [self.btView addSubview:self.centerBt];
        self.centerBt.layer.cornerRadius = 35;
        self.centerBt.clipsToBounds = YES;
        self.centerBt.backgroundColor = RGB(47, 47, 57);
        self.centerBt.tag = 101;
        
        
        self.leftBt =  [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width /2 - 25 - 60 - 50 , 70 + 10, 50, 50)];
        [self.leftBt setImage:[UIImage imageNamed:@"jkgl112"] forState:UIControlStateNormal];
        self.leftBt.layer.cornerRadius = 25;
        self.leftBt.clipsToBounds = YES;
        self.leftBt.tag = 100;
        self.leftBt.titleLabel.font = kFont(16);
        [self.leftBt setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        self.leftBt.titleLabel.textColor = WhiteColor;
        self.leftBt.backgroundColor = RGB(47, 47, 57);
        [self.btView addSubview:self.leftBt];
        
        
        self.rightBt =  [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width /2+25+60  , 70 + 10, 50, 50)];
        [self.rightBt setImage:[UIImage imageNamed:@"jkgl149"] forState:UIControlStateNormal];
        self.rightBt.layer.cornerRadius = 25;
        self.rightBt.clipsToBounds = YES;
        [self.rightBt setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        self.rightBt.titleLabel.textColor = WhiteColor;
        self.rightBt.backgroundColor = RGB(47, 47, 57);
        [self.btView addSubview:self.rightBt];
        self.rightBt.tag = 102;
        self.backgroundColor = RGB(47, 47, 57);
        [self.rightBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
         [self.leftBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
         [self.centerBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
         [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setTimeNumber:(NSInteger)timeNumber {
    _timeNumber = timeNumber;
    self.timeLB.text = [NSString stringWithTimelong:timeNumber];
}

- (void)setPowerValue:(CGFloat)powerValue { // -120 到  60
    _powerValue = powerValue;
    
    CGFloat scale = powerValue;
    if (scale < 0) {
        scale = 0;
    }
    CGFloat hh  = 10 +scale /40.0 * 110;
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake((space + boWW) + self.allx, (120 - hh)/2.0 , boWW, hh);
    self.allx = (space + boWW) + self.allx + space;
    gradient.colors = @[(id)RGB(104, 212, 125).CGColor,(id)RGB(193, 223, 103).CGColor];
    gradient.startPoint = CGPointMake(0.5, 1);
    gradient.endPoint = CGPointMake(0.5, 0);
    [self.boxingView.layer addSublayer:gradient];
    //    [self.itemLayerArr addObject:gradient];
    self.lineV.mj_x = self.allx;
    [self scrollAction];
    
   
    
}

- (void)isOver {
    [self.boxingView removeFromSuperview];
    self.imgVNumer = 0;
    self.boxingView = [[UIView alloc] initWithFrame:CGRectMake(0, 20 , cellWidth * allTime + 80 * cellWidth, 120)];
    [self.scrollView addSubview:self.boxingView];
    NSArray * arr = @[@"00:00",@"00:30",@"01:00",@"01:30",@"02:00"];
    for (int i = 0 ; i < arr.count ; i++) {
        UILabel * timeLB = [[UILabel alloc] initWithFrame:CGRectMake(timeW * i, 0, 60, 20)];
        timeLB.font = kFont(10);
        timeLB.textAlignment = NSTextAlignmentLeft;
        timeLB.textColor = CharacterColor180;
        timeLB.text = arr[i];
        [self.scrollView addSubview:timeLB];
    }
    
    
   
    
    self.lineV.mj_x = -1;
    self.allx = 0;
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.labelNumber = 5;
    
    for (int i = 0 ; i < 1000; i++) {
        UILabel * lb = [self.scrollView viewWithTag:1000+i];
        if (lb != nil) {
            [lb removeFromSuperview];
        }else {
            break;
        }
    }
    for (int i = 0 ; i < 1000; i++) {
        UIImageView * lb = [self.scrollView viewWithTag:100+i];
        if (lb != nil) {
            [lb removeFromSuperview];
        }else {
            break;
        }
    }
    
    
}

- (void)clickAction:(UIButton *)button {
    if (button.tag == 102 ){
        if (self.allx > 0) {
            UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.allx, 140 + 10 , 15, 15)];
            imgV.image = [UIImage imageNamed:@"jkgl148"];
            imgV.tag = 100+self.imgVNumer;
            [self.scrollView addSubview:imgV];
            self.imgVNumer++;
        }else {
            return;
        }
        
    }

    if (self.clickButtonBlock != nil) {
        self.clickButtonBlock(button.tag);
    }
    
}

- (void)scrollAction {
    
    if (self.allx < ScreenW/2) {
        
    }else {
        self.scrollView.contentOffset = CGPointMake(self.allx - (int)(ScreenW/2), 0);
    }
    if (ScreenW +  self.scrollView.contentOffset.x >= timeW*self.labelNumber) {
        
        UILabel * timeLB = [[UILabel alloc] initWithFrame:CGRectMake(timeW * self.labelNumber, 0, 60, 20)];
        timeLB.font = kFont(10);
        timeLB.textAlignment = NSTextAlignmentLeft;
        timeLB.textColor = CharacterColor180;
        timeLB.tag = 1000 + self.labelNumber;
        timeLB.text = [NSString stringWithTimelong:self.labelNumber * 30];
        [self.scrollView addSubview:timeLB];
        self.labelNumber = self.labelNumber + 1;
    }
}






@end







