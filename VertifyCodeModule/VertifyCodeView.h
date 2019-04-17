//
//  VertifyCodeView.h
//  VertifyCode
//
//  Created by walen on 2019/4/17.
//  Copyright © 2019 CJH. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VertifyCodeView : UIView

@property (nonatomic,copy,readonly)NSString *code;
//@property (nonatomic,copy)void(^block)(NSString *str);

//- (instancetype)init UNAVAILABLE_ATTRIBUTE;

@end

NS_ASSUME_NONNULL_END
