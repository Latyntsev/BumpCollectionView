//
//  ViewController.swift
//  BumpCollectionView
//
//  Created by Aleksandr Latyntsev on 4/8/16.
//  Copyright © 2016 Aleksandr Latyntsev. All rights reserved.
//

import UIKit


class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let data = [
        UIImage(named:"img_1"),
        UIImage(named:"img_2"),
        UIImage(named:"img_3"),
        UIImage(named:"img_4"),
        UIImage(named:"img_5"),
        UIImage(named:"img_6"),
        UIImage(named:"img_1"),
        UIImage(named:"img_2"),
        UIImage(named:"img_3"),
        UIImage(named:"img_4"),
        UIImage(named:"img_5"),
        UIImage(named:"img_6"),
        UIImage(named:"img_1"),
        UIImage(named:"img_2"),
        UIImage(named:"img_3"),
        UIImage(named:"img_4"),
        UIImage(named:"img_5"),
        UIImage(named:"img_6")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MyCollectionViewCell
        cell.imageView.image = data[indexPath.row]
        return cell;
    }

//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
//        return 10
//    }
}

