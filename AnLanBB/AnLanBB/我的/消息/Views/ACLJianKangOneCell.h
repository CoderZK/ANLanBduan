//
//  ACLJianKangOneCell.h
//  AnLanCustomers
//
//  Created by zk on 2020/3/19.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACLJianKangOneCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *backV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCos;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftOneCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topTwoCons;
@property (weak, nonatomic) IBOutlet UIView *leftOneLB;
@property (weak, nonatomic) IBOutlet UILabel *rightOneLB;
@property (weak, nonatomic) IBOutlet UILabel *timeLB;
@property (weak, nonatomic) IBOutlet UILabel *leftTwoLB;
@property (weak, nonatomic) IBOutlet UILabel *leftThreeLB;
@property (weak, nonatomic) IBOutlet UILabel *leftFourLB;


@end

NS_ASSUME_NONNULL_END
