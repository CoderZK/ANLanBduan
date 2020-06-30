//
//  ALCLuYinDetailHeadView.m
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCLuYinDetailHeadView.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ALCLuYinDetailHeadView()<AVAudioPlayerDelegate>
@property (nonatomic, strong)AVAudioPlayer *audioPlayer;
@property(nonatomic,strong)UISlider *slider;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)UIButton *playBt;
@property(nonatomic,strong)UILabel *leftTimeLB,*rightTimeLB;
@end


@implementation ALCLuYinDetailHeadView

//- (AVAudioPlayer *)audioPlayer {
//    if (_audioPlayer == nil) {
//        NSError * error = nil;
//        NSURL * url = [[NSURL alloc] initWithString:self.media_url];
//               NSData * data = [[NSData alloc] initWithContentsOfURL:url];
//        _audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:&error];
//        _audioPlayer.delegate = self;
//
//    }
//    return _audioPlayer;
//}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self =[super initWithFrame:frame];
    if (self) {
        self.whiteV = [[UIView alloc] initWithFrame:CGRectMake(15, 15, ScreenW - 30, 120)];
        self.whiteV.backgroundColor = WhiteColor;
        self.whiteV.layer.cornerRadius = 5;
        self.whiteV.layer.shadowColor = [UIColor blackColor].CGColor;
        self.whiteV.layer.shadowOffset = CGSizeMake(0, 0);
        self.whiteV.layer.shadowRadius = 5;
        self.whiteV.layer.shadowOpacity = 0.08;
        [self addSubview:self.whiteV];
        self.backgroundColor = [UIColor clearColor];
        
        
        self.titleLB = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, ScreenW - 60, 20)];
        self.titleLB.font = kFont(14);
        self.titleLB.textColor = CharacterColor50;
        [self.whiteV addSubview:self.titleLB];
        self.titleLB.text = @"张贝贝 1589756524255";
        
        
        self.backV = [[UIView alloc] initWithFrame:CGRectMake(15, 50, ScreenW - 60, 55)];
        [self addSubview:self.backV];
        self.backV.backgroundColor = BackgroundColor;
        
        [self.whiteV addSubview:self.backV];
        
        [self setavaudioplayer];
        
        
    }
    return self;
}




- (void)setavaudioplayer {
    
    self.playBt = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 35, 35)];
    [self.playBt setBackgroundImage:[UIImage imageNamed:@"jkgl119"] forState:UIControlStateNormal];
    [self.backV addSubview:self.playBt];
    [self.playBt addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 10, ScreenW - 60 - 50- 15, 20)];
    self.slider = slider;
    /// 添加Slider
    [self.backV addSubview:slider];
    
    /// 属性配置
    // minimumValue  : 当值可以改变时，滑块可以滑动到最小位置的值，默认为0.0
    slider.minimumValue = 0.0;
    // maximumValue : 当值可以改变时，滑块可以滑动到最大位置的值，默认为1.0
    slider.maximumValue = 1.0;
    // 当前值，这个值是介于滑块的最大值和最小值之间的，如果没有设置边界值，默认为0-1；
    slider.value = 0.5;
    
    // continuous : 如果设置YES，在拖动滑块的任何时候，滑块的值都会改变。默认设置为YES
    [slider setContinuous:YES];

    // minimumTrackTintColor : 小于滑块当前值滑块条的颜色，默认为蓝色
    slider.minimumTrackTintColor = GreenColor;
    // maximumTrackTintColor: 大于滑块当前值滑块条的颜色，默认为白色
    slider.maximumTrackTintColor = [UIColor grayColor];
    // thumbTintColor : 当前滑块的颜色，默认为白色
    slider.thumbTintColor =GreenColor ;
    
    UIImage *imagea=[self OriginImage:[UIImage imageNamed:@"lvdian"] scaleToSize:CGSizeMake(12, 12)];
    [slider  setThumbImage:imagea forState:UIControlStateNormal];
     [self.slider addTarget:self action:@selector(sliderValChanged) forControlEvents:UIControlEventValueChanged];
    
    
    /**  PS: 设置图片的优先级高于设置tintColor
     
     /// 设置滑块条最大值处设置的图片在不同的状态
     [slider setMaximumTrackImage:MHImageNamed(@"slider_bg") forState:UIControlStateNormal];
     /// 设置滑块条最小值处设置的图片在不同的状态
     [slider setMinimumTrackImage:MHImageNamed(@"slider_bg") forState:UIControlStateNormal];
     /// 设置滑块图片在不同的状态
     [slider setThumbImage:MHImageNamed(@"slider_thumb") forState:UIControlStateNormal];
     [slider setThumbImage:MHImageNamed(@"slider_thumb") forState:UIControlStateHighlighted];
     
     */
    
    self.leftTimeLB = [[UILabel alloc] initWithFrame:CGRectMake(50, 35, 100, 17)];
    self.leftTimeLB.textColor = CharacterBlack100;
    self.leftTimeLB.font = kFont(13);
    self.leftTimeLB.text = @"00:00:00";
    [self.backV addSubview:self.leftTimeLB];
    
    self.rightTimeLB = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW - 60 -15-100, CGRectGetMinY(self.leftTimeLB.frame), 100, 17)];
    self.rightTimeLB.textColor = CharacterBlack100;
    self.rightTimeLB.textAlignment = NSTextAlignmentRight;
    self.rightTimeLB.font = kFont(13);
    [self.backV addSubview:self.rightTimeLB];
    
    
    
}

- (void)setMedia_url:(NSString *)media_url {
    _media_url = media_url;
     NSURL * url = [[NSURL alloc] initWithString:media_url];
    NSData * data = [[NSData alloc] initWithContentsOfURL:url];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
    self.audioPlayer.delegate = self;
    self.rightTimeLB.text = [NSString stringWithVideoTime:[NSString stringWithFormat:@"%f",self.audioPlayer.duration]];// [NSString stringHHMMSSWithTime:self.audioPlayer.duration];
    self.leftTimeLB.text = [NSString stringWithVideoTime:@"0"];
    self.slider.value = 0;
}


- (void)playAction:(UIButton *)button {
    
    if ([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"jkgl119"]]) {
        [self.audioPlayer play];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:true];
        [button setBackgroundImage:[UIImage imageNamed:@"zanting"] forState:UIControlStateNormal];
    }else {
        
        if ([self.audioPlayer isPlaying]) {
            [self.audioPlayer pause];
            _timer.fireDate = [NSDate distantFuture];
            [button setBackgroundImage:[UIImage imageNamed:@"jkgl119"] forState:UIControlStateNormal];
        }
        
        
    }
    
   
    
    
}

- (void)update {
    
    if (self.audioPlayer && self.audioPlayer.isPlaying) {
        [self.slider setValue:self.audioPlayer.currentTime/self.audioPlayer.duration];
        
        NSLog(@"%F=====%f",self.audioPlayer.currentTime,self.audioPlayer.duration);
        self.leftTimeLB.text = [NSString stringWithVideoTime:[NSString stringWithFormat:@"%f",self.audioPlayer.currentTime]]; // [NSString stringHHMMSSWithTime:self.audioPlayer.currentTime];
        
    }
}

- (void)sliderValChanged {
    if (self.audioPlayer) {
//        [self.audioPlayer setVolume:_slider.value];
        self.audioPlayer.currentTime = self.slider.value * self.audioPlayer.duration;
        self.leftTimeLB.text =[NSString stringWithVideoTime:[NSString stringWithFormat:@"%f",self.audioPlayer.currentTime]];;
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    // 播放完成...     NSLog(@"播放完成...");
    
    NSLog(@"www==%ld",flag);
    self.leftTimeLB.text = @"00:00";

    self.rightTimeLB.text = [NSString stringWithVideoTime:[NSString stringWithFormat:@"%f",self.audioPlayer.duration]];// [NSString stringHHMMSSWithTime:self.audioPlayer.duration];
    self.leftTimeLB.text = [NSString stringWithVideoTime:@"0"];
    self.slider.value = 0;
    [self.playBt setBackgroundImage:[UIImage imageNamed:@"jkgl119"] forState:UIControlStateNormal];
    
}


-(UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage *scaleImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaleImage;
}

- (void)setIsFinsh:(BOOL)isFinsh {
    _isFinsh = isFinsh;
    self.audioPlayer = nil;
   
}



@end
