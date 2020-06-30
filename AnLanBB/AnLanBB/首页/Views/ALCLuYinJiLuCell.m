//
//  ALCLuYinJiLuCell.m
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCLuYinJiLuCell.h"

@implementation ALCLuYinJiLuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backV.backgroundColor = WhiteColor;
    self.backV.layer.cornerRadius = 5;
    self.backV.layer.shadowColor = [UIColor blackColor].CGColor;
    self.backV.layer.shadowOffset = CGSizeMake(0, 0);
    self.backV.layer.shadowRadius = 5;
    self.backV.layer.shadowOpacity = 0.08;
    self.contentView.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(ALMessageModel *)model {
    _model = model;
    
    self.titleLB.text = [NSString stringWithFormat:@"%@ %@",model.customerName,model.phone];
    self.timeLB.text = model.createTime;
    self.timeTwoLB.text = [NSString stringWithVideoTime:model.duration];

    if (model.isSelect) {
        self.leftImgV.image = [UIImage imageNamed:@"jkgl23"];
    }else {
        self.leftImgV.image = [UIImage imageNamed:@"jkgl24"];
    }
    
    
}

@end
