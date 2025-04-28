//
//  switchButtonsView.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import UIKit

class switchButtonsView: UIView {

    // MARK: - Outlets
     @IBOutlet weak var productsButton: UIButton!
     @IBOutlet weak var reviewsButton: UIButton!
     @IBOutlet weak var followersButton: UIButton!

     @IBOutlet weak var buttonsStackView: UIStackView! 
     
     private let underlineView = UIView()
    let selectedColor = UIColor(red: 210/255, green: 6/255, blue: 83/255, alpha: 1.0)

     // MARK: - Init
     override func awakeFromNib() {
         super.awakeFromNib()
         setupUI()
     }
     
     private func setupUI() {

         
         
         setupUnderline()

     }
     
     private func setupUnderline() {
         underlineView.backgroundColor = selectedColor

         addSubview(underlineView)
         
         layoutIfNeeded()
         moveUnderline(to: productsButton)
     }

     // MARK: - Actions
     @IBAction func productsTapped(_ sender: UIButton) {
         selectButton(productsButton)
     }
     
     @IBAction func reviewsTapped(_ sender: UIButton) {
         selectButton(reviewsButton)
     }
     
     @IBAction func followersTapped(_ sender: UIButton) {
         selectButton(followersButton)
     }
     
    private func selectButton(_ selectedButton: UIButton) {
        

        
    }

     
     private func moveUnderline(to button: UIButton) {
         UIView.animate(withDuration: 0.3) {
             self.underlineView.frame = CGRect(
                 x: button.frame.origin.x + 10,
                 y: button.frame.maxY ,
                 width: button.frame.width * 0.7,
                 height: 2
             )
         }
     }
 }
