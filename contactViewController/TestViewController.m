//
//  TestViewController.m
//  contactViewController
//
//  Created by catinclay on 3/3/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import "TestViewController.h"
#import "personObject.h"

@interface TestViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void) configureView;
@end
@implementation TestViewController
- (void) setDetailItem:(id)newNameItem
{
    if (_detailItem != newNameItem) {
        _detailItem = newNameItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}


- (void)configureView
{
    if (self.detailItem) {
        self.nameLabel.text = [(personObject *)_detailItem getPersonName] ;
        self.phoneNumber.text = [(personObject *)_detailItem getPersonPhoneNumber];
        [self.imageView setImage:[UIImage imageNamed:[(personObject *)_detailItem getPersonImageAddress]]];
        

    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self configureView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view


- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
