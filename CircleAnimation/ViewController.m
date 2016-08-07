//
//  ViewController.m
//  CircleAnimation
//
//  Created by fujin on 15/10/19.
//  Copyright © 2015年 fujin. All rights reserved.
//

#import "ViewController.h"
#import "CircleAnimationView.h"

@interface ViewController ()<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
- (IBAction)sureAction:(id)sender;

- (IBAction)clearAction:(id)sender;

@property (nonatomic, strong)CircleAnimationView *circleAniView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.placeholder = @"请输入0-100,产生百分比效果";
    
    self.circleAniView = [[CircleAnimationView alloc] initWithFrame:CGRectMake(100,100, 200, 200)];
    self.circleAniView.center = self.view.center;
    self.circleAniView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.circleAniView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.textField resignFirstResponder];
}


//模拟操作
- (IBAction)sureAction:(id)sender {
    if (![self.textField.text isEqualToString:@""] && [self.textField.text integerValue]>=0 && [self.textField.text integerValue]<=100) {
        self.circleAniView.percentStr = self.textField.text;
    }
    else{
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"请输入0-100,产生百分比效果" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alter show];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        self.textField.text = @"";
        self.textField.placeholder = @"0";
    }
}
- (IBAction)clearAction:(id)sender {
    [self.circleAniView clear];
    self.textField.text = @"";
    self.textField.placeholder = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
