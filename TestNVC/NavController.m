//
//  NavController.m
//  TestNVC
//
//  Created by Armando Di Cianno on 4/29/15.
//
//


#import "NavController.h"
#import "ViewController.h"


@interface NavController () <UINavigationControllerDelegate>
@end


@implementation NavController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    ViewController *vc = (ViewController *)viewController;
    if (vc.level > 0) {
        NSLog(@"-[nvcD willShowViewController]: %@", vc.title);
    }
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    ViewController *vc = (ViewController *)viewController;
    if (vc.level > 0) {
        NSLog(@"-[nvcD didShowViewController]: %@", vc.title);
    }
}

@end
