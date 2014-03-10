//
//  AppDelegate.h
//  contactViewController
//
//  Created by catinclay on 3/3/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;


@end
