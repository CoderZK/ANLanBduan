//
//  ALCJianKangTiXingHomeCell.h
//  AnLanCustomers
//
//  Created by zk on 2020/3/28.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ALCJianKangTiXingHomeCell;
@class ALMessageModel;
@protocol ALCJianKangTiXingHomeCellDelegate <NSObject>

- (void)didClickALCJianKangTiXingHomeCell:(ALCJianKangTiXingHomeCell *)cell withIndex:(NSInteger)index;

@end


@interface ALCJianKangTiXingHomeCell : UITableViewCell
@property(nonatomic,strong)NSMutableArray<ALMessageModel *> *dataArray;
@property(nonatomic,strong)NSString *titleStr;
@property(nonatomic,assign)id<ALCJianKangTiXingHomeCellDelegate>delegate;
@property(nonatomic,assign)BOOL isSend;
@end


