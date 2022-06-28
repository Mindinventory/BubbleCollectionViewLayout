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
    NSMutableArray *arrData;
    NSMutableDictionary *Items;
}
@end

@implementation MIMainViewController

@synthesize collVData;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrData = [[NSMutableArray alloc] init];
    
    [arrData addObject:[self createDictionary:@"Glazed" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Sugar" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Powdered Sugar" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Chocolate with Sprinkles" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Chocolate" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Devil's Food" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Maple" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Sugar" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Blueberry" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Regular" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Powdered Sugar" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Glazed" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Sugar" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Powdered Sugar" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Chocolate with Sprinkles" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Chocolate" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Devil's Food" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Maple" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Sugar" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Blueberry" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Regular" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Chocolate with Sprinkles" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Sugar" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Powdered Sugar" isSelected:[NSNumber numberWithBool:false]]];
    [arrData addObject:[self createDictionary:@"Blueberry" isSelected:[NSNumber numberWithBool:false]]];
    
    
    //...UICollectionView setup
    MICollectionViewBubbleLayout *layout = [[MICollectionViewBubbleLayout alloc] initWithDelegate:self];
    [layout setMinimumLineSpacing:6.0f];
    [layout setMinimumInteritemSpacing:6.0f];
    [collVData setCollectionViewLayout:layout];
}

//MARK: - Function For Adding Value in Dictionary -
-(NSMutableDictionary*)createDictionary:(NSString*)itemName isSelected:(id)isSelected{
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:itemName forKey:@"name"];
    [dict setValue:isSelected forKey:@"isSelected"];
    return dict;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//MARK: - Remove cell Method -
-(IBAction)closeBtnTapped:(UIButton*)sender
{
    NSInteger indexRow = sender.tag;
    [arrData removeObjectAtIndex:indexRow];
    [collVData reloadData];
}

#pragma mark -
#pragma mark - UICollectionView Delegate & Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *indentifier = @"MIBubbleCollectionViewCell";
    
    MIBubbleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];
    cell.btnClose.tag = indexPath.row;
    cell.layer.borderColor = [[UIColor orangeColor] CGColor];
    cell.layer.borderWidth = 1;
    [cell.btnClose addTarget:self action:@selector(closeBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
    [cell.lblTitle setText:[arrData[indexPath.row] valueForKey:@"name"]];
    cell.imageRoundItem.image = [UIImage imageNamed:@"chocolate"];
    cell.imageRoundItem.layer.cornerRadius = 10.0;
    
    if ([arrData[indexPath.row] valueForKey:@"isSelected"] == [NSNumber numberWithBool:true]){
        cell.backgroundColor = [UIColor orangeColor];
        cell.btnClose.tintColor = [UIColor whiteColor];
        cell.lblTitle.textColor = [UIColor whiteColor];
    }else{
        cell.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:0.2];
        cell.btnClose.tintColor = [UIColor orangeColor];
        cell.lblTitle.textColor = [UIColor blackColor];
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *dict = arrData[indexPath.row];
    
    if ([dict valueForKey:@"isSelected"] == [NSNumber numberWithBool:false]){
        [dict setValue:[NSNumber numberWithBool:true] forKey:@"isSelected"];
    }else{
        [dict setValue:[NSNumber numberWithBool:false] forKey:@"isSelected"];
    }
    
    [arrData replaceObjectAtIndex:indexPath.row withObject:dict];
    [collVData reloadData];
    
}

#pragma mark -
#pragma mark - MICollectionViewBubbleLayoutDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView itemSizeAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = [arrData[indexPath.row] valueForKey:@"name"];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15]}];
    size.width = ceilf(size.width + CTitlePadding * 5.5);
    size.height = 35;
    
    //...Checking if item width is greater than collection view width then set item width == collection view width.
    if (size.width > collectionView.frame.size.width){
        size.width = collectionView.frame.size.width;
    }
    return size;
}

@end
