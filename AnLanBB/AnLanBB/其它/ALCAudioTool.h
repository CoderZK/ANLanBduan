//
//  ALCAudioTool.h
//  AnLanBB
//
//  Created by zk on 2020/4/1.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALCAudioTool : NSObject

+ (ALCAudioTool *)shareTool;
- (void)stopRecord;
- (void)pauaseRecord;
- (void)startRecord;
- (void)playRecord;
- (BOOL)isNodata;
//音频录制
@property (nonatomic,strong) AVAudioRecorder *avaudioRecorder;

- (BOOL)checkMicrophonePermission;//判断是否开启录音
- (void)popUpMicrophonePermissionAlertView;//提示开启录音

@property(nonatomic,copy)void(^statusBlock)(BOOL isFinsh ,NSData * mediaData);
@property(nonatomic,copy)void(^averagePowerBlock)(CGFloat averagePower,NSInteger timeNumber);
@end

NS_ASSUME_NONNULL_END
