//
//  personObject.h
//  contactViewController
//
//  Created by catinclay on 3/10/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface personObject : NSObject{
    int personID;
    NSString *name;
    NSString *phoneNumber;
    NSString *imageAddress;
};




-(void) setPersonID:(int) newID;
-(void) setPersonName:(NSString *) newName;
-(void) setPersonPhoneNumber:(NSString *) newPhoneNumber;
-(void) setPersonImageAddress:(NSString *) newImageAddress;

-(int) getPersonID;
-(NSString *) getPersonName;
-(NSString *) getPersonPhoneNumber;
-(NSString *) getPersonImageAddress;

@end
