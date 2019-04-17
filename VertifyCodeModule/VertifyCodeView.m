//
//  VertifyCodeView.m
//  VertifyCode
//
//  Created by walen on 2019/4/17.
//  Copyright © 2019 CJH. All rights reserved.
//

#import "VertifyCodeView.h"
#import "CJTextField.h"

#define KTFCount 6;

@interface VertifyCodeView ()<UITextFieldDelegate,CJTextFieldDelegate>
{
    BOOL isTextEmpty;
    NSInteger cur_p;
}
@property (nonatomic,copy)NSArray *tf_Array;
@property (nonatomic,copy)NSString *lastStr;

@property (nonatomic,strong)NSMutableString *tf_code;

@end

@implementation VertifyCodeView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _tf_Array = self.subviews.firstObject.subviews;
        UITextField *head_TF = _tf_Array.firstObject;
        [head_TF becomeFirstResponder];
        
        //设置监听
        cur_p = 0;
        [self addObserverTF];
    }
    return self;
}

- (void)addObserverTF
{
    __weak typeof(self)weakself = self;
    [_tf_Array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CJTextField *textField = (CJTextField *)obj;
        textField.delegate = weakself;
        textField.cj_delegate = weakself;
        textField.tintColor = [UIColor yellowColor];
        textField.tag = idx;
    }];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    cur_p = textField.tag;
    [_tf_Array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CJTextField *textField = (CJTextField *)obj;
        if (idx >= cur_p) {
            textField.text = @"";
        }
    }];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%ld--%@--%@",textField.tag,textField.text,string);
    if (![textField.text isEqualToString:@""]) {
        isTextEmpty = YES;
    }else{
        isTextEmpty = NO;
    }
    if (![string isEqualToString:@""]) {
        if (textField.tag != 5) {
            textField.text = [textField.text stringByAppendingString:string];
        }
        
        if (textField.tag < 5) {
            cur_p = textField.tag + 1;
            [_tf_Array[cur_p] becomeFirstResponder];
        }
    }
    
    //跳转
    if (textField.tag == 5) {
        self.lastStr = string;
        [self jumpTo];
    }
    return YES;
}

- (void)jumpTo
{
    self.tf_code = [@"" mutableCopy];
    [_tf_Array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CJTextField *textField = (CJTextField *)obj;
        [self.tf_code appendString:textField.text];
    }];
    [self.tf_code appendString:self.lastStr];
    NSLog(@"%@",self.tf_code);
//    if (self.block) {
//        self.block();
//    }
}

- (NSMutableString *)tf_code
{
    if (!_tf_code) {
        _tf_code = [[NSMutableString alloc] init];
    }
    return _tf_code;
}

- (void)cj_deleteBackward:(NSInteger)cur text:(NSString *)text
{
    NSLog(@"%ld**%@",cur_p,text);
    if ([text isEqualToString:@""]) {
        [_tf_Array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CJTextField *textField = (CJTextField *)obj;
            if (idx > cur - 1) {
                textField.text = @"";
            }else if (idx == cur - 1)
            {
                [textField becomeFirstResponder];
                if (!isTextEmpty) {
                    textField.text  = @"";
                }
            }
            
        }];
        isTextEmpty = NO;
    }
}

- (NSString *)code
{
    return self.tf_code;
}


@end
