//
//  CXFLayoutColumn.h
//  IosGrid
//
//  Created by Langwan on 14/11/26.
//  Copyright (c) 2014年 chengxufan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CXFLayoutColumn : NSObject

@property(nonatomic, strong) UIView* view;
@property(nonatomic, assign) NSInteger cols;
@property(nonatomic, assign) CGFloat height;
-(id)initWithLayout:(UIView*)view cols:(NSInteger)cols height:(CGFloat)height;
@end
