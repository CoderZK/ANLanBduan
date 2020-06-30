//
//  ALCJianKangRiZhiTVC.h
//  AnLanCustomers
//
//  Created by zk on 2020/3/26.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "BaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ALCJianKangRiZhiTVC : BaseTableViewController
@property(nonatomic,copy)void(^sendYuYueIDBlock)(NSString *ID,NSString *appID,NSString *consumerID ,NSString * nameStr,NSString *phnoeStr,NSString *appointmentType,NSString *patientId);
@end

NS_ASSUME_NONNULL_END
