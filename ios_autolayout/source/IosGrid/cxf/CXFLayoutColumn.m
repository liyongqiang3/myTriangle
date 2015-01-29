//
//  CXFLayoutColumn.m
//  IosGrid
//
//  Created by Langwan on 14/11/26.
//  Copyright (c) 2014年 chengxufan. All rights reserved.
//

#import "CXFLayoutColumn.h"

@implementation CXFLayoutColumn

-(id)initWithLayout:(UIView*)view cols:(NSInteger)cols height:(CGFloat)height {
    self = [super init];
    if(self == nil) {
        return nil;
    }
    self.view = view;
    self.cols = cols;
    self.height = height;
  //  self.view.backgroundColor = [UIColor grayColor];
    return self;
}

@end
