//
//  MICollectionViewBubbleLayout.m
//  ObjectiveCDemo
//
//  Created by mac-0007 on 05/12/17.
//  Copyright © 2017 Jignesh-0007. All rights reserved.
//

#import "MICollectionViewBubbleLayout.h"

#define kDefaultInterItemSpacing    5.0f
#define kDefaultLineSpacing         5.0f

@interface MICollectionViewBubbleLayout ()

@property (nonatomic, strong) NSDictionary *itemLayoutDictionary;
@property (nonatomic) CGSize contentSize;

@end

@implementation MICollectionViewBubbleLayout

- (id)initWithDelegate:(id <MICollectionViewBubbleLayoutDelegate>)delegate
{
    self = [super init];
    
    if (self) {
        self.delegate = delegate;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = kDefaultLineSpacing;
        self.minimumInteritemSpacing = kDefaultInterItemSpacing;
    }
    
    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    if (self.collectionView.numberOfSections == 0 || [self.collectionView numberOfItemsInSection:0] == 0)
        return;
    
    if (self.itemLayoutDictionary) self.itemLayoutDictionary = nil;
    
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    CGSize iSize = CGSizeZero;
    
    NSIndexPath *indexPath;
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    NSMutableDictionary *itemLayoutInformation = [NSMutableDictionary dictionary];
    
    for (int itemIndex = 0; itemIndex < numberOfItems; itemIndex ++) {
        indexPath = [NSIndexPath indexPathForItem:itemIndex inSection:0];
        iSize = [self.delegate collectionView:self.collectionView itemSizeAtIndexPath:indexPath];
        
        CGRect itemRect = CGRectMake(x, y, iSize.width, iSize.height);
        if (x > 0 && x + iSize.width + self.minimumInteritemSpacing > self.collectionView.frame.size.width) {
            //...Checking if item width is greater than collection view width then set item in new row.
            itemRect.origin.x = 0.0f;
            itemRect.origin.y = y + iSize.height + self.minimumLineSpacing;
        }
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        [attributes setFrame:itemRect];
        [itemLayoutInformation setObject:attributes forKey:indexPath];
        
        x = itemRect.origin.x + iSize.width + self.minimumInteritemSpacing;
        y = itemRect.origin.y;
    }
    y += iSize.height;
    x = 0.0f;
    
    self.contentSize = CGSizeMake(self.collectionView.frame.size.width, y + self.minimumLineSpacing);
    self.itemLayoutDictionary = [NSDictionary dictionaryWithDictionary:itemLayoutInformation];
}

- (CGSize)collectionViewContentSize {
    return self.contentSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [NSMutableArray array];
    
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    for (int itemIndex = 0; itemIndex < numberOfItems; itemIndex ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:itemIndex inSection:0];
        UICollectionViewLayoutAttributes *itemAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        if (CGRectIntersectsRect(rect, itemAttributes.frame)) {
            [attributes addObject:itemAttributes];
        }
    }
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [self.itemLayoutDictionary objectForKey:indexPath];
    return attributes;
}

@end
