//
//  MIBubbleCollectionViewCell.h
//  ObjectiveCDemo
//
//  Created by mac-0007 on 05/12/17.
//  Copyright © 2017 Jignesh-0007. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIBubbleCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageRoundItem;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@property (strong, nonatomic) NSArray *arrayFiltered;
@end
