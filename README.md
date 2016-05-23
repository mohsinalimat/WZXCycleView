# WZXCycleView
轮播<br>
![image](https://github.com/Wzxhaha/WZXStorehouse/blob/master/WZXCycleView/cycleView.gif)

# How to use
```objc
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
```
For example:
```objc
#import "WZXCycleView.h"

 WZXCycleView * view = [WZXCycleView WZXCycleViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) imgArr:@[@"1.jpg",@"2.jpg",@"3.jpg"] TitleArr:@[@"冰与火之歌(1)",@"冰与火之歌(2)",@"冰与火之歌(3)"] pageType:WZXPageTypeRight];
 [view startWithTimeInterval:2];
 [self.view addSubview:view];
```
