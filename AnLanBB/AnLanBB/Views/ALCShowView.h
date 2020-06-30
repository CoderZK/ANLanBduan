//
//  ALCShowView.h
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALCShowView : UIView
- (void)showWithType:(NSInteger )type; //1是无预约,2有预约,3上传成功 4 上传失败
- (void)diss;
@property(nonatomic,strong)UITextField *TFOne,*TFTwo,*TFThree,*TFFour;
@property(nonatomic,strong)UIButton *chooseBt;
@property(nonatomic,copy)void(^sendDataBlcok)(NSString *nameStr,NSString *phoneStr,NSString * desStr,NSInteger type);
@property(nonatomic,copy)void(^chooseDorBlock)();
@end

NS_ASSUME_NONNULL_END
