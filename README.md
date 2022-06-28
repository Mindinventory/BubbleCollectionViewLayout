# BubbleCollectionViewLayout
Used to get layout like following screens in UICollectionView using custom layout.

![bubble_portrait](https://user-images.githubusercontent.com/84714866/176125212-0eaf8bf7-e67a-424a-83a1-fe702f8dbed5.png)
![bubble_landscape](https://user-images.githubusercontent.com/84714866/176124648-9eed4e73-9a7c-4123-aeee-8e94fdec511a.png)

# Requirements
Minimum OS 8.1 and later

# Manual Installation
You can directly add Below the source files from Class folder to your project.

# Objective C
1) MIBubbleCollectionViewCell.h
2) MIBubbleCollectionViewCell.m
3) MICollectionViewBubbleLayout.h
4) MICollectionViewBubbleLayout.m
# Swift
1) MIBubbleCollectionViewCell.swift
2) MICollectionViewBubbleLayout.swift

# Introduce
MICollectionViewBubbleLayout is subclass of UICollectionViewFlowLayout with the custom layout.

# Usage
The easy way is to use UICollectionViewFlowLayout as it is. You can also subclass it if you intend to change the default behaviour.

Here is the instruction of how to use UICollectionViewFlowLayout in the Storyboard.

1) Add native UICollectionView to the storyboard, establish relationships with its view controllers.
2) Add UICollectionViewCell in the UICollectionView to the storyboard.
3)Chose the MIBubbleCollectionViewCell as a custom class inside the UICollectionViewCell to the storyboard.
Configuration for change DefaultInterItemSpacing & DefaultLineSpacing of collecttionview cell you just have to change the value of below two constant in MICollectionViewBubbleLayout.h

#define kDefaultInterItemSpacing    5.0f

#define kDefaultLineSpacing         5.0f

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

# LICENSE!

BubbleCollectionViewLayout is [MIT-licensed](https://github.com/mindinventory/BubbleCollectionViewLayout/blob/master/LICENSE).

## Let us know!
We’d be really happy if you send us links to your projects where you use our component. Just send an email to sales@mindinventory.com And do let us know if you have any questions or suggestion regarding our work.
