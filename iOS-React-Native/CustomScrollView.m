//
//  CustomScrollView.m
//  iOS-React-Native
//
//  Created by WonderTek on 2018/11/13.
//  Copyright © 2018年 XJCode. All rights reserved.
//

#import "CustomScrollView.h"
#import "Masonry.h"

@interface CustomScrollView()

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *lableArray;
@property (nonatomic,strong) UILabel *selectLab;

@end
@implementation CustomScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _dataList = [NSMutableArray new];
        [self customView];
    }
    return self;
}

- (void)customView{
    [self addSubview:self.scrollView];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.center.equalTo(self);
        make.height.equalTo(self);
    }];
    for (int i=0; i<20; i++) {
        UILabel *titleLab = [UILabel new];
        titleLab.textColor = [UIColor grayColor];
        if (i == 0) {
            self.selectLab = titleLab;
            titleLab.textColor = [UIColor blueColor];
        }
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.font = [UIFont systemFontOfSize:15];
        [self.scrollView addSubview:titleLab];
        titleLab.hidden = YES;
        titleLab.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickLab:)];
        [titleLab addGestureRecognizer:tap];
        [self.lableArray addObject:titleLab];
    }
}

//- (NSMutableArray *)dataList{
//    if (!_dataList) {
//        _dataList = [NSMutableArray new];
//    }
//    return _dataList;
//}

- (void)setDataList:(NSMutableArray *)dataList{
    for (NSInteger i=0; i<dataList.count; i++) {
        if (self.lableArray.count>i) {
            UILabel *titleLab = self.lableArray[i];
            titleLab.hidden = NO;
            titleLab.text = dataList[i];
            __block NSInteger blockIndex = i;
            self.scrollView.contentSize = CGSizeMake(dataList.count*50+(dataList.count+1)*10,0);
            self.scrollView.scrollEnabled = YES;
            [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.scrollView).offset(blockIndex*50+(blockIndex + 1)*10);
                make.centerY.equalTo(self.scrollView);
                make.width.mas_lessThanOrEqualTo(200);
                make.height.equalTo(self.scrollView);
            }];
        }
    }
}

- (void)clickLab:(UITapGestureRecognizer *)tap{
    self.selectLab.textColor = [UIColor grayColor];
    self.selectLab = (UILabel *)tap.view;
    self.selectLab.textColor = [UIColor blueColor];
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}




-(NSMutableArray *)lableArray{
    if (!_lableArray) {
        _lableArray = [NSMutableArray new];
    }
    return _lableArray;
}
@end
