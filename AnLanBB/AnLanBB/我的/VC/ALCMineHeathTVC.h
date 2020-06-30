//
//  ALCMineHeathTVC.h
//  AnLanCustomers
//
//  Created by zk on 2020/6/4.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "BaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ALCMineHeathTVC : BaseTableViewController
@property(nonatomic,strong)NSString *userId;

@end


@interface ALCMineHeathNumberView : UIView
@property(nonatomic,strong)UILabel *titleLB;
@property(nonatomic,strong)UIImageView *jianTouImgV;
@property(nonatomic,strong)NSString *titleStr;

@end


NS_ASSUME_NONNULL_END
