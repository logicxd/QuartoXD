//
//  MenuViewController.m
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuView.h"
#import "UIColor+QuartoColor.h"

@interface MenuViewController()

@end

@implementation MenuViewController

@dynamic view;

- (void)loadView {
    self.view = [[MenuView alloc] init];
    self.view.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor quartoRed];
}

- (void)buttonPressedSinglePlayer {
    
}

- (void)buttonPressedVersus {
    
}

@end
