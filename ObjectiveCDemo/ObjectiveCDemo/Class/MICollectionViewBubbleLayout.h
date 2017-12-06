//
//  MICollectionViewBubbleLayout.h
//  ObjectiveCDemo
//
//  Created by mac-0007 on 05/12/17.
//  Copyright © 2017 Jignesh-0007. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MICollectionViewBubbleLayoutDelegate <NSObject>

- (CGSize)collectionView:(UICollectionView *)collectionView itemSizeAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MICollectionViewBubbleLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id <MICollectionViewBubbleLayoutDelegate> delegate;

- (id)initWithDelegate:(id <MICollectionViewBubbleLayoutDelegate>)delegate;

@end
