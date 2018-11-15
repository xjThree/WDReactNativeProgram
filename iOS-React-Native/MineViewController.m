//
//  MineViewController.m
//  iOS-React-Native
//
//  Created by WonderTek on 2018/11/9.
//  Copyright © 2018年 XJCode. All rights reserved.
//

#import "MineViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "InteractionManager.h"

@interface MineViewController ()<RCTBridgeModuleDelegate>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)setupUI{
    self.title = @"我的";
    self.navigationController.navigationBar.hidden = YES;
    [InteractionManager shareInstance].bridgeDelegate = self;
    //加载RN组件
    [self loadReactNativeIndex];
    
}

- (void)loadReactNativeIndex{
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://192.168.20.3:8081/index.bundle?platform=ios"];
    
    NSDictionary *dic = @{@"say":@"helloRN",@"name":@"我是原生"};
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                                moduleName:@"index"
                                                         initialProperties:dic
                                                             launchOptions:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    
    rootView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    rootView.center = self.view.center;
    [self.view addSubview:rootView];
}

#pragma mark - ReactNative组件事件传递
-(void)onEventsTriggerNativeWithParameter:(id)data{
    dispatch_async(dispatch_get_main_queue(), ^{
         [self.navigationController popViewControllerAnimated:YES];
    });
}

@end
