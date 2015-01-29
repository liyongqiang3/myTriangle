//
//  CXFButton.m
//  IosGrid
//
//  Created by Langwan on 14/12/1.
//  Copyright (c) 2014年 chengxufan. All rights reserved.
//

#import "CXFButton.h"

@implementation CXFButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithParams:(CXFLayoutRow*) row size:(NSInteger)size scene:(NSInteger)scene {
    self = [super init];
    if(self == nil) {
        return nil;
    }
    
    self.scene = scene;
    self.size = size;
    self.row = row;
    
    if(self.size == CXF_BUTTON_SIZES_BIG) {
        self.cols = 6;
        self.height = 40.0f;
    } else if(self.size == CXF_BUTTON_SIZES_COMMON) {
        self.cols = 4;
        self.height = 40.0f;
    } else {
        self.cols = 3;
        self.height = 30.0f;
    }
    
    if(self.scene == CXF_BUTTON_SCENE_COMMON) {
        self.backgroundColor = [UIColor yellowColor];
    } else if(self.scene == CXF_BUTTON_SCENE_IMPORTANT) {
        self.backgroundColor = [UIColor orangeColor];
    } else {
        self.backgroundColor = [UIColor grayColor];
    }
    
    CXFLayoutColumn* column = [[CXFLayoutColumn alloc] initWithLayout:self cols:self.cols height:self.height];
    [self.row addColumn:column];
    [self.row.layout.parentView addSubview:self];
    return self;
}

@end
