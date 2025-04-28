//
//  LanguageTableviewCellTableViewCell.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import UIKit

class LanguageTableviewCellTableViewCell: UITableViewCell {
    @IBOutlet weak var radioButtonLabel: UIButton!
    
    @IBOutlet weak var langugaeLabel: UILabel!
    override func awakeFromNib() {
            super.awakeFromNib()
            setupUI()
        }

        private func setupUI() {

        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
    @IBAction func radioButtonAction(_ sender: Any) {
    }
}
