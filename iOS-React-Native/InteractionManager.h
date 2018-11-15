//
//  InteractionManager.h
//  iOS-React-Native
//
//  Created by WonderTek on 2018/11/12.
//  Copyright © 2018年 XJCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTLog.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RCTBridgeModuleDelegate <NSObject>
@required

- (void)onEventsTriggerNativeWithParameter:(id)data;

@end

@interface InteractionManager : RCTEventEmitter <RCTBridgeModule>

@property (nonatomic, strong) NSDictionary *constantsToExport;

@property (nonatomic, weak) id<RCTBridgeModuleDelegate>bridgeDelegate;

+ (instancetype)shareInstance;

- (void)calendarEventReminderReceived:(NSNotification *)notification;

@end

NS_ASSUME_NONNULL_END
