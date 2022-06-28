//
//  MIBubbleCollectionViewCell.m
//  ObjectiveCDemo
//
//  Created by mac-0007 on 05/12/17.
//  Copyright © 2017 Jignesh-0007. All rights reserved.
//

#import "MIBubbleCollectionViewCell.h"

@implementation MIBubbleCollectionViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.layer setCornerRadius:self.frame.size.height/2];
}

@end
