//
//  ALCSearchPeopleTVC.h
//  AnLanCustomers
//
//  Created by zk on 2020/3/26.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "BaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ALCSearchPeopleTVC : BaseTableViewController
@property(nonatomic,assign)BOOL isComeLuYin;
@property(nonatomic,copy)void(^sendDorBlock)(QYZJUserModel *model);
@end

NS_ASSUME_NONNULL_END
