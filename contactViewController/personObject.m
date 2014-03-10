//
//  personObject.m
//  contactViewController
//
//  Created by catinclay on 3/10/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import "personObject.h"


@implementation personObject

-(void)setPersonID:(int)newID{
    personID = newID;
}

-(void)setPersonName:(NSString *)newName{
    name = newName;
}

-(void)setPersonImageAddress:(NSString *)newImageAddress{
    imageAddress = newImageAddress;
}

-(void)setPersonPhoneNumber:(NSString *)newPhoneNumber{
    phoneNumber = newPhoneNumber;
}


-(int) getPersonID{
    return personID;
}
-(NSString *) getPersonName{
    return name;
}
-(NSString *) getPersonPhoneNumber{
    return phoneNumber;
}
-(NSString *) getPersonImageAddress{
    return imageAddress;
}

@end
