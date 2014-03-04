//
//  TestTableViewController.h
//  contactViewController
//
//  Created by catinclay on 3/3/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestViewController;


@interface TestTableViewController : UITableViewController
@property (nonatomic, retain) NSArray *objects;
@property (strong, nonatomic) TestViewController *testViewController;


@end
