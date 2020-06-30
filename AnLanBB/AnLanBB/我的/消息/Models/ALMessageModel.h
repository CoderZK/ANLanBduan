//
//  ALMessageModel.h
//  AnLanBB
//
//  Created by zk on 2020/4/23.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALMessageModel : NSObject

@property(nonatomic,strong)NSString *fromUserId;//发送ID
@property(nonatomic,strong)NSString *toAvatar;
@property(nonatomic,strong)NSString *readTime;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *video;
@property(nonatomic,strong)NSString *immediateLogId;//对方ID
@property(nonatomic,strong)NSString *toUserId; //对方ID
@property(nonatomic,strong)NSString *content; //
@property(nonatomic,strong)NSString *messageType; //消息类型1文字2图片3语音4视频
@property(nonatomic,strong)NSString *createTime; //创建时间
@property(nonatomic,strong)NSString *deleteTime;//删除时间
@property(nonatomic,strong)NSString *toName;//对方姓名
@property(nonatomic,strong)NSString *fromName;//发送方姓名
@property(nonatomic,strong)NSString *audio;//音频
@property(nonatomic,strong)NSString *fromAvatar;//发送方头像
@property(nonatomic,strong)NSString *qiniu_url;
@property(nonatomic,strong)NSString *duration;
@property(nonatomic,strong)NSString *uploadId;
@property(nonatomic,strong)NSString *phone;
@property(nonatomic,strong)NSString *batch;
@property(nonatomic,strong)NSString *customerName;
@property(nonatomic,strong)NSString *voiceMessageId;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *week;
@property(nonatomic,strong)NSString *remindTime;
@property(nonatomic,strong)NSString *scheduleDate;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *calendarId;
@property(nonatomic,strong)NSString *targetUserId;
@property(nonatomic,strong)NSString *doctorName;
@property(nonatomic,strong)NSString *doctorDescription;
@property(nonatomic,strong)NSString *level;
@property(nonatomic,strong)NSString *depaName;
@property(nonatomic,strong)NSString *instName;
@property(nonatomic,strong)NSString *goodArea;
@property(nonatomic,strong)NSString *doctorAdvice;
@property(nonatomic,strong)NSString *des;
@property(nonatomic,strong)NSString *checkInfo;
@property(nonatomic,strong)NSString *medicine;
@property(nonatomic,strong)NSString *appB_findUserLogsListURL;
@property(nonatomic,strong)NSString *toNickname;
@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSString *appointmentDate;
@property(nonatomic,strong)NSString *customerId;
@property(nonatomic,strong)NSString *fname;
@property(nonatomic,strong)NSString *hashStr;
@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSString *targetName;
@property(nonatomic,strong)NSString *targetPhone;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *base_id;
@property(nonatomic,strong)NSString *nickname;
@property(nonatomic,strong)NSString *institutionName;
@property(nonatomic,strong)NSString *customerPhone;
@property(nonatomic,strong)NSString *img;
@property(nonatomic,strong)NSString *check_info;
@property(nonatomic,strong)NSString *audioCreateTime;
@property(nonatomic,strong)NSString *appointmentType;
@property(nonatomic,strong)NSString *patientId;
//@property(nonatomic,strong)NSString *targetName;
//@property(nonatomic,strong)NSString *targetPhone;
//@property(nonatomic,strong)NSString *name;


//时间
//@property(nonatomic,strong)NSDate *remindTime;
//@property(nonatomic,strong)NSDate *scheduleDate;

@property(nonatomic,strong)NSMutableArray<ALMessageModel *> *list;

@property(nonatomic,assign)BOOL isDelete;
@property(nonatomic,assign)BOOL isRead;
@property(nonatomic,assign)BOOL isSelect;
@property(nonatomic,assign)BOOL isSend;
@property(nonatomic,assign)BOOL isSelf;
//@property(nonatomic,assign)BOOL is_bond;
//@property(nonatomic,assign)BOOL is_question;
//@property(nonatomic,assign)BOOL is_appoint;
//@property(nonatomic,assign)BOOL isOpenSm;
//
//
@property(nonatomic,assign)NSInteger type;//1图片2视频3音频4其它文件    
//@property(nonatomic,assign)NSInteger fans_num;
//@property(nonatomic,assign)NSInteger countImmediateLog; // 新朋友未读数量
//@property(nonatomic,assign)NSInteger countSystem; // 系统消息数量
//@property(nonatomic,assign)NSInteger countDetailCalender;  // 问诊数量
//@property(nonatomic,assign)NSInteger appoint_num;
//
//@property(nonatomic,assign)CGFloat bond_money;
//@property(nonatomic,assign)CGFloat score;
//@property(nonatomic,assign)CGFloat question_price;
//@property(nonatomic,assign)CGFloat appoint_price;
//@property(nonatomic,assign)CGFloat  sit_price;
@property(nonatomic,assign)CGFloat  HHHHHH;


@end

NS_ASSUME_NONNULL_END
