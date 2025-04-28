//
//  CustomTabBar.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import UIKit

class CustomTabBar: UITabBar {
    private var middleButton: UIButton?
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 91
        return sizeThatFits
    }
    
    func setupMiddleButton() {
        let middleButton = UIButton(type: .custom)
        let buttonSize: CGFloat = 45
        middleButton.frame = CGRect(x: (self.bounds.width - buttonSize) / 2,
                                  y: -buttonSize / 3,
                                  width: buttonSize,
                                  height: buttonSize + 4)
        middleButton.layer.shadowColor = UIColor(red: 210/255, green: 6/255, blue: 83/255, alpha: 1.0).cgColor
                middleButton.layer.shadowOffset = CGSize(width: 0, height: 4)
                middleButton.layer.shadowOpacity = 0.4
                middleButton.layer.shadowRadius = 8
        middleButton.backgroundColor = UIColor(red: 210/255, green: 6/255, blue: 83/255, alpha: 1.0)
        middleButton.layer.cornerRadius = 9
        middleButton.setImage(UIImage(named: "shop"), for: .normal)
        middleButton.addTarget(self, action: #selector(middleButtonAction), for: .touchUpInside)
        
        self.addSubview(middleButton)
        self.middleButton = middleButton
    }
    
    @objc private func middleButtonAction() {
        NotificationCenter.default.post(name: NSNotification.Name("MiddleButtonTapped"), object: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        middleButton?.frame.origin.y = 10
    }
}
