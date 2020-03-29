//
//  CollectionViewController.swift
//  CollectionViewDemo
//
//  Created by Esraa Hassan on 3/29/20.
//  Copyright © 2020 Yahya. All rights reserved.
//


import UIKit
import SDWebImage
import Kingfisher
class CollectionViewController: UICollectionViewController {

    var imagesArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout{
            let cellWidth = UIScreen.main.bounds.width / 2 - 5
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }

        for i in 1...4 {
            imagesArray.append("https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png")
            imagesArray.append("https://leisure.union.ufl.edu/Content/Images/leisure-courses.png")
            imagesArray.append("https://cdn2.iconfinder.com/data/icons/new-year-resolutions/64/resolutions-06-512.png")
            imagesArray.append("https://pngimage.net/wp-content/uploads/2018/05/courses-png.png")
            imagesArray.append("https://www.pngitem.com/pimgs/m/49-491826_of-course-developing-your-employee-engagement-offering-business.png")
            imagesArray.append("https://feedbacksystems.com/wp-content/uploads/2019/12/Business.png")
        }
        
       
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    
        //cell.cellImageView?.image = UIImage.init(named: "avengers.jpg")
    //cell.cellImageView.sd_setImage(with: URL(string:imagesArray[indexPath.row]), placeholderImage: UIImage(named: "avengers.jpg"))
        cell.cellImageView.kf.setImage(with:URL(string: imagesArray[indexPath.row] ))
        return cell
    }


}
