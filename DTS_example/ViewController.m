//
//  ViewController.m
//  DTS_example
//
//  Created by Clément Padovani on 6/8/18.
//  Copyright © 2018 Clement Padovani. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)goToIndex:(id)sender {
    CollectionViewController *viewController = [[self storyboard] instantiateViewControllerWithIdentifier: @"collectionView"];

    [viewController setCurrentIndex: 3];
    
    [self presentViewController: viewController animated: YES completion: NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
