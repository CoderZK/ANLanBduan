//
//  ALMessageModel.m
//  AnLanBB
//
//  Created by zk on 2020/4/23.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALMessageModel.h"

@implementation ALMessageModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id",@"des":@"description",@"hashStr":@"hash"};
}

- (void)setList:(NSMutableArray<ALMessageModel *> *)list {
    _list = [ALMessageModel mj_objectArrayWithKeyValuesArray:list];
}

@end
