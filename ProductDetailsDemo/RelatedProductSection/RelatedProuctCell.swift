//
//  RelatedProuctCell.swift
//  ProductDetailsDemo
//
//  Created by Mahmoud Abdul-Wahab on 17/07/2021.
//

import UIKit

class RelatedProuctCell: UITableViewCell {

    @IBOutlet weak var relatedProductCollectionView: UICollectionView!
    
    static let identifier = "RelatedProuctCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        relatedProductCollectionView.delegate   = self
        relatedProductCollectionView.dataSource = self

       relatedProductCollectionView.register(UINib(nibName: ProductCell.identifier, bundle:nil), forCellWithReuseIdentifier: ProductCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}


extension RelatedProuctCell:UICollectionViewDataSource,UICollectionViewDelegate{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = relatedProductCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
      
        return cell
    }
    
    
}

