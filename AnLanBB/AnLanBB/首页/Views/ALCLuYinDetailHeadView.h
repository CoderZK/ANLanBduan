//
//  ALCLuYinDetailHeadView.h
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALCLuYinDetailHeadView : UIView
@property(nonatomic,strong)UIView *whiteV;
@property(nonatomic,strong)UILabel *titleLB;
@property(nonatomic,strong)UIView *backV;
@property(nonatomic,strong)UISlider *silder;
@property(nonatomic,assign)NSInteger type;//0音频,1视频
@property(nonatomic,strong)NSString *media_url;

@property(nonatomic,assign)BOOL isFinsh;

@end

NS_ASSUME_NONNULL_END
