//
//  WZXCycleView.m
//  WZXCycleView
//
//  Created by WzxJiang on 16/5/23.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "WZXCycleView.h"

@interface WZXCycleView()
@property(nonatomic,strong)NSMutableArray * titleArr;
@property(nonatomic,strong)NSMutableArray * imgArr;
@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,assign)WZXPageType pageType;
@property(nonatomic,strong)NSTimer * timer;
@end

@implementation WZXCycleView

- (instancetype)initWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr {
    if (self = [super initWithFrame:frame]) {
        [self setUp:imgArr];
        [self setUI:imgArr];
    }
    return self;
}

+ (WZXCycleView *)WZXCycleViewWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr TitleArr:(NSArray *)titleArr pageType:(WZXPageType)pageType{
    WZXCycleView * cycleView = [[WZXCycleView alloc]initWithFrame:frame imgArr:imgArr];
    cycleView.pageType = pageType;
    if (titleArr) {
        [cycleView setUpTitleArr:titleArr];
    }
    return cycleView;
}

+ (WZXCycleView *)WZXCycleViewWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr TitleArr:(NSArray *)titleArr {
    return [WZXCycleView WZXCycleViewWithFrame:frame imgArr:imgArr TitleArr:titleArr pageType:WZXPageTypeRight];
}

+ (WZXCycleView *)WZXCycleViewWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr pageType:(WZXPageType)pageType {
    return [WZXCycleView WZXCycleViewWithFrame:frame imgArr:imgArr TitleArr:nil pageType:pageType];
}

+ (WZXCycleView *)WZXCycleViewWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr {
    return [WZXCycleView WZXCycleViewWithFrame:frame imgArr:imgArr TitleArr:nil pageType:WZXPageTypeRight];
}

- (void)setUp:(NSArray *)imgArr {
    _pageViewHeight = 40;
    _currentNum = 1;
    
    _imgArr = [NSMutableArray arrayWithArray:imgArr];
    [_imgArr insertObject:imgArr.lastObject atIndex:0];
    [_imgArr addObject:imgArr[0]];
}

- (void)setUI:(NSArray *)imgArr {
    _scrollView = ({
        UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        scrollView.pagingEnabled = YES;
        scrollView.contentSize = CGSizeMake((imgArr.count + 2) * self.frame.size.width, self.frame.size.height);
        scrollView.delegate = self;
        scrollView;
    });
    [self addSubview:_scrollView];
    [self scrollViewAddImgView:imgArr];
    [self scrollToNum:1];
    
    _pageView = ({
        WZXPageView * pageView = [[WZXPageView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - _pageViewHeight, self.frame.size.width, _pageViewHeight) imgNum:imgArr.count];
        pageView;
    });
    [self addSubview:_pageView];

}

- (void)scrollViewAddImgView:(NSArray *)imgArr {
    for (int i = 0; i < imgArr.count + 2; i++) {
        UIButton * imgView = [UIButton buttonWithType:UIButtonTypeCustom];
        imgView.frame = CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        [imgView setBackgroundImage:[UIImage imageNamed:_imgArr[i]] forState:UIControlStateNormal];;
        imgView.tag = 10000 + i;
        imgView.userInteractionEnabled = YES;
        [imgView addTarget:self action:@selector(imgClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:imgView];
    }
}

- (void)imgClick:(UIImageView *)sender {
    if (self.clickBlock) {
        self.clickBlock(sender.tag - 10000);
    }
}

- (void)scrollToNum:(NSInteger)num {
    _scrollView.contentOffset = CGPointMake(num * self.frame.size.width, 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger num = scrollView.contentOffset.x/self.frame.size.width;
    if (num == 0) {
        [self scrollToNum:_imgArr.count - 2];
        _currentNum = _imgArr.count - 2;
    } else if (num == _imgArr.count - 1){
        [self scrollToNum:1];
        _currentNum = 1;
    } else {
        _currentNum = num;
    }
    
    [_pageView changePage:_currentNum];
}

- (void)setPageType:(WZXPageType)pageType {
    _pageType = pageType;
    [_pageView setPageType:_pageType];
}

- (void)setUpTitleArr:(NSArray *)titleArr {
    _titleArr = [NSMutableArray arrayWithArray:titleArr];
    [_titleArr insertObject:titleArr.lastObject atIndex:0];
    [_titleArr addObject:titleArr[0]];
    [_pageView setTitleArr:_titleArr];
}

- (void)startWithTimeInterval:(NSTimeInterval)time {
    _timer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(cycleShow) userInfo:nil repeats:YES];
}

- (void)stop {
    [_timer invalidate];
}

- (void)cycleShow {
    _currentNum++;
    if (_currentNum >= _imgArr.count){
        _currentNum = 2;
        [self scrollAnimationToNum:_currentNum];
        
    } else {
        [self scrollAnimationToNum:_currentNum];
        if (_currentNum == _imgArr.count - 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_pageView changePage:1];
            });
            [self scrollToNum:1];
        }
    }
}

- (void)scrollAnimationToNum:(NSInteger)num {
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset = CGPointMake(num * self.frame.size.width, 0);
    }completion:^(BOOL finished) {
        [_pageView changePage:_currentNum];
    }];
}
@end
