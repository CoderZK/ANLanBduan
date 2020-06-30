//
//  ALCHomeNewHeadView.h
//  AnLanBB
//
//  Created by zk on 2020/6/2.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALCHomeNewHeadView : UIView
@property(nonatomic,assign)CGFloat powerValue;
@property(nonatomic,assign)NSInteger timeNumber; // 1 为一个单位
@property(nonatomic,strong)UIButton *leftBt,*centerBt,*rightBt;

@property(nonatomic,copy)void(^clickButtonBlock)(NSInteger tag); // 99叉, 100 相册 101 录音 102 标记

- (void)isOver;

@end

NS_ASSUME_NONNULL_END


