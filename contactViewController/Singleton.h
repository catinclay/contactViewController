//
//  Singleton.h
//  contactViewController
//
//  Created by catinclay on 3/9/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Singleton : NSObject{
    NSString *someProperty;
}


@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;


@property (nonatomic, retain) NSString *someProperty;
+ (id)sharedManager;
- (sqlite3 *)createDatabaseTable;
- (sqlite3 *)linkToDatabase;
- (void)closeDatabase;


@end
