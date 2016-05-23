//
//  WZXPageView.h
//  WZXCycleView
//
//  Created by WzxJiang on 16/5/23.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZXPageView : UIView

/**
 *  Default:WZXPageTypeRight
 */
typedef NS_ENUM(NSInteger,WZXPageType) {
    WZXPageTypeLeft,
    WZXPageTypeCenter,
    WZXPageTypeRight
};

- (instancetype)initWithFrame:(CGRect)frame imgNum:(NSUInteger)imgNum;

- (void)setTitleArr:(NSArray *)titleArr;
- (void)setPageType:(WZXPageType)pageType;
- (void)changePage:(NSInteger)page;
@end
