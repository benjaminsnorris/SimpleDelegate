//
//  CustomTableViewCell.m
//  SimpleDelegate
//
//  Created by Joshua Howland on 10/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIButton *incrementButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [incrementButton setTitle:@"Add 1" forState:UIControlStateNormal];
        incrementButton.backgroundColor = [UIColor greenColor];
        [incrementButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [incrementButton setTranslatesAutoresizingMaskIntoConstraints:NO];
     
        [incrementButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
        incrementButton.tag = 1;
        
        [self.contentView addSubview:incrementButton];
        
        UIButton *decrementButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [decrementButton setTitle:@"Minus 1" forState:UIControlStateNormal];
        decrementButton.backgroundColor = [UIColor redColor];
        [decrementButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [decrementButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [decrementButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
        decrementButton.tag = 2;
        [self.contentView addSubview:decrementButton];
        
        NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(incrementButton,decrementButton);
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[decrementButton(100)]-(>=8)-[incrementButton(==decrementButton)]-|" options:NSLayoutFormatAlignAllCenterY metrics:0 views:viewsDictionary]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[decrementButton]-|" options:0 metrics:0 views:viewsDictionary]];
    }
    return self;
    
}

- (void)selectedButton:(UIButton *)button {
    [self.delegate cellButtonPressed:button];
}

@end
