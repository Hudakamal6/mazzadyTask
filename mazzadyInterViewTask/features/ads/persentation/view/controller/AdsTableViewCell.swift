//
//  AdsTableViewCell.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import UIKit

class AdsTableViewCell: UITableViewCell {
    @IBOutlet weak var adImage: UIImageView!
    
    private let padding: CGFloat = 8

       override func awakeFromNib() {
           super.awakeFromNib()
           
           adImage.layer.cornerRadius = 30
           adImage.layer.masksToBounds = true
           adImage.contentMode = .scaleAspectFill
           
           contentView.layer.cornerRadius = 20
           contentView.layer.masksToBounds = true
           backgroundColor = .clear

           contentView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               contentView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
               contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
               contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
               contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
           ])
       }
       
       func configure(with advertisement: Advertisement) {
           if let url = URL(string: advertisement.image) {
               downloadImage(from: url, into: adImage)
           }
       }
       
       private func downloadImage(from url: URL, into imageView: UIImageView) {
           URLSession.shared.dataTask(with: url) { data, response, error in
               guard let data = data else { return }
               DispatchQueue.main.async {
                   imageView.image = UIImage(data: data)
               }
           }.resume()
       }
   }
