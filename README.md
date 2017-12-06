# BubbleCollectionViewLayout
Used to get layout like following screens in UICollectionView using custom layout.

![bubble_portrait](https://user-images.githubusercontent.com/4393462/33650268-3d6bf07a-da87-11e7-833e-3a1fefa27cdc.png)

![bubble_landscape](https://user-images.githubusercontent.com/4393462/33650242-25296696-da87-11e7-8b32-cde7a523edc9.png)

# Usage
### Objective C -
1. Add "MICollectionViewBubbleLayout" ObjectiveC files to your project.

2. Conform delegate "MICollectionViewBubbleLayoutDelegate" to your class.

3. Set bubble layout in collectionview. 

        MICollectionViewBubbleLayout *layout = [[MICollectionViewBubbleLayout alloc] initWithDelegate:self];
        [layout setMinimumLineSpacing:6.0f];
        [layout setMinimumInteritemSpacing:6.0f];
        [collVData setCollectionViewLayout:layout];
    
4. Implement MICollectionViewBubbleLayoutDelegate method to return size according to your text content.

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
    
    
### Swift -
1. Add "MICollectionViewBubbleLayout" Swift file to your project.

2. Conform delegate "MICollectionViewBubbleLayoutDelegate" to your class.

3. Set bubble layout in collectionview.

        let bubbleLayout = MICollectionViewBubbleLayout()
        bubbleLayout.minimumLineSpacing = 6.0
        bubbleLayout.minimumInteritemSpacing = 6.0
        bubbleLayout.delegate = self 
        collVData.setCollectionViewLayout(bubbleLayout, animated: false)

4. Implement MICollectionViewBubbleLayoutDelegate method to return size according to your text content.

        func collectionView(_ collectionView:UICollectionView, itemSizeAt indexPath:NSIndexPath) -> CGSize
        {
            let title = arrData![indexPath.row] as! NSString
            var size = title.size(withAttributes: [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Bold", size: 15)!])
            size.width = CGFloat(ceilf(Float(size.width + CGFloat(kItemPadding * 2))))
            size.height = 24
        
            //...Checking if item width is greater than collection view width then set item width == collection view width.
            if size.width > collectionView.frame.size.width {
                size.width = collectionView.frame.size.width
            }
        
            return size;
        }
