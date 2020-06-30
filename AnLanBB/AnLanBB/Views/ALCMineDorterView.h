//
//  ALCMineDorterView.h
//  AnLanCustomers
//
//  Created by zk on 2020/3/19.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALCMineDorterView : UIView
@property(nonatomic,strong)NSString *selectImageStr,*nomalImageStr;
@property(nonatomic,strong)UIColor *selectColor,*nomalColor;
@property(nonatomic,strong)NSMutableArray<HHYTongYongModel *> *dataArray;
@property(nonatomic,assign)CGFloat hh;
@property(nonatomic,assign)BOOL isNoSelectOne;
@end

NS_ASSUME_NONNULL_END
