//
//  CustomTableViewCell.h
//  SimpleDelegate
//
//  Created by Joshua Howland on 10/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomTableCellDelegate;

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, assign) id<CustomTableCellDelegate> delegate;

@end

@protocol CustomTableCellDelegate <NSObject>

- (void)cellButtonPressed:(UIButton *)button;

@end