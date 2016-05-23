//
//  WZXPageView.m
//  WZXCycleView
//
//  Created by WzxJiang on 16/5/23.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "WZXPageView.h"
@interface WZXPageView()

@property(nonatomic,assign)NSUInteger maxPage;
@property(nonatomic,strong)UIPageControl * pgView;
@property(nonatomic,copy)NSArray * titleArr;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,assign)WZXPageType pageType;
@end

@implementation WZXPageView

- (instancetype)initWithFrame:(CGRect)frame imgNum:(NSUInteger)imgNum {
    if (self = [super initWithFrame:frame]) {
        [self setUp:imgNum];
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    [self addSubview:self.pgView];
}

- (UIPageControl *)pgView {
    if (!_pgView) {
        _pgView = ({
            UIPageControl * pgView = [[UIPageControl alloc]initWithFrame:CGRectMake(self.frame.size.width - _maxPage * 40, 0, _maxPage * 40, self.frame.size.height)];
            pgView.numberOfPages = _maxPage + 1;
            pgView.currentPage   = 0;
            pgView;
        });
        
    }
    return _pgView;
}

- (void)setUp:(NSUInteger)imgNum {
    _maxPage    = imgNum - 1;
    _pageType   = WZXPageTypeRight;
}

- (void)changePage:(NSInteger)page {
    if (page - 1 > _maxPage) {
        self.pgView.currentPage = 0;
    } else {
        self.pgView.currentPage = page - 1;
    }
    
    if(_titleArr.count > page + 1){
        self.titleLabel.text = _titleArr[page];
    } else {
        self.titleLabel.text = nil;
    }
    
    if(self.pgView.currentPage == 0) {
        self.titleLabel.text = _titleArr[1];
    }
}

- (void)setPageType:(WZXPageType)pageType {
    _pageType = pageType;
    switch (pageType) {
        case WZXPageTypeLeft: {
            self.pgView.frame = CGRectMake(0, 0,  _maxPage * 40, self.frame.size.height);
        }
            break;
        case WZXPageTypeCenter: {
            self.pgView.frame = CGRectMake(self.frame.size.width/3.0, 0,  self.frame.size.width/3.0, self.frame.size.height);
        }
            break;
        case WZXPageTypeRight: {
            self.pgView.frame = CGRectMake(self.frame.size.width - _maxPage * 40, 0,  _maxPage * 40, self.frame.size.height);
        }
            break;
        default:
            break;
    }
}

- (void)setTitleArr:(NSArray *)titleArr {
    _titleArr = titleArr;
    if (_pageType != WZXPageTypeCenter) {
        self.titleLabel.text = titleArr[1];
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * titleLabel = [[UILabel alloc]init];
            switch (_pageType) {
                case WZXPageTypeCenter: {
                    
                }
                    break;
                case WZXPageTypeLeft: {
                    titleLabel.frame = CGRectMake(_pgView.frame.size.width, 0, self.frame.size.width - _pgView.frame.size.width - 10, self.frame.size.height);
                    titleLabel.textAlignment = NSTextAlignmentRight;
                }
                    break;
                case WZXPageTypeRight: {
                    titleLabel.frame = CGRectMake(10, 0, self.frame.size.width - _pgView.frame.size.width - 10, self.frame.size.height);
                    titleLabel.textAlignment = NSTextAlignmentLeft;
                }
                    break;
                default:
                    break;
            }
            titleLabel.font = [UIFont systemFontOfSize:13];
            titleLabel.textColor = [UIColor whiteColor];
            titleLabel.adjustsFontSizeToFitWidth = YES;
            titleLabel;
        });
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

@end
