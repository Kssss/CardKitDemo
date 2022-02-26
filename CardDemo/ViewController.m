//
//  ViewController.m
//  111111
//
 

#import "ViewController.h"
#import "CardViewController.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"点击屏幕开始";
    label.font = [UIFont systemFontOfSize:20];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    label.frame = self.view.bounds;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    CardViewController * cardViewC = [[CardViewController  alloc] init];
    cardViewC.pageId = @"";
    cardViewC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cardViewC animated:YES];
    
}

@end
