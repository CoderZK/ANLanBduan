//
//  ALCHomeFootV.m
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCHomeFootV.h"

@implementation ALCHomeFootV
- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_1"]];
        
        self.centerBt = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width /2 - 60, frame.size.height/2 - 20,120, 40)];
        [self.centerBt setBackgroundImage:[UIImage imageNamed:@"gback"] forState:UIControlStateNormal];
        [self.centerBt setTitle:@"完成" forState:UIControlStateNormal];
        self.centerBt.titleLabel.font = kFont(15);
        [self.centerBt setTitleColor:WhiteColor forState:UIControlStateNormal];
        [self addSubview:self.centerBt];
        self.centerBt.tag = 103;
        self.centerBt.layer.cornerRadius = 20;
        self.centerBt.clipsToBounds = YES;
        
        
//       self.leftBt =  [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width /2 - 25 - 35 - 70 , frame.size.height/2 - 17.5, 70, 35)];
//        [self.leftBt setImage:[UIImage imageNamed:@"jkgl112"] forState:UIControlStateNormal];
//        self.leftBt.layer.cornerRadius = 17.5;
//        self.leftBt.clipsToBounds = YES;
//        self.leftBt.tag = 100;
//        [self.leftBt setTitle:@"拍照" forState:UIControlStateNormal];
//        self.leftBt.titleLabel.font = kFont(16);
//        [self.leftBt setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
//        self.leftBt.titleLabel.textColor = WhiteColor;
//        self.leftBt.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
//        [self addSubview:self.leftBt];
//
        
//        self.rightBt =  [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width /2+25+35 , frame.size.height/2 - 17.5, 70, 35)];
//        [self.rightBt setImage:[UIImage imageNamed:@"jkgl113"] forState:UIControlStateNormal];
//        self.rightBt.layer.cornerRadius = 17.5;
//        self.rightBt.clipsToBounds = YES;
//        [self.rightBt setTitle:@"完成" forState:UIControlStateNormal];
//        self.rightBt.titleLabel.font = kFont(16);
//        [self.rightBt setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
//        self.rightBt.titleLabel.textColor = WhiteColor;
//        self.rightBt.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
//        [self addSubview:self.rightBt];
//        self.rightBt.tag = 102;
        
        
        
    }
    return self;
}
@end
