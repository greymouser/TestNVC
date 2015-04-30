//
//  ViewController.m
//  TestNVC
//
//  Created by Armando Di Cianno on 4/29/15.
//
//


#import "ViewController.h"


@interface ViewController ()
@property (readwrite,nonatomic) NSInteger level;
@end


#define LOG_WILL_DID_MTPVC 0
#define LOG_WILL_DID_MTPVC_LEAVING_AND_NVC_WILL_DID_SHOW_VC 1


@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;

    self.level = LOG_WILL_DID_MTPVC_LEAVING_AND_NVC_WILL_DID_SHOW_VC;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];

    if ([self.navigationController.viewControllers count] > 1) {
        UIButton *popButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [popButton setTitle:@"Pop View" forState:UIControlStateNormal];
        [popButton addTarget:self action:@selector(popIt:) forControlEvents:UIControlEventTouchUpInside];
        [popButton sizeToFit];
        [popButton setCenter:CGPointMake(160,240)];
        [self.view addSubview:popButton];
    }
    
    UIButton *pushAnotherButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [pushAnotherButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [pushAnotherButton setTitle:@"Push Another View" forState:UIControlStateNormal];
    [pushAnotherButton addTarget:self action:@selector(pushIt:) forControlEvents:UIControlEventTouchUpInside];
    [pushAnotherButton sizeToFit];
    [pushAnotherButton setCenter:CGPointMake(160,280)];
    [self.view addSubview:pushAnotherButton];
}

- (void)popIt:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushIt:(id)sender
{
    ViewController *vc = [ViewController new];
    vc.title = [NSString stringWithFormat:@"%ld",
                (unsigned long)[self.navigationController.viewControllers count]];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
    if (self.level == 0) {
        NSLog(@"-[vc(%@) willMoveToParentViewController [%@]", self.title, parent?@"entering":@"leaving");
    }
    
    if (self.level == 1 && !parent) {
        NSLog(@"-[vc(%@) willMoveToParentViewController [%@]", self.title, @"leaving");
    }
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    if (self.level == 0) {
        NSLog(@"-[vc(%@) didMoveToParentViewController [%@]", self.title, parent?@"entering":@"leaving");
    }
    
    if (self.level == 1 && !parent) {
        NSLog(@"-[vc(%@) didMoveToParentViewController [%@]", self.title, @"leaving");
    }
}

@end
