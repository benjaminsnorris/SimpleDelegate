//
//  ViewController.m
//  SimpleDelegate
//
//  Created by Joshua Howland on 10/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController () <CustomTableCellDelegate>

@property (nonatomic, assign) NSInteger value;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Simple Delegate Cell";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
            }
            cell.textLabel.text = [@(self.value) stringValue];
            return cell;
            break;
        }
        case 1: {
            CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomTableViewCell class])];
            if (!cell) {
                cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([CustomTableViewCell class])];
                cell.delegate = self;
            }
            return cell;
            break;
        }
    }
    
    return nil;
}

- (void)cellButtonPressed:(UIButton *)button {
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    if (button.tag == 1) {
        cell.textLabel.text = [NSString stringWithFormat: @"%ld", cell.textLabel.text.integerValue + 1];
    } else {
        cell.textLabel.text = [NSString stringWithFormat: @"%ld", cell.textLabel.text.integerValue - 1];
    }
}
@end
