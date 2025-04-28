//
//  SettingView.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import UIKit

protocol SettingViewDelegate: AnyObject {
    func settingsButtonTapped()
}
class SettingView: UIView {

    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var settingsImage: UIImageView!
   
    weak var delegate: SettingViewDelegate?

        override func awakeFromNib() {
            super.awakeFromNib()
            setupTapGesture()
        }
        
        private func setupTapGesture() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(settingsImageTapped))
            settingsImage.isUserInteractionEnabled = true
            settingsImage.addGestureRecognizer(tapGesture)
        }
        
        @objc private func settingsImageTapped() {
            delegate?.settingsButtonTapped()
        }
    }

