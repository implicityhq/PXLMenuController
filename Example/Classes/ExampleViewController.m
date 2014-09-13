//
//  ExampleViewController.m
//  Example
//
//  Created by Jason Silberman on 8/14/14.
//  Copyright (c) 2014 Jason Silberman. All rights reserved.
//

#import "ExampleViewController.h"

#import "PXLMenuController.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor purpleColor];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	UIButton *button = [[UIButton alloc] init];
	button.translatesAutoresizingMaskIntoConstraints = NO;
	[button setTitle:@"Show Menu Controller" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
	[button setBackgroundColor:[UIColor blackColor]];
	button.contentEdgeInsets = UIEdgeInsetsMake(7.5, 10, 7.5, 10);
	button.layer.cornerRadius = 4.f;
	[self.view addSubview:button];
	
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
}

- (void)go {
	PXLMenuController *controller = [[PXLMenuController alloc] initWithItems:nil placement:PXLMenuControllerPlacementBottom];
	
	controller.title = @"How do you like this?"; // Optional
	
	PXLMenuItem *item = [PXLMenuItem menuItemWithTitle:@"Horay!" tintColor:[UIColor greenColor] action:^{
		NSLog(@"Horay tapped!");
	}];
	
	[controller addItem:item];
	
	item = [PXLMenuItem menuItemWithTitle:@"Eh..." tintColor:[UIColor orangeColor] action:^{
		NSLog(@"Eh Tapped");
	}];
	
	[controller addItem:item];
	
	item = [PXLMenuItem menuItemWithTitle:@"Grrrr" tintColor:[UIColor redColor] action:^{
		NSLog(@"Grrr tapped");
	}];
	
	[controller addItem:item];
	
	controller.cancelBlock = ^{
		NSLog(@"Canceled");
	};
	
	[self presentViewController:controller animated:YES completion:nil];
}

@end
