//
//  Singleton.m
//  contactViewController
//
//  Created by catinclay on 3/9/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

@synthesize someProperty;

+ (id)sharedManager {
    static Singleton *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}



- (sqlite3 *) createDatabaseTable{
    

    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    _databasePath = [[NSString alloc]
                     initWithString: [docsDir stringByAppendingPathComponent:
                                      @"contacts.db"]];
    
//    NSLog(@"\nWAWAWA: %@",_databasePath);

    NSFileManager *filemgr = [NSFileManager defaultManager];

    if ([filemgr fileExistsAtPath: _databasePath ] == NO)
    {
        const char *dbpath = [_databasePath UTF8String];
        if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, IMAGEADDRESS TEXT, NAME TEXT, PHONE TEXT)";
            if (sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to create table");
            }
            
            NSLog(@"Successfully create Database");
            
            sqlite3_stmt * addStmt;
            
            
            sql_stmt =
            "INSERT INTO CONTACTS (ID,IMAGEADDRESS,NAME,PHONE) VALUES (?,?,?,?)";
            if(sqlite3_prepare_v2(_contactDB, sql_stmt, -1, &addStmt, NULL) != SQLITE_OK)
                NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(_contactDB));
            sqlite3_bind_int(addStmt, 1, 000001);
            sqlite3_bind_text(addStmt, 2, [@"david_head.jpg" UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(addStmt, 3, [@"DAVID" UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(addStmt, 4, [@"9177146505" UTF8String], -1, SQLITE_TRANSIENT);
            if(SQLITE_DONE != sqlite3_step(addStmt))
                NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(_contactDB));
            sqlite3_reset(addStmt);

            sql_stmt =
            "INSERT INTO CONTACTS (ID,IMAGEADDRESS,NAME,PHONE) VALUES (?,?,?,?)";
            if(sqlite3_prepare_v2(_contactDB, sql_stmt, -1, &addStmt, NULL) != SQLITE_OK)
                NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(_contactDB));
            sqlite3_bind_int(addStmt, 1, 000002);
            sqlite3_bind_text(addStmt, 2, [@"connie_head.jpg" UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(addStmt, 3, [@"CONNIE" UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(addStmt, 4, [@"123456789" UTF8String], -1, SQLITE_TRANSIENT);
            if(SQLITE_DONE != sqlite3_step(addStmt))
                NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(_contactDB));
            
            
            sqlite3_reset(addStmt);
            
            sql_stmt =
            "INSERT INTO CONTACTS (ID,IMAGEADDRESS,NAME,PHONE) VALUES (?,?,?,?)";
            if(sqlite3_prepare_v2(_contactDB, sql_stmt, -1, &addStmt, NULL) != SQLITE_OK)
                NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(_contactDB));
            sqlite3_bind_int(addStmt, 1, 000003);
            sqlite3_bind_text(addStmt, 2, [@"zhaonan_head.jpg" UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(addStmt, 3, [@"ZHAONAN" UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(addStmt, 4, [@"987654321" UTF8String], -1, SQLITE_TRANSIENT);
            if(SQLITE_DONE != sqlite3_step(addStmt))
                NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(_contactDB));
            
            
            sqlite3_reset(addStmt);
            
            
            
            

            
            sqlite3_close(_contactDB);
            
            
        } else {
            NSLog(@"Fail to open/create database");
        }
    }
    return _contactDB;
}


- (sqlite3 *)linkToDatabase{
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSLog(@"Successfully Link to database");
    }
    return _contactDB;
}


-(void) closeDatabase{
    
    sqlite3_close(_contactDB);

}


- (id)init {
    if (self = [super init]) {
        someProperty = @"Default Property Value";
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}



@end
