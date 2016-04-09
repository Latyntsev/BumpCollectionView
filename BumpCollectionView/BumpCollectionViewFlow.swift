//
//  BumpCollectionViewFlow.swift
//  BumpCollectionView
//
//  Created by Aleksandr Latyntsev on 4/9/16.
//  Copyright © 2016 Aleksandr Latyntsev. All rights reserved.
//

import UIKit

class BumpCollectionViewFlow: UICollectionViewFlowLayout {

    @IBInspectable var offset: CGFloat = 300.0 {
        didSet {
            self.invalidateLayout()
        }
    }
    
    override var minimumLineSpacing: CGFloat {
        set {}
        get {
            return 0
        }
    }
    
    override func collectionViewContentSize() -> CGSize {
        var size = super.collectionViewContentSize()
        if let collectionView = self.collectionView {
            size.height += (collectionView.frame.height - self.itemSize.height)
        }
        return size
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElementsInRect(rect)
        var resultArray = [UICollectionViewLayoutAttributes]()
        
        for attribute in attributes ?? [] {
            if let attribute = attribute.copy() as? UICollectionViewLayoutAttributes {
                updateAttribute(attribute)
                resultArray.append(attribute)
            }
        }
        
        return resultArray
    }
    
    
    
    func updateAttribute(attribute: UICollectionViewLayoutAttributes?) {
        
        if let attribute = attribute, let collectionView = self.collectionView where attribute.representedElementKind == nil {
            
            let delegate = collectionView.delegate as? UICollectionViewDelegateFlowLayout
            
            let lineSpasing = delegate?.collectionView?(collectionView, layout: self, minimumLineSpacingForSectionAtIndex: attribute.indexPath.section) ?? self.minimumLineSpacing
            let originY = attribute.frame.origin.y
            let cellHeight = attribute.frame.size.height + lineSpasing
            let contentOffsetY = max(collectionView.contentOffset.y,0)
            let z = (originY - contentOffsetY) / cellHeight
            
            attribute.frame.origin.x = 0
            attribute.frame.origin.y += offset
            attribute.frame.size.width = collectionView.frame.width
            
            
            if z >= -1 && z <= 1 {
                
                if z < 0 {
                    let extraheight = offset * (1 + z)
                    attribute.frame.origin.y = contentOffsetY
                    attribute.frame.size.height += extraheight
                    attribute.frame.size.height += z * cellHeight
                } else {
                    let value = (offset * (1 - z))
                    attribute.frame.origin.y -= value
                    attribute.frame.size.height += value
                }
            } else {
                if z < 0 {
                    attribute.frame.origin.y = contentOffsetY
                    attribute.frame.size.height = 0
                }
            }
            
        }
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }

}
