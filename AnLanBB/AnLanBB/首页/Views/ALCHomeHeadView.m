//
//  ALCHomeHeadView.m
//  AnLanBB
//
//  Created by zk on 2020/3/31.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCHomeHeadView.h"

@implementation ALCHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        
        
        self.timeLB = [[UILabel alloc] initWithFrame:CGRectMake(10, frame.size.height - 65, frame.size.width - 20, 20)];
        self.timeLB.text = @"00:00:00";
        self.timeLB.textColor = WhiteColor;
        self.timeLB.textAlignment = NSTextAlignmentCenter;
        self.timeLB.font = kFont(17);
        [self addSubview:self.timeLB];
        
        
    }
    return self;
}


@end
