/*
 *
 * Copyright (c) 2015-2020  Bonree Company
 * 北京博睿宏远科技发展有限公司  版权所有 2015-2020
 *
 * PROPRIETARY RIGHTS of Bonree Company are involved in the
 * subject matter of this material.  All manufacturing, reproduction, use,
 * and sales rights pertaining to this subject matter are governed by the
 * license agreement.  The recipient of this software implicitly accepts
 * the terms of the license.
 * 本软件文档资料是博睿公司的资产,任何人士阅读和使用本资料必须获得
 * 相应的书面授权,承担保密责任和接受相应的法律约束.
 *
 */

#import <Foundation/Foundation.h>

//日志标志
#define BRS_LOG_PUBLIC          (0x1)
#define BRS_LOG_BRN             (0x1 << 1)
#define BRS_LOG_PBDATA          (0x1 << 2)
#define BRS_LOG_JS              (0x1 << 3)
#define BRS_LOG_TO_FILE         (0x1 << 4)

@interface BRSAgent : NSObject

/**启动bonreeAgent(ver:6.1.0)*/
+ (void)startWithAppID:(NSString*)appid;

/**设置config地址,默认公有云不用设置*/
+ (void)setConfigAddress:(NSString*)configAddress;

/**设置app版本(请在bonreeAgent启动之前设置)*/
+ (void)setAppVersion:(NSString *)appVersion;

/**设置下载渠道名称*/
+ (void)setChannelName:(NSString*)channelName;

/**设置会员id*/
+ (void)setMemberId:(NSString *)memberId;
/**设置用户信息(客户可通过kv<key,value>参数增加用户信息，key为NSString类型，value为NSString或NSNumber类型)*/
+ (void)setUserInfo:(NSDictionary *)kv;

/*
 打开日志标志,默认只打开BRS_LOG_PUBLIC日志.
 此接口调试时调用,不建议在生产环境调用.
 例:打开BRS_LOG_PBDATA日志
 [BRSAgent setLogFlag:@(BRS_LOG_PUBLIC|BRS_LOG_PBDATA)];
 
 如果将日志写到文件中,
 需要在应用程序的Info.plist文件中添加Application supports iTunes file sharing键，
 并将键值设置为YES.
 例:打开BRS_LOG_PBDATA日志且写到文件中
 [BRSAgent setLogFlag:@(BRS_LOG_PUBLIC|BRS_LOG_PBDATA|BRS_LOG_TO_FILE)];
 
 关闭日志开关:
 [BRSAgent setLogFlag:@0];
 */
+ (void)setLogFlag:(NSNumber*)flag;

/**获取设备的deviceId*/
+ (NSString *)deviceId;

/**获取SDK的版本号*/
+ (NSString *)SDKVersion;

/// 设置是否保存upload数据
+ (void)setIsKeepUploadData:(BOOL)isKeepUploadData;

/**即时upload接口，客户调用该接口，将sdk目前保存的数据及当前视图的信息直接上传，返回值为YES表示上传成功，NO表示上传失败。(同步上传，建议客户启用新的线程调用)*/
+ (void)upload:(void(^)(NSError *error))result;

+ (void)stopSDK;


#pragma mark - 自定义

/**
 自定义异常收集
 
 @param exceptionType 异常类型
 @param causedBy 异常原因
 @param errorDump 异常堆栈
 */
+ (void)setCustomExceptionWithExceptionType:(NSString *)exceptionType
                                    causeBy:(NSString *)causedBy
                                  errorDump:(NSString *)errorDump;

/**
 自定义日志
 
 @param memberId 会员ID
 @param info 日志信息
 */
+ (void)setCustomLogWithMemberId:(NSString *)memberId
                            info:(NSString *)info;

/**
 自定义事件
 
 @param eventId 事件ID
 @param eventName 事件名
 @param eventInfo 事件信息，对事件的描述
 */
+ (void)setCustomEventWithEventId:(NSString *)eventId 
                        eventName:(NSString *)eventName
                        eventInfo:(NSDictionary *)eventInfo;


/**
 自定义视图之标记页面开始（和页面结束方法成对调用）
 
 @param pageId 页面ID
 @param pageName 页面名
 
 一般调用位置：viewWillAppear或者viewDidAppear
 */
+ (void)setCustomViewOfBeginWithPageId:(NSString *)pageId
                              pageName:(NSString *)pageName;

/**
 自定义视图之标记页面结束（和页面开始方法成对调用）
 
 @param pageId 页面ID
 @param pageName 页面名
 
 一般调用位置：viewWillDisappear或者viewDidDisappear
 */
+ (void)setCustomViewOfEndWithPageId:(NSString *)pageId
                            pageName:(NSString *)pageName;

/**
 用户测速接口
 
 @param parsingType 解析类型 ,客户标识
 @param content 需要解析的内容（一般为json格式的数据字典或者数组转换的结果）
 @param isOnce 是否只上传一次，true上传后清空content，false上传完成后不清空content，到下次上传的时候继续上传该content
 */
+ (void)setCustomSpeedWithParsingType:(NSString *)parsingType
                              content:(NSString *)content
                               isOnce:(BOOL)isOnce;

@end
