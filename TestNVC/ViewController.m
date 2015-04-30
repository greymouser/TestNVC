//
//  ViewController.m
//  TestNVC
//
//  Created by Armando Di Cianno on 4/29/15.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = self.name;
    
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
    vc.name = [NSString stringWithFormat:@"%ld",
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
    NSLog(@"vc(%@) willMoveToParentViewController: parent? %@", self.name, parent?@"YES":@"NO");
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    NSLog(@"vc(%@) didMoveToParentViewController: parent? %@", self.name, parent?@"YES":@"NO");
}

@end
