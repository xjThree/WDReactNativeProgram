//
//  InteractionManager.m
//  iOS-React-Native
//
//  Created by WonderTek on 2018/11/12.
//  Copyright © 2018年 XJCode. All rights reserved.
//

#import "InteractionManager.h"

@implementation InteractionManager

//将这个宏放在类实现中以自动注册
RCT_EXPORT_MODULE();

NSString *const kEventEmitterManagerEvent  = @"EventEmitterManagerEvent";//通知标识

+ (instancetype)shareInstance{
    static InteractionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[InteractionManager alloc] init];
    });
    return manager;
}

//从reactnative组件传出字符串
RCT_EXPORT_METHOD(addEventString:(NSString *)name){
    NSLog(@"%@",[InteractionManager shareInstance].bridgeDelegate);
    if ([InteractionManager shareInstance].bridgeDelegate && [[InteractionManager shareInstance].bridgeDelegate respondsToSelector:@selector(onEventsTriggerNativeWithParameter:)]) {
        [[InteractionManager shareInstance].bridgeDelegate onEventsTriggerNativeWithParameter:name];
    }
}

//从reactnative组件传出字典
RCT_EXPORT_METHOD(nativeGetDic:(NSDictionary *)dic){
    NSLog(@"%@",dic);
}

//typedef void (^RCTResponseSenderBlock)(NSArray *response);
//typedef void (^RCTResponseErrorBlock)(NSError *error);
//将reactnative参数传到原生，原生处理完成之后回调到reactnative
RCT_EXPORT_METHOD(nativeCallback:(RCTResponseSenderBlock)callback){
    NSArray *arrt = @[@"1",@"2",@"3",@"4"];
    callback(arrt);
}

-(NSDictionary *)constantsToExport{
    return @{@"valueone":@"我是原生定义的"};
}

////原生发送通知
//RCT_EXPORT_METHOD(postNotificationEvent:(NSString *)name)
//{
//    RCTLogInfo(@"postNotificationEvent->:%@",name);
//    [self sendEventWithName:kEventEmitterManagerEvent body:name];
//}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"EventReminder"];
}

- (void)calendarEventReminderReceived:(NSNotification *)notification
{
    NSString *eventName = notification.userInfo[@"name"];
    [self sendEventWithName:@"EventReminder" body:@{@"name": @"EventReminder"}];
}

@end
