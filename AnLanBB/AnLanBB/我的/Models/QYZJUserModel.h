//
//  QYZJUserModel.h
//  QYZJAPP
//
//  Created by zk on 2019/11/5.
//  Copyright © 2019 kunzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYZJUserModel : NSObject<NSCoding>
@property(nonatomic,strong)NSString *nickname;
@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSString *phone;
@property(nonatomic,strong)NSString *avatar;
@property(nonatomic,strong)NSString *token;
@property(nonatomic,strong)NSString *status;
@property(nonatomic,strong)NSString *salerId; //销售ID
@property(nonatomic,strong)NSString *voiceDetailId; //用户问诊详情表ID
@property(nonatomic,strong)NSString *customerId; //客户ID
@property(nonatomic,strong)NSString *customerName; //客户姓名
@property(nonatomic,strong)NSString *baseId;
@property(nonatomic,strong)NSString *city_name;
@property(nonatomic,strong)NSString *pro_id;
@property(nonatomic,strong)NSString *city_id;
@property(nonatomic,strong)NSString *doctorId;
@property(nonatomic,strong)NSString *doctorName;
@property(nonatomic,strong)NSString *lastSessionTime;
@property(nonatomic,strong)NSString *feedBackDictionaryId;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *baseInfoId;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *targetUserId;
@property(nonatomic,strong)NSString *targetName;
@property(nonatomic,strong)NSString *targetPhone;
@property(nonatomic,strong)NSString *departmentId;
@property(nonatomic,strong)NSString *departName;
@property(nonatomic,strong)NSString *customerPhone;
@property(nonatomic,strong)NSString *level;
@property(nonatomic,strong)NSString *bimIntroduce;

@property(nonatomic,strong)NSString *birthdate;
@property(nonatomic,strong)NSString *gender;
@property(nonatomic,strong)NSString *minWeight;
@property(nonatomic,strong)NSString *maxWeight;
@property(nonatomic,strong)NSString *institutions_visited_name;

@property(nonatomic,strong)NSString *special_stage;
@property(nonatomic,strong)NSString *topic;
@property(nonatomic,strong)NSString *age;
@property(nonatomic,strong)NSString *height;
@property(nonatomic,strong)NSString *project_visited_name;
@property(nonatomic,strong)NSString *weight;
@property(nonatomic,strong)NSString *bmi;
@property(nonatomic,strong)NSString *highRate;
@property(nonatomic,strong)NSString *moreBody;



@property(nonatomic,strong)NSMutableArray<QYZJUserModel *> *keywords;


@property(nonatomic,strong)QYZJUserModel *baseUser;
@property(nonatomic,strong)QYZJUserModel *mapBmi;


@property(nonatomic,assign)BOOL isSelect;
@property(nonatomic,assign)NSInteger type;
@property(nonatomic,assign)NSInteger countImmediateLog; // 新朋友未读数量
@property(nonatomic,assign)NSInteger countSystem; // 系统消息数量
@property(nonatomic,assign)NSInteger countDetailCalender;  // 问诊数量
@property(nonatomic,assign)NSInteger appoint_num;


@end

NS_ASSUME_NONNULL_END
