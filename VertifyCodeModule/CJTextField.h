//
//  CJTextField.h
//  VertifyCode
//
//  Created by walen on 2019/4/17.
//  Copyright © 2019 CJH. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CJTextFieldDelegate <NSObject>

- (void)cj_deleteBackward:(NSInteger)cur text:(NSString *)text;

@end

@interface CJTextField : UITextField

@property (nonatomic,weak) id <CJTextFieldDelegate> cj_delegate;

@end

NS_ASSUME_NONNULL_END
