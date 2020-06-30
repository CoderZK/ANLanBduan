//
//  ALCLuYinDongTaiView.h
//  AnLanBB
//
//  Created by zk on 2020/4/1.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALCLuYinDongTaiView : UIView
@property(nonatomic,strong)NSArray *dataArray;

@property (nonatomic) NSUInteger numberOfItems;

@property (nonatomic) UIColor * itemColor;

@property (nonatomic) CGFloat level;
@property (nonatomic, copy) void (^itemLevelCallback)();

@property(nonatomic,assign)BOOL isOk;



@end

NS_ASSUME_NONNULL_END
