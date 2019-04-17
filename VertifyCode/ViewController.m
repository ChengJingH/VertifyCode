//
//  ViewController.m
//  VertifyCode
//
//  Created by walen on 2019/4/17.
//  Copyright © 2019 CJH. All rights reserved.
//

#import "ViewController.h"
#import "VertifyCodeView.h"
#import "CJTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UINib *vcNib = [UINib nibWithNibName:@"VertifyCodeView" bundle:[NSBundle mainBundle]];
    VertifyCodeView *vc_View = [[NSBundle mainBundle] loadNibNamed:@"VertifyCodeView" owner:vcNib options:nil].firstObject;
    [self.view addSubview:vc_View];
    
//    CJTextField *cj = [[CJTextField alloc] initWithFrame:CGRectMake(30, 120, 80, 40)];
//    cj.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    cj.layer.borderWidth = 2.0;
//    [self.view addSubview:cj];
}


@end
