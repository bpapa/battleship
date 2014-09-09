//
//  BPMViewController.m
//  Battleship
//
//  Created by Brian Papa on 9/8/14.
//  Copyright (c) 2014 bpm apps LLC. All rights reserved.
//

#import "BPMViewController.h"

@interface BPMViewController ()
@property NSArray *backingArray;
@end

@implementation BPMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backingArray = @[@[@"1", @"M", @"M", @"M", @"M"],
                          @[@"2", @"M", @"H", @"M", @"M"],
                          @[@"3", @"M", @"H", @"M", @"M"],
                          @[@"4", @"M", @"H", @"M", @"M"],
                          @[@"5", @"M", @"H", @"M", @"M"],
                          @[@"6", @"M", @"M", @"M", @"M"],
                          @[@"", @"A", @"B", @"C", @"D"]];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.backingArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.backingArray[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([[self.backingArray[indexPath.section] objectAtIndex:indexPath.row] isEqualToString:@"H"]) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"hit" forIndexPath:indexPath];
    } else if ([[self.backingArray[indexPath.section] objectAtIndex:indexPath.row] isEqualToString:@"M"]) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"miss" forIndexPath:indexPath];
    } else {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"letter" forIndexPath:indexPath];
        UILabel *label = cell.contentView.subviews[0];
        label.text = [self.backingArray[indexPath.section] objectAtIndex:indexPath.row];
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UILabel *label = cell.contentView.subviews[0];
    label.hidden = NO;
}

@end
