//
//  TongYongThreeCell.m
//  QYZJAPP
//
//  Created by zk on 2019/11/5.
//  Copyright © 2019 kunzhang. All rights reserved.
//

#import "TongYongThreeCell.h"

@implementation TongYongThreeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.leftLB = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 150, 20)];
        self.leftLB.font = kFont(15);
        self.leftLB.textColor = CharacterColor50;
        [self addSubview:self.leftLB];
        
        self.TF = [[UITextField alloc] initWithFrame:CGRectMake(170 , 10, ScreenW - 185, 30)];
        self.TF.textAlignment = NSTextAlignmentRight;
        self.TF.placeholder = @"请填写或选择";
        self.TF.textColor = CharacterColor50;
        self.TF.font = kFont(14);
        [self addSubview:self.TF];
        self.TF.userInteractionEnabled = NO;
        
        UIView * backV =[[UIView alloc] initWithFrame:CGRectMake(15, 49.4, ScreenW-30, 0.6)];
        backV.backgroundColor = lineBackColor;
        [self addSubview:backV];
        self.lineV = backV;

        self.swith = [[UISwitch alloc] initWithFrame:CGRectMake(ScreenW - 75  , 10, 60, 30)];
        [self addSubview:self.swith];
        self.swith.hidden = YES;
        self.swith.on = YES;
        [self.swith setOnTintColor:OrangeColor];
        
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
