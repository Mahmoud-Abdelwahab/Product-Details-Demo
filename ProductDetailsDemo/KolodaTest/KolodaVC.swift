//
//  KolodaVC.swift
//  ProductDetailsDemo
//
//  Created by Mahmoud Abdul-Wahab on 29/09/2021.
//

import UIKit
import Koloda

class KolodaVC: UIViewController {
    @IBOutlet weak var kolodaView: KolodaView!
    
    var images = [UIImage(named: "1") ,UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) {
            [weak self] _ in
            guard let self = self else {return}
            print("Timer fired!")
            self.kolodaView.swipe(.left)
          //  self.images =  self.images.shifted(by: 1)
          //   self.kolodaView.resetCurrentCardIndex()
             
        }
    
        
    }
    
    @IBAction func didTapPrevBtn(_ sender: Any) {
        
    }
    
    @IBAction func didTapNextBtn(_ sender: Any) {
        kolodaView.swipe(.left)
      //  public func swipe(_ direction: SwipeResultDirection, force: Bool = false)
     
    }
}

extension KolodaVC: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
     //   koloda.revertAction(direction: .topLeft)
        //koloda.resetCurrentCardIndex()
      // kolodaView.reloadData()
     
        koloda.resetCurrentCardIndex()
    }

    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
    }
}


extension KolodaVC: KolodaViewDataSource {

    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection){
//          self.images =  self.images.shifted(by: 1)
//           self.kolodaView.resetCurrentCardIndex()
    }
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return images.count
    }

    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .moderate
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: images[index])
    }

//    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
//        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)[0] as? OverlayView
//    }
    
}


extension Array {

    func shifted(by shiftAmount: Int) -> Array<Element> {

        // 1
        guard self.count > 0, (shiftAmount % self.count) != 0 else { return self }

        // 2
        let moduloShiftAmount = shiftAmount % self.count
        let negativeShift = shiftAmount < 0
        let effectiveShiftAmount = negativeShift ? moduloShiftAmount + self.count : moduloShiftAmount

        // 3
        let shift: (Int) -> Int = { return $0 + effectiveShiftAmount >= self.count ? $0 + effectiveShiftAmount - self.count : $0 + effectiveShiftAmount }

        // 4
        return self.enumerated().sorted(by: { shift($0.offset) < shift($1.offset) }).map { $0.element }

    }

}
