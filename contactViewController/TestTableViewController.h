//
//  TestTableViewController.h
//  contactViewController
//
//  Created by catinclay on 3/3/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>


@class TestViewController;


@interface TestTableViewController : UITableViewController
@property (nonatomic, retain) NSMutableArray *objects;
@property (strong, nonatomic) TestViewController *testViewController;

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;


@end
