//
//  ContactTableViewCell.h
//  contactViewController
//
//  Created by catinclay on 3/9/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UIImageView *personImageView;


@end
