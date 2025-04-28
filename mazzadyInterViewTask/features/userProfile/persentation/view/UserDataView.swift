//
//  UserDataView.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 26/04/2025.
//

import Foundation
import UIKit
class UserDataView: UIView{
    
    @IBOutlet weak var userNameLabel: UILabel!
   
    @IBOutlet weak var emailLabel: UILabel!
      @IBOutlet weak var countryLabel: UILabel!
      @IBOutlet weak var cityLabel: UILabel!
      @IBOutlet weak var followersCountLabel: UILabel!
      @IBOutlet weak var followingCountLabel: UILabel!
      @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
           super.awakeFromNib()
           setupUserImageView()
       }
       
       private func setupUserImageView() {
           userImageView.layer.cornerRadius = userImageView.frame.size.width / 4
           userImageView.layer.masksToBounds = true
       }
}
