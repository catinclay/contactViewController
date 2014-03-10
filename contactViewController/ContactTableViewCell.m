//
//  ContactTableViewCell.m
//  contactViewController
//
//  Created by catinclay on 3/9/14.
//  Copyright (c) 2014 catinclay. All rights reserved.
//

#import "ContactTableViewCell.h"

@implementation ContactTableViewCell

@synthesize nameLabel = _nameLabel;
@synthesize phoneLabel = _phoneLabel;
@synthesize personImageView = _personImageView;




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        NSArray *nibArray= [[NSBundle mainBundle] loadNibNamed:@"ContactTableViewCell" owner:self options:nil];
        self= [nibArray objectAtIndex:0];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
