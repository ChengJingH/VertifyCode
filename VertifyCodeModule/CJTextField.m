//
//  CJTextField.m
//  VertifyCode
//
//  Created by walen on 2019/4/17.
//  Copyright © 2019 CJH. All rights reserved.
//

#import "CJTextField.h"

@interface CJTextField ()

@end

@implementation CJTextField

- (void)deleteBackward
{
    [super deleteBackward];
    NSLog(@"退格");
    
    if ([self.cj_delegate respondsToSelector:@selector(cj_deleteBackward:text:)]) {
        [self.cj_delegate cj_deleteBackward:self.tag text:self.text];
    }
}

@end
