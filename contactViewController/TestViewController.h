//
//  TestViewController.h
//  contactViewController
//
//  Created by catinclay on 3/3/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController <UISplitViewControllerDelegate>
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
