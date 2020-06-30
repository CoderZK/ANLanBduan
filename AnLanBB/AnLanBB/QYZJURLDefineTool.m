//
//  QYZJURLDefineTool.m
//  QYZJAPP
//
//  Created by zk on 2019/11/1.
//  Copyright © 2019 kunzhang. All rights reserved.
//

#import "QYZJURLDefineTool.h"



@implementation QYZJURLDefineTool


/** 登录 */
+ (NSString * )appB_loginURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_login"];
}
/** 获取问诊消息列表 */

+ (NSString * )user_appB_findDetaiMessagelListURL{
      return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_findDetaiMessagelList"];
}
/** 问诊详情 */

+ (NSString * )user_appB_findUserVoiceDetailMapURL{
      return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_findUserVoiceDetailMap"];
}



/** 语音详情 */
+ (NSString * )appB_findVoiceMessageMapURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_findVoiceMessageMap"];
}
/** 通过手机号搜客户 */
+ (NSString * )appB_findNewFrindByPhoneURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_findNewFrindByPhone"];
}
/** 通过手机号搜医生 */
+ (NSString * )appB_findDoctorByPhoneURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_findDoctorByPhone"];
}

/**查找聊天列表*/
+(NSString *)user_appB_findUserSessionsListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_findUserSessionsList"];
}
///** 打开用户聊天记录*/
+ (NSString * )appB_findUserLogsListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_findUserLogsList"];
}
/** 发送聊天信息 */
+ (NSString * )user_appB_sendChatMessageURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_sendChatMessage"];
}
/** 通过手机号查找用户*/
+ (NSString * )appB_findUserByPhoneURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_findUserByPhone"];
}
/** 添加用户问诊详情记录 */
+ (NSString * )user_appB_addVoiceRecordURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_addVoiceRecord"];
}
/** 获取问诊列表 */
+ (NSString * )user_appB_findUserVoiceRecordListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_findUserVoiceRecordList"];
}
/**删除问诊详情列表*/
+ (NSString * )addB_deleteUserVoiceRecordURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"addB_deleteUserVoiceRecord"];
}
/**获取问诊详情*/
+ (NSString * )appB_findUserVoiceMessageInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_findUserVoiceMessageInfo"];
}
/**添加日历 */
+ (NSString * )user_appB_addUserCalendarURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_addUserCalendar"];
}
/** 查看日程 */
+ (NSString * )user_appB_findCalendarListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_findCalendarList"];
}
/**日程详情 */
+ (NSString * )user_appB_findCalendarInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_findCalendarInfo"];
}
/** 发送日程给客户 */
+ (NSString * )appB_sendCalendarToCustomerURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_sendCalendarToCustomer"];
}
/** 查看产品帮助*/
+ (NSString * )appB_findProductListURL {
    return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_findProductList"];
}
/** 查看产品帮助详情*/
+ (NSString * )appB_findProductInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_findProductInfo"];
}
/** 反馈字段 */
+ (NSString * )appB_findFeedBackDictionaryURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"appB_findFeedBackDictionary"];
}
/** 新增用户反馈 */
+ (NSString * )user_appB_addUserFeedBackURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_addUserFeedBack"];
}
/** 上传头像 */
+ (NSString * )user_appB_uploadAvatarURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_uploadAvatar"];
}
/** 上传到骑牛云 */
+ (NSString * )upload_file_to_qiniuURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"upload_file_to_qiniu"];
}

/**系统消息列表*/
+ (NSString * )appB_findSystemMessageListURL {
    
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_findSystemMessageList"];
    
}

/** 预约列表*/
+ (NSString * )user_findMyDoctorAppointmentURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_findMyDoctorAppointment"];
}
/** 预约列表新*/
+ (NSString * )app_doctorAppoinmentListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_doctorAppoinmentList"];
}


/** 统计数量*/
+ (NSString * )user_appB_countMessageURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appB_countMessage"];
}
/** 取消服务方角色 */
+ (NSString * )user_cancelApplicationURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_cancelApplication"];
}
/** 删除日程*/
+(NSString *)appb_deleteUserCalendarURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"appb_deleteUserCalendar"];
}
/** 套餐列表 */
+(NSString *)app_vipPackageListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_vipPackageList"];
}
/** 充值套餐 */
+(NSString *)user_setVipURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_setVip"];
}

/** 充值套餐支付*/
+ (NSString * )user_payVipURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_payVip"];
}
/** 修改个人信息*/
+ (NSString * )user_editInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_editInfo"];
}
/** 检测用户的支付密码/设置支付密码(不需要检测验证码)*/
+ (NSString * )user_checkPayPassURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_checkPayPass"];
}
/** 添加支付密码/忘记支付密码(需要检测验证码) */
+ (NSString * )user_setPayPassURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_setPayPass"];
}
/** 换帮手机号*/
+ (NSString * )user_editPhoneURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_editPhone"];
}
/** 修改密码 */
+ (NSString * )user_editPasswordURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_editPassword"];
}
/** 我的预约裁判*/
+(NSString *)user_caipanListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_caipanList"];
}

/** 轮播图*/
+(NSString *)user_bannerListURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_bannerList"];
}

/** 收藏*/
+(NSString *)app_collectListURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"app_collectList"];
}

/** 预约列表新*/
+ (NSString * )getTokenAudioURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"getTokenAudio"];
}

#pragma mark ----- 消息部分 -------
/** 用户的通知消息*/
+(NSString *)user_newsURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_news"];
}
/** 用户点赞消息-已读 */
+(NSString *)user_goodNewsReadURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_goodNewsRead"];
}
/** 用户的最新点赞列表*/
+ (NSString * )user_goodNewsListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_goodNewsList"];
}
/** 用户的最新评论列表 */
+ (NSString * )user_commentNewsListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_commentNewsList"];
}
/** 用户评论消息-已读*/
+ (NSString * )user_commentNewsReadURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_commentNewsRead"];
}
/** 用户的最新验收消息列表*/
+ (NSString * )user_turnoverStageNewListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverStageNewList"];
}
/**用户的最新报修消息列表*/
+ (NSString * )user_turnoverRepairNewListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverRepairNewList"];
}
/** 用户的最新系统消息列表*/
+ (NSString * )user_systemMessageNewListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_systemMessageNewList"];
}
/**获取用户的角色*/
+(NSString *)user_basicInfoURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"user_basicInfo"];
}
/**退保*/
+(NSString *)user_backBondURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_backBond"];
}
/**获取城市是否开通*/
+(NSString *)app_getCityURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_getCity"];
}
#pragma mark ----- 我的小店 -------
/** 我的小店*/
+(NSString *)user_shopInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_shopInfo"];
}
/**  修改我的小店 */
+(NSString *)user_editShopURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_editShop"];
}
/** 添加商品*/
+(NSString *)user_addGoodsURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_addGoods"];
}
/** 修改商品*/
+(NSString *)user_editGoodsURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_editGoods"];
}
/** 发布案例*/
+(NSString *)user_addCaseURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_addCase"];
}
/** 修改案例*/
+(NSString *)user_updateCaseURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_updateCase"];
}
/** 删除案例*/
+(NSString *)user_deleteCaseURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_deleteCase"];
}

#pragma mark ----- 我的订单 -------

/** 我的订单列表*/
+(NSString *)user_orderListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_orderList"];
}
/** 确认收货*/
+(NSString *)user_sendGoodsURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_sendGoods"];
}
/** 确认收货*/
+(NSString *)user_submitGoodsURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_submitGoods"];
}
/** 提醒发货*/
+(NSString *)user_reminderURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_reminder"];
}
/** 评价商品*/
+(NSString *)user_evaluateGoodsURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_evaluateGoods"];
}
/**订单详情*/
+(NSString *)user_orderInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_orderInfo"];
}

#pragma mark ----- 交付 -------

/** 设置施工阶段的报修时间*/
+(NSString *)user_setStageRepairTimeURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_setStageRepairTime"];
}

#pragma mark ----- 推荐答人-------
/** 答人主页*/
+(NSString *)app_getUserInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_getUserInfo"];
}
/** 答人列表*/
+(NSString *)app_searchURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_search"];
}
/** 答人的案例列表*/
+(NSString *)user_caseListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_caseList"];
}
/** 答人的商品列表*/
+(NSString *)user_goodsListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_goodsList"];
}
/** 答人的回答语音列表*/
+(NSString *)user_mediaListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_mediaList"];
}
/** 答人关注/取消关注*/
+(NSString *)user_followURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_follow"];
}
/** 答人的案例详情*/
+(NSString *)app_caseInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_caseInfo"];
}
/** 答人的小店主页*/
+(NSString *)app_shopInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_shopInfo"];
}
/**答人的商品详情*/
+(NSString *)app_goodsInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_goodsInfo"];
}
/**答人的回答详情*/
+(NSString *)app_questionInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_questionInfo"];
}
/**回复语音*/
+(NSString *)user_replyQuestionURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_replyQuestion"];
}
/** 旁听语音*/
+(NSString *)user_sitAnswerURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_sitAnswer"];
}
/** 旁听语音支付*/
+(NSString *)user_sitPayNewURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_sitPayNew"];
}
/** 购买商品*/
+(NSString *)user_addGoodsOrderURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_addGoodsOrder"];
}
/** 商品订单支付*/
+(NSString *)user_goodsPayNewURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_goodsPayNew"];
}
/** 帖子评论更多*/
+ (NSString * )app_articleDetailsCommentURL {
     return [NSString stringWithFormat:@"%@%@",URLOne,@"app_articleDetailsComment"];
}

/*回复帖子*/
+(NSString *)app_articleCommentURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_articleComment"];
}
/*头条评论更多*/
+(NSString *)app_headlinenewsDetailsCommentURL {
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_headlinenewsDetailsComment"];
}

/*头条评论*/
+(NSString *)app_headlinenewsCommentURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"app_headlinenewsComment"];
}
/*旁听支付*/
+(NSString *)user_sitPayURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_sitPay"];
}

/*现有单子交付*/
+(NSString *)user_createTurnoverURL {
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createTurnover"];
}
/**长传推送token*/
+(NSString *)app_bindPushTokenURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"user_upUmeng"];
}
#pragma mark ----- 需求单 -------
/** 推荐赚钱单子列表*/
+(NSString *)user_myDemandListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_myDemandList"];
}
/** 单子详情*/
+(NSString *)app_demandInfoURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_demandInfo"];
}
/** 绑定虚拟手机号码*/
+(NSString *)app_bindVirtualPhoneURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_bindVirtualPhone"];
}
/**推荐放单手机号码检验*/
+(NSString *)app_checkDemandURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_checkDemand"];
}
/** 推荐赚钱放单*/
+(NSString *)user_addDemandURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_addDemand"];
}
/** 单子列表 */
+(NSString *)user_demandListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_demandList"];
}
/**抢单*/
+(NSString *)user_grabDemandURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_grabDemand"];
}
/** 抢单相关支付-正常支付*/
+(NSString *)user_payDemandURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_payDemand"];
}
/**旁听单子客服语音*/
+(NSString *)user_sitDemandURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_sitDemand"];
}
/** 单子操作*/
+(NSString *)user_operateDemandURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_operateDemand"];
}
/** 填写资料*/
+(NSString *)user_addDetailURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_addDetail"];
}
/** 根据签单额获取签单佣金*/
+(NSString *)app_getCommissonURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_getCommisson"];
}
/** 提交申诉 */
+(NSString *)user_addAppealURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_addAppeal"];
}
#pragma mark ----- 支付 -------
/**交付列表*/
+(NSString *)user_turnoverListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverList"];
}
/** 创建新单子的交付*/
+(NSString *)user_createNewTurnoverURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createNewTurnover"];
}

/**修改服务方资料*/
+(NSString *)user_editAppointAndQuestionURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"user_editAppointAndQuestion"];
}
/**报修详情*/
+(NSString *)user_repairBroadcastListURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_repairBroadcastList"];
}
/**添加播报*/
+(NSString *)user_createRepairBroadcastURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createRepairBroadcast"];
}
/**删除播报*/
+(NSString *)user_repairBoradcastDelURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_repairBoradcastDel"];
}
/**回复播报*/
+(NSString *)user_repairBroadcastReplyURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_repairBroadcastReply"];
}
/*用户地址*/
+(NSString *)user_addressListURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"user_addressList"];
}

/*删除地址*/
+(NSString *)user_deleteAddressURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_deleteAddress"];
}
/*增加地址*/
+(NSString *)user_addAddressURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_addAddress"];
}

#pragma mark ---- 其它 --------- 
/** 获取城市列表*/
+(NSString *)app_addressURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_address"];
}
/** 获取城市列表*/
+(NSString *)user_cityListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_cityList"];
}

/** 获取渠道列表*/
+(NSString *)app_labelListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_labelList"];
}
/** 获取需求类型列表*/
+(NSString *)app_demandTypeListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_demandTypeList"];
}

/** 删除城市列表*/
+(NSString *)user_delUserCityURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_delUserCity"];
}
/** 用户添加城市*/
+(NSString *)user_localCityURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"user_localCity"];
}

/** 获取发现广场列表*/
+(NSString *)app_articleListURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"app_articleList"];
}
/** 获取发现广场详情*/
+(NSString *)app_articleDetailsURL {
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_articleDetails"];
}
/** 名家列表*/
+(NSString *)app_logiciansListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_logiciansList"];
}
/** 头条列表*/
+(NSString *)app_headlinenewsListURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"app_headlinenewsList"];
}
/** 获取旁听列表*/
+(NSString *)app_questionSitListOpenURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"app_questionSitListOpen"];
}

/** 类型*/
+(NSString *)app_findLabelByTypeListURL {
   return [NSString stringWithFormat:@"%@%@",URLOne,@"app_findLabelByTypeList"];
}

/** 头条详情*/
+ (NSString * )app_headlinenewsDetailsURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"app_headlinenewsDetails"];
}
/** 我的报修列表*/
+(NSString *)user_repairListURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_repairList"];
}
/**邀请收入*/
+(NSString *)user_moneyListInvitationURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"user_moneyListInvitation"];
}
/**交付详情*/
+(NSString *)user_turnoverDetailsURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverDetails"];
}

/**获取系统参数*/
+(NSString *)app_systemParamURL {
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_systemParam"];
}

/**上传图片*/
+(NSString *)app_uploadImgTokenURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_uploadImgToken"];
}

/**上传视频*/
+(NSString *)app_uploadVideoTokenURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"app_uploadVideoToken"];
}
/**上传视频*/
+(NSString *)app_uploadAudioTokenURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"app_uploadAudioToken"];
}
/**发布动态*/
+(NSString *)app_insertArticleURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_insertArticle"];
}
/**删除动态*/
+(NSString *)app_articleDelURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_articleDel"];
}

/** 取消和收藏*/
+(NSString *)app_headlinenewsCollectURL {
     return [NSString stringWithFormat:@"%@%@",URLOne,@"app_headlinenewsCollect"];
}
/** 头条取消和点赞*/
+(NSString *)app_headlinenewsGoodURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_headlinenewsGood"];
}
/** 广场取消和收藏*/
+(NSString *)app_articleCollectURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_articleCollect"];
}
/** 广场取消和点赞*/
+(NSString *)app_articleGoodURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"app_articleGood"];
}
/**删除帖子*/
+(NSString *)app_articleCommentDelURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"app_articleCommentDel"];
}
/**发送验证码*/
+(NSString *)app_sendmobileURL {
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_sendmobile"];
}
/**验证验证码*/
+(NSString *)app_checkSendCodeURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"app_checkSendCode"];
}




/**修改忘记密码*/
+(NSString *)app_findPasswordURL {
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_findPassword"];
}

/**创建施工清单*/
+(NSString *)user_createStageURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createStage"];
}
/**创建变更清单*/
+(NSString *)user_createChangeStageURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createChangeStage"];
}
/**变更清单状态*/
+(NSString *)user_changeTurnoverCheckURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_changeTurnoverCheck"];
}
/**获取清单支付状态*/
+(NSString *)user_changeTurnoverChecksURL{
   return [NSString stringWithFormat:@"%@%@",URLOne,@"user_changeTurnoverChecks"];
}


/**阶段验收通过*/
+(NSString *)user_turnoverStagePassURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverStagePass"];
}
/**阶段验收不通过*/
+(NSString *)user_turnoverStageNotPassURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverStageNotPass"];
}
/**创建实际施工阶段*/
+(NSString *)user_createConstructionURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createConstruction"];
}
/** 提交验收*/
+(NSString *)user_turnoverStageConfirmURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverStageConfirm"];
}
/**修改验收*/
+(NSString *)user_constructionEditURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_constructionEdit"];
}
/**删除实际阶段*/
+(NSString *)user_constructionDelURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_constructionDel"];
}
/** 创建播报*/
+(NSString *)user_createBroadcastURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createBroadcast"];
}
/**获取交付单击施工段信息*/
+(NSString *)user_turnoverStageNameURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverStageName"];
}
/**支付尾款*/
+(NSString *)user_turnoverFinalPayURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverFinalPay"];
}
/** 施工阶段播报内容回复*/
+(NSString *)user_broadcastReplyURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_broadcastReply"];
}
/**确认交付*/
+(NSString *)user_turnoverCheckURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverCheck"];
}
/**交付清单详情*/
+(NSString *)user_turnoverListDetailsURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverListDetails"];
}
/**删除阶段播报*/
+(NSString *)user_boradcastDelURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_broadcastDel"];
}
/**创建保修*/
+(NSString *)user_createRepairURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createRepair"];
}
/** 每个阶段内容回复*/
+(NSString *)user_turnoverStageEvalURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverStageEval"];
}
/** 确认保修*/
+(NSString *)user_sureRepairURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_sureRepair"];
}
/** 交付播报列表*/
+(NSString *)user_broadcastListURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"user_broadcastList"];
}

/**提交验收*/
+(NSString *)user_turnoverRepairConfirmURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverRepairConfirm"];
}
/** 验收通过*/
+(NSString *)user_turnoverRepairPassURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverRepairPass"];
}
/** 验收不通过*/
+(NSString *)user_turnoverRepairNotPassURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_turnoverRepairNotPass"];
}
/** 保修单详情*/
+(NSString *)user_repairDetailsURL {
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_repairDetails"];
}

/**微信*/
+(NSString *)user_createWxOrderURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createWxOrder"];
}
/** 支付宝*/
+(NSString *)user_createAlipayOrderURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createAlipayOrder"];
}
/** 余额*/
+(NSString *)user_createBalanceOrderURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createBalanceOrder"];
}
/** 优惠券*/
+(NSString *)user_createCouponOrderURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createCouponOrder"];
}
/** 余额加微信或者支付宝*/
+(NSString *)user_createPayNewURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_createPayNew"];
}
/** 付款钱金额判断*/
+(NSString *)user_wechatPayURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_wechatPay"];
}

/** 提问*/
+(NSString *)user_addQuestionURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_addQuestion"];
}
/** 预约*/
+(NSString *)user_appointCaipanURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appointCaipan"];
}
/** 预约表单*/
+(NSString *)user_appointDemandURL{
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_appointDemand"];
}

/**装修贷*/
+(NSString *)user_addZhuangxiuURL{
    
    return [NSString stringWithFormat:@"%@%@",URLOne,@"user_addZhuangxiu"];
    
}

/**是否短息通知*/
+(NSString *)app_openCloseSmURL{
    
    return [NSString stringWithFormat:@"%@%@",URLOne,@"app_openCloseSm"];
    
}


/*配置*/
+(NSString *)app_iosURL{
     return [NSString stringWithFormat:@"%@%@",URLOne,@"app_ios"];
}


//图片地址
+(NSString *)getImgURLWithStr:(NSString * )str{
    
    NSString * picStr = @"";

    if ([[NSString stringWithFormat:@"%@",str] isEqualToString:@"<null>"] || [[NSString stringWithFormat:@"%@",str] isEqualToString:@"null"]) {
        return @"";
    }
    
    if (str) {
        if ([str hasPrefix:@"http:"] || [str hasPrefix:@"https:"]) {
            picStr = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet  URLQueryAllowedCharacterSet]];
        }else{
            picStr = [[NSString stringWithFormat:@"%@%@",QiNiuImgURL,str] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet  URLQueryAllowedCharacterSet]];
        }
    }
    return picStr;

}

+(NSString *)getVideoURLWithStr:(NSString * )str {
   
    if ([[NSString stringWithFormat:@"%@",str] isEqualToString:@"<null>"] || [[NSString stringWithFormat:@"%@",str] isEqualToString:@"null"]) {
          return @"";
      }
    
   NSString * picStr = @"";
    if (str) {
        if ([str hasPrefix:@"http:"] || [str hasPrefix:@"https:"]) {
            picStr = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet  URLQueryAllowedCharacterSet]];
        }else{
            picStr = [[NSString stringWithFormat:@"%@%@",QiNiuVideoURL,str] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet  URLQueryAllowedCharacterSet]];
        }
    }
    return picStr;
    
}


@end
