//
//  CXFLayout.m
//  IosGrid
//
//  Created by Langwan on 14/11/26.
//  Copyright (c) 2014年 chengxufan. All rights reserved.
//

#import "CXFLayout.h"



@implementation CXFLayout

-(id)initWithParams:(UIView *)parentView columns:(NSInteger)columns {
    
    self = [super init];
    if(self == nil) {
        return nil;
    }
    

    self.borderWithBase = 10.0f;
    self.columnBorderWithBase = 3.0f;
    self.columnBorderWidth = self.columnBorderWithBase;

    self.parentView = parentView;
    self.rows = [[NSMutableArray alloc]init];
    self.columns = columns;
    CGFloat widthBase = self.parentView.bounds.size.width;
    
    CGFloat w = widthBase - 2.0 * self.borderWithBase;
    
    NSInteger m = (int)w % (int)self.columns;

    
    NSInteger n = (NSInteger)(m / 2);
    
    if(m % 2 > 0) {
        self.leftBorderWidth = self.borderWithBase + (CGFloat)n;
        self.rightBorderWidth = self.borderWithBase + (CGFloat)n + 1.0f;
    } else {
        self.leftBorderWidth = self.rightBorderWidth = self.borderWithBase + (CGFloat)n;
    }
    
    self.columnWidth = (int)w / (int)self.columns;


    return self;
}

-(void)addRow:(CXFLayoutRow*) row {
    if(row.columns == nil) {
        row.columns = [[NSMutableArray alloc]init];
    }
    [self.rows addObject:row];
}

-(void)addColumn:(CXFLayoutRow*)row column:(CXFLayoutColumn*)column {
    [row.columns addObject:column];
}

-(void)draw {
    CGFloat rowStart = 0, columnStart = 0, maxHeight = 0;
    columnStart = self.leftBorderWidth;
    rowStart = self.columnBorderWidth;
    for(CXFLayoutRow* row in self.rows) {
        for(CXFLayoutColumn * column in row.columns) {
            CGFloat x, y, w, h;
            x = columnStart + self.columnBorderWidth;
            y = rowStart;
            w = column.cols * self.columnWidth - 2 * self.columnBorderWidth;
            h = column.height;
            [column.view setFrame:CGRectMake(x, y, w, h)];
            NSLog(@"x=%f y=%f  w=%f h=%f", x, y , w, h);
            columnStart = columnStart + column.cols * self.columnWidth;
            maxHeight = h > maxHeight ? h : maxHeight;
            [self.parentView addSubview:column.view];
        }
        rowStart = rowStart + maxHeight + self.columnBorderWidth;
        columnStart = self.leftBorderWidth;
        maxHeight = 0.0f;
    }
}

-(void)drawGrid {
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    for (CGFloat i = self.leftBorderWidth; i < self.parentView.bounds.size.width - self.rightBorderWidth; i += self.columnWidth) {
        CGFloat x = i + self.columnBorderWidth;
        CGRect rectangle = CGRectMake(x, 0.0f, self.columnWidth - 2 * self.columnBorderWidth, self.parentView.bounds.size.height);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(context, 1.0f, 128.0f/255.0f, 128.0f/255.0f, 0.2f);
        CGContextFillRect(context, rectangle);
    }
    
    
    
    // and now draw the Path!
    CGContextStrokePath(context);
}

@end
