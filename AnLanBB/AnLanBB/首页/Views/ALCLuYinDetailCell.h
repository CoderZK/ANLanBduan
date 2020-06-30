//
//  ALCLuYinDetailCell.h
//  AnLanBB
//
//  Created by zk on 2020/4/1.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ALCLuYinDetailCell;

@protocol ALCLuYinDetailCellDelegate <NSObject>

- (void)didClickALCLuYinDetailCell:(ALCLuYinDetailCell *)cell withIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ALCLuYinDetailCell : UITableViewCell
@property(nonatomic,strong)NSMutableArray<ALMessageModel *> *dataArray;
@property(nonatomic,strong)NSString *titleStr;
@property(nonatomic,assign)id<ALCLuYinDetailCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
