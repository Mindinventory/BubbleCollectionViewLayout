//
//  MIMainViewController.m
//  ObjectiveCDemo
//
//  Created by mac-0007 on 05/12/17.
//  Copyright © 2017 Jignesh-0007. All rights reserved.
//

#import "MIMainViewController.h"
#import "MICollectionViewBubbleLayout.h"
#import "MIBubbleCollectionViewCell.h"

#define CTitlePadding   15

@interface MIMainViewController () <MICollectionViewBubbleLayoutDelegate>
{
    IBOutlet UICollectionView *collVData;
    
    NSArray *arrData;
}
@end

@implementation MIMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //...
    arrData = @[@"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"Regular", @"Chocolate", @"Blueberry", @"Devil's Food", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"Regular", @"Chocolate", @"Blueberry", @"Devil's Food", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"Regular", @"Chocolate", @"Blueberry", @"Devil's Food", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"Regular", @"Chocolate", @"Blueberry", @"Devil's Food", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"Regular", @"Chocolate", @"Blueberry", @"Devil's Food", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"Regular", @"Chocolate", @"Blueberry", @"Devil's Food", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"Regular", @"Chocolate", @"Blueberry", @"Devil's Food", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple", @"Regular", @"Chocolate", @"Blueberry", @"Devil's Food", @"None", @"Glazed", @"Sugar", @"Powdered Sugar", @"Chocolate with Sprinkles", @"Chocolate", @"Maple"];
    
    
    //...UICollectionView setup
    MICollectionViewBubbleLayout *layout = [[MICollectionViewBubbleLayout alloc] initWithDelegate:self];
    [layout setMinimumLineSpacing:6.0f];
    [layout setMinimumInteritemSpacing:6.0f];
    [collVData setCollectionViewLayout:layout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -
#pragma mark - UICollectionView Delegate & Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *indentifier = @"MIBubbleCollectionViewCell";
    MIBubbleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];
    
    [cell.lblTitle setText:arrData[indexPath.row]];
    return cell;
}


#pragma mark -
#pragma mark - MICollectionViewBubbleLayoutDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView itemSizeAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = arrData[indexPath.row];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15]}];
    size.width = ceilf(size.width + CTitlePadding * 2);
    size.height = 24;
    
    //...Checking if item width is greater than collection view width then set item width == collection view width.
    if (size.width > collectionView.frame.size.width)
        size.width = collectionView.frame.size.width;
    return size;
}

@end
