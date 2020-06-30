//
//  ALCMineDorterView.m
//  AnLanCustomers
//
//  Created by zk on 2020/3/19.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCMineDorterView.h"

@interface ALCMineDorterView()
@property(nonatomic,strong)UIView *whiteView;
@end

@implementation ALCMineDorterView

- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        
        self.whiteView = [[UIView alloc] init];
        [self addSubview:self.whiteView];
        [self.whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self).offset(15);
            make.bottom.equalTo(self).offset(-15);
        }];
        
        self.backgroundColor = WhiteColor;
    }
    return self;
}
- (void)setDataArray:(NSMutableArray<HHYTongYongModel *> *)dataArray {
    _dataArray = dataArray;
    [self setHuaTiWithArr:dataArray];
}

- (void)setIsNoSelectOne:(BOOL)isNoSelectOne {
    _isNoSelectOne = isNoSelectOne;
}

- (void)setHuaTiWithArr:(NSArray<HHYTongYongModel *> *)arr {
    CGFloat XX = 15;
    CGFloat totalW = XX;
    NSInteger number = 1;
    CGFloat btH = 35;
    CGFloat spaceW = 10;
    CGFloat spaceH = 10;
    CGFloat btY0 = 0;
    [self.whiteView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0 ; i < arr.count; i++) {
        UIButton * button = (UIButton *)[self.whiteView viewWithTag:100+i];
        if (button==nil) {
            button =[UIButton new];
        }
        button.tag = 100+i;
        [button setTitleColor:CharacterColor50 forState:UIControlStateNormal];

        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.font =[UIFont systemFontOfSize:14];
        button.layer.cornerRadius = 17.5;
        button.clipsToBounds = YES;
        
        [button addTarget:self action:@selector(clickNameAction:) forControlEvents:UIControlEventTouchUpInside];
        NSString * str = [NSString stringWithFormat:@"%@",arr[i].name];
        [button setTitleColor:WhiteColor forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage imageNamed:@"backg"] forState:UIControlStateNormal];
        [button setTitle:str forState:UIControlStateNormal];
        CGFloat width =[str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}].width;
        
        button.x = totalW;
        button.y = btY0+(number-1) *(btH+spaceH);
        button.height =btH;
        button.width = width+40;
        
        if (i == 0 ) {
            if (self.isNoSelectOne) {
               button.userInteractionEnabled = button.selected = NO;
               button.titleLabel.font = kFont(16);
               button.width = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}].width;
               [button setTitleColor:CharacterBlack100 forState:UIControlStateNormal];
               [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            }else {
               button.selected = YES;
            }
            
        }
        
        totalW = button.x + button.width + spaceW;
        
        if(totalW  > self.frame.size.width - 30) {
            totalW = XX;
            number +=1;
            button.x =totalW;
            button.y =btY0+ (number-1) *(btH + spaceH);
            button.height = btH;
            button.width = width+30;
            totalW = button.x + button.width + spaceW;
        }
        if (i+1 == arr.count ) {
          self.hh = self.height = CGRectGetMaxY(button.frame)+30;
        }
        
        [self.whiteView addSubview:button];
        
    }

    
}

- (void)clickNameAction:(UIButton *)button {
    
    button.selected = !button.selected;
}


@end
