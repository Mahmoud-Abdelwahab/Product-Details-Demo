//
//  ProductDetailsVC.swift
//  ProductDetailsDemo
//
//  Created by Cegma on 21/06/2021.
//

import UIKit

enum Segmented{
    case description
    case review
}

class ProductDetailsVC: UIViewController {
    @IBOutlet weak var favBtnTopConstrain: NSLayoutConstraint!
    @IBOutlet weak var tableVIewTopConstarin: NSLayoutConstraint!
    @IBOutlet weak var productImageHeightConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var outerBackBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    
    var segmented: Segmented = .description
    var group = DispatchGroup()
    var headerIsHidden = true
    var height:CGFloat {
        return UIScreen.main.bounds.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate      = self
        tableView.dataSource    = self
        
        tableView.register(UINib(nibName: CategoryCell.identifier, bundle: nil), forCellReuseIdentifier: CategoryCell.identifier)
        
        tableView.register(UINib(nibName: DescriptionCell.identifier, bundle: nil), forCellReuseIdentifier: DescriptionCell.identifier)
        
        tableView.register(UINib(nibName: ReviewCell.identifier, bundle: nil), forCellReuseIdentifier: ReviewCell.identifier)

    }
}


extension ProductDetailsVC: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 10:0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmented == .description { // Description
            if indexPath.section == 0 && indexPath.row  > 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier) as! CategoryCell
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.identifier) as! DescriptionCell
                return cell
            }
        }else{ // Review
            let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCell.identifier) as! ReviewCell
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0{
            let headerCell = Bundle.main.loadNibNamed("HeaderCell", owner: self, options: nil)?.first as! HeaderCell
            
            headerCell.descriptionBtnAction = {[weak self] in
                guard let self = self else {return}
                print("description")
                DispatchQueue.main.async {
                    self.segmented = .description
                    self.tableView.reloadData()
                }
            }
            
            headerCell.reviewBtnAction = {[weak self] in
                guard let self = self else {return}
                print("reviews")
                DispatchQueue.main.async {
                    self.segmented = .review
                   self.tableView.reloadData()
                }
            }
            
            self.segmented == .description ?  headerCell.animateDescriptionBtn() : headerCell.animateReviewBtn()
      
            return headerCell
        }else{
            let relatedProductCell = Bundle.main.loadNibNamed(RelatedProuctCell.identifier, owner: self, options: nil)?.first as! RelatedProuctCell
            return relatedProductCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if segmented == .description {
            return 232
        }else{
            return 95
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 60 : 220
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 250{
            if headerIsHidden {
                print("Kaaaaky....")
                
                UIView.animate(withDuration: 0.7, delay: 0.0, options: .transitionCurlDown, animations: {[weak self] in
                    guard let self = self else {return}
                    self.headerView.isHidden = false
                    self.headerView.alpha    = 1
                    self.favBtn.isHidden     = true
                    self.headerIsHidden = false
                }, completion: nil)
            }
        }else{
            if headerIsHidden == false{
                print("SToOOOp")
                UIView.animate(withDuration: 0.7, delay: 0.0, options: .showHideTransitionViews, animations: {[weak self] in
                    guard let self = self else {return}
                    self.headerView.isHidden = true
                    self.headerView.alpha    = 0
                    self.favBtn.isHidden     = false
                    self.headerIsHidden = true
                }, completion: nil)
            }
        }
    }
    
}
