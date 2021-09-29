//
//  HeaderCell.swift
//  ProductDetailsDemo
//
//  Created by Mahmoud Abdul-Wahab on 30/06/2021.
//

import UIKit


protocol HandelSegmentedActionDelegate: AnyObject{
    func didTapDescriptionBtn()
    func didTapReviewBtn()
}

class HeaderCell: UITableViewCell {

    @IBOutlet weak var reviewBtn: UIButton!
    @IBOutlet weak var descriptionBtn: UIButton!
    @IBOutlet weak var reviewProgress: UIView!
    @IBOutlet weak var descriptionProgress: UIView!
    
    var descriptionBtnAction:(()->Void)?
    var reviewBtnAction:(()->Void)?

    weak var segmentedBtnDelegate: HandelSegmentedActionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    @IBAction func descriptionBtnDidTapped(_ sender: Any) {
            self.descriptionBtnAction?()
    }
    
    
    @IBAction func reviewBtnDidTapped(_ sender: Any) {
            self.reviewBtnAction?()
    }
    
    func animateDescriptionBtn(){
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .showHideTransitionViews, animations: {[weak self] in
            guard let self = self else {return}
           
            self.descriptionProgress.backgroundColor =  #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            self.descriptionBtn.setTitleColor(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), for: .normal)
            
            self.reviewProgress.backgroundColor = #colorLiteral(red: 0.6622378826, green: 0.7073667645, blue: 0.7450630069, alpha: 1)
            self.reviewBtn.setTitleColor(#colorLiteral(red: 0.6622378826, green: 0.7073667645, blue: 0.7450630069, alpha: 1), for: .normal)
            self.layoutSubviews()
            self.layoutIfNeeded()
        })
    }
    
    
    func animateReviewBtn(){
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .showHideTransitionViews, animations: {[weak self] in
            guard let self = self else {return}
                self.reviewProgress.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
                self.reviewBtn.setTitleColor(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), for: .normal)
                
                self.descriptionProgress.backgroundColor = #colorLiteral(red: 0.6622378826, green: 0.7073667645, blue: 0.7450630069, alpha: 1)
                self.descriptionBtn.setTitleColor(#colorLiteral(red: 0.6622378826, green: 0.7073667645, blue: 0.7450630069, alpha: 1), for: .normal)
               self.layoutSubviews()
            self.layoutIfNeeded()
        })
    }
}
