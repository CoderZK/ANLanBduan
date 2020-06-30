//
//  ALCHomeLuYinCell.m
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCHomeLuYinCell.h"

@implementation ALCHomeLuYinCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = RGB(59, 59, 69);
    self.contentView.backgroundColor = RGB(59, 59, 69);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(ALMessageModel *)model {
    
    _model = model;
    if (model.type == 1) {
        self.leftImgV.image = [UIImage imageNamed:@"jkgl122-1"];
        self.timeLB.hidden = YES;
      
    }else if (model.type == 2) {
        self.leftImgV.image = [UIImage imageNamed:@"jkgl121-1"];
        self.timeLB.hidden = NO;
        self.timeLB.text = [NSString stringWithVideoTime:model.duration];
    }
 
    
}

@end
