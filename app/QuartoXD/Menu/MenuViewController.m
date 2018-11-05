//
//  MenuViewController.m
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuView.h"

@interface MenuViewController ()
@end

@implementation MenuViewController

- (void)loadView {
    self.view = [[MenuView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
}

@end
