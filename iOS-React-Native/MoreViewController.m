//
//  MoreViewController.m
//  iOS-React-Native
//
//  Created by WonderTek on 2018/11/9.
//  Copyright © 2018年 XJCode. All rights reserved.
//

#import "MoreViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "CustomScrollView.h"
#import "InteractionManager.h"

@interface MoreViewController ()

@property (nonatomic,strong) CustomScrollView *scrollView;
@property (nonatomic,strong) CustomScrollView *scrollView1;
@property (nonatomic,strong) CustomScrollView *scrollView2;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.scrollView1];
    [self.view addSubview:self.scrollView2];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor grayColor];
    view.frame = CGRectMake(0, 214, [UIScreen mainScreen].bounds.size.width, 1);
    [self.view addSubview:view];
    [self loadReactNativeIndex];
    
    // Do any additional setup after loading the view.
}

- (CustomScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[CustomScrollView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 40)];
        _scrollView.dataList = @[@"全部",@"剧情",@"爱情",@"动作",@"惊悚",@"喜剧",@"谍战",@"青春"].mutableCopy;
    }
    return _scrollView;
}

- (CustomScrollView *)scrollView1{
    if (!_scrollView1) {
        _scrollView1 = [[CustomScrollView alloc] initWithFrame:CGRectMake(0, 114, [UIScreen mainScreen].bounds.size.width, 40)];
        _scrollView1.dataList = @[@"全部",@"内地",@"美国",@"台湾",@"英国",@"韩国",@"日本",@"英给兰"].mutableCopy;
    }
    return _scrollView1;
}

- (CustomScrollView *)scrollView2{
    if (!_scrollView2) {
        _scrollView2 = [[CustomScrollView alloc] initWithFrame:CGRectMake(0, 164, [UIScreen mainScreen].bounds.size.width, 40)];
        _scrollView2.dataList = @[@"全部",@"2018",@"2017",@"2016",@"2015",@"2014",@"2013",@"2012"].mutableCopy;
    }
    return _scrollView2;
}

- (void)loadReactNativeIndex{
    
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://192.168.20.3:8081/moreView.bundle?platform=ios"];
    
    
    
    NSDictionary *dic = @{@"say":@"helloRN",@"name":@"我是原生"};
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"moreView"
                                                 initialProperties:dic
                                                     launchOptions:nil];
     [[InteractionManager shareInstance] setValue:rootView.bridge forKey:@"bridge"];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    
   //设置桥接
    NSLog(@"bridge==%@",[[InteractionManager shareInstance] bridge]);
    rootView.frame = CGRectMake(0, 220, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-220 );
    [self.view addSubview:rootView];
    
    [[InteractionManager shareInstance] calendarEventReminderReceived:[NSNotification notificationWithName:@"EventReminder" object:@""]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
