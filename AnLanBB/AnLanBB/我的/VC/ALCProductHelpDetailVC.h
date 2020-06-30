//
//  ALCProductHelpDetailVC.h
//  AnLanBB
//
//  Created by zk on 2020/3/30.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ALCProductHelpDetailVC : BaseViewController
@property (weak, nonatomic) IBOutlet UITextView *TV;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property(nonatomic,strong)NSString * baseInfoId;
@property(nonatomic,strong)NSString *titleStr;

@end

NS_ASSUME_NONNULL_END
