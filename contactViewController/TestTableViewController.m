//
//  TestTableViewController.m
//  contactViewController
//
//  Created by catinclay on 3/3/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import "TestTableViewController.h"
#import "TestViewController.h"
#import "Singleton.h"
#import "personObject.h"
#import "ContactTableViewCell.h"


@interface TestTableViewController ()

@end

@implementation TestTableViewController
@synthesize objects;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];

    if (self) {
       
        // Custom initialization
    }
   


    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.objects =  [[NSMutableArray alloc] init];
    self.testViewController = (TestViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    Singleton *mySingleton = [Singleton sharedManager];
    [mySingleton createDatabaseTable];
    _contactDB = [mySingleton linkToDatabase];
    
    NSString *query = @"SELECT NAME, PHONE, IMAGEADDRESS FROM CONTACTS";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_contactDB, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            personObject *newPersonObject = [personObject alloc];
            char *nameChars = (char *) sqlite3_column_text(statement, 0);
            char *phoneChars = (char *) sqlite3_column_text(statement, 1);
            char *imageAddressChars = (char *) sqlite3_column_text(statement, 2);
            [newPersonObject setPersonName: [[NSString alloc] initWithUTF8String:nameChars]];
            [newPersonObject setPersonPhoneNumber:[[NSString alloc] initWithUTF8String: phoneChars]];
            [newPersonObject setPersonImageAddress: [[NSString alloc] initWithUTF8String:imageAddressChars]];

//            newPersonObject.name = @"DOOOOOOOOOO";
            
//            NSLog(@"\nWAWAWA: %@",[[NSString alloc] initWithUTF8String:nameChars]);
//            NSLog(@"\nWAWAWA: %@",[newPersonObject getPersonName]);
            
//            newPersonObject.phoneNumber = [[NSString alloc] initWithUTF8String:phoneChars];
//            newPersonObject.imageAddress = [[NSString alloc] initWithUTF8String:imageAddressChars];
            [self.objects addObject:newPersonObject];
        }
        sqlite3_finalize(statement);
        [mySingleton closeDatabase];
        
    }
    
    
    
    
    
    
//    self.objects = [NSArray arrayWithObjects:@"David",@"Connie",@"Zhaonan",nil];
//    self.objects arrayByAddingObject:
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = N O;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    NSLog(@"MOO: %d", self.objects.count);
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContactTableViewCell";
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ContactCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
        cell = [[ContactTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContactTableViewCell"];
    }
    

    

    

    // Configure the cell.
    cell.nameLabel.text = [((personObject *)self.objects[indexPath.row]) getPersonName];
//    cell.textLabel.text = [((personObject *)self.objects[indexPath.row]) getPersonName];

    cell.phoneLabel.text = [((personObject *)self.objects[indexPath.row]) getPersonPhoneNumber];
    [cell.personImageView setImage:[UIImage imageNamed:[((personObject *)self.objects[indexPath.row]) getPersonImageAddress]]];

    [self.objects objectAtIndex:indexPath.row];
    
    
//    cell.detailTextLabel.text = [self.objects objectAtIndex:indexPath.row];
//    [cell.imageView setImage:[UIImage imageNamed:@"henry_head.jpg"]];
//    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:11];
//    [imageView setImage:[UIImage imageNamed:@"henry_head.jpg"]];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [cell addSubview:imageView];
    return cell;
}

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    
    if ([[segue identifier] isEqualToString:@"segue_to_detail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSObject *object = (personObject *)self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {

        NSString *object = self.objects[indexPath.row];
        self.testViewController.detailItem = object;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 138;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation


*/
@end
