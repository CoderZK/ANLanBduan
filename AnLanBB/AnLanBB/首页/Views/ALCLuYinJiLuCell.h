//
//  ALCLuYinJiLuCell.h
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALCLuYinJiLuCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImgV;
@property (weak, nonatomic) IBOutlet UIView *backV;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *timeLB;
@property (weak, nonatomic) IBOutlet UILabel *timeTwoLB;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backVCons;
@property(nonatomic,strong)ALMessageModel *model;

@end

NS_ASSUME_NONNULL_END
