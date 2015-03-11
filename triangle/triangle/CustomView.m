//
//  CustomView.m
//  triangle
//
//  Created by 李永强 on 15/3/6.
//  Copyright (c) 2015年 tongbaotu. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [[UIColor whiteColor] set];//设置背景颜色

    UIRectFill([self bounds]);  //拿到当前视图准备好的画板
    //利用path进行绘制三角形
    CGContextRef
    context = UIGraphicsGetCurrentContext();


    //利用path进行绘制三角形


    CGContextBeginPath(context);//标记
    CGContextMoveToPoint(context,
                         100, 0);//设置起点


    CGContextAddLineToPoint(context,
                            0, 150);


    CGContextAddLineToPoint(context,
                            200, 150);
    
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    [[UIColor
      clearColor] setFill];
    //设置填充色


    [[UIColor
      grayColor] setStroke];
    //设置边框颜色


    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
    

}

@end
