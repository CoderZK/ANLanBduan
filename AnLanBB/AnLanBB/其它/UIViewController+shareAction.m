//
//  UIViewController+shareAction.m
//  BYXuNiPan
//
//  Created by zk on 2018/7/17.
//  Copyright © 2018年 kunzhang. All rights reserved.
//

#import "UIViewController+shareAction.h"
#import <objc/runtime.h>
@implementation UIViewController (shareAction)


static const void *urlKey = &urlKey;



- (void)setUrl:(NSString *)url {
    objc_setAssociatedObject(self, urlKey, url, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)url {
    return objc_getAssociatedObject(self, urlKey);
}









@end
