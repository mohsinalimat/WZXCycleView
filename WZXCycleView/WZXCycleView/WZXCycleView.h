//
//  WZXCycleView.h
//  WZXCycleView
//
//  Created by WzxJiang on 16/5/23.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZXPageView.h"
@interface WZXCycleView : UIView<UIScrollViewDelegate>

/**
 *  WZXPageView, you can modify its properties.For example: backgroundColor
 */
@property(nonatomic,strong)WZXPageView * pageView;

/**
 *  WZXPageView's height
 */
@property(nonatomic,assign,readonly)CGFloat pageViewHeight;

/**
 *  CurrentPage
 */
@property(nonatomic,assign)NSInteger currentNum;

/**
 *  Get a WZXCycleView
 *
 *  @param frame    frame
 *  @param imgArr   imgArr
 *  @param titleArr titleArr
 *  @param pageType pageType
 *
 *  @return a WZXCycleView
 */
+ (WZXCycleView *)WZXCycleViewWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr TitleArr:(NSArray *)titleArr pageType:(WZXPageType)pageType;

/**
 *  Get a WZXCycleView (WZXPageType = Default = WZXPageTypeRight)
 *
 *  @param frame    frame
 *  @param imgArr   imgArr
 *  @param titleArr title
 *
 *  @return a WZXCycleView
 */
+ (WZXCycleView *)WZXCycleViewWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr TitleArr:(NSArray *)titleArr;

/**
 *  Get a WZXCycleView (No title)
 *
 *  @param frame    frame
 *  @param imgArr   imgArr
 *  @param pageType pageType
 *
 *  @return a WZXCycleView
 */
+ (WZXCycleView *)WZXCycleViewWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr pageType:(WZXPageType)pageType;

/**
 *  Get a WZXCycleView (No title , WZXPageType = Default = WZXPageTypeRight)
 *
 *  @param frame  frame
 *  @param imgArr imgArr
 *
 *  @return a WZXCycleView
 */
+ (WZXCycleView *)WZXCycleViewWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr;

/**
 *  Start repeating
 *
 *  @param time interval
 */
- (void)startWithTimeInterval:(NSTimeInterval)time;
- (void)stop;
@end
