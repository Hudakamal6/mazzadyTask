//
//  TagCellCollectionViewCell.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import UIKit

class TagCell: UICollectionViewCell {
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 9
        contentView.layer.borderWidth = 0.3
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.masksToBounds = true
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
        ])
    }
    
    func configure(with text: String, isSelected: Bool) {
        label.text = text
        if isSelected {
            contentView.backgroundColor = UIColor.orange.withAlphaComponent(0.03)
            contentView.layer.borderColor = UIColor.orange.cgColor
            label.textColor = .orange
            label.font = UIFont(name: "Nunito-Bold", size: 12)
            contentView.layer.borderWidth = 1
        } else {
            label.font = UIFont(name: "Nunito", size: 12)
            contentView.layer.borderWidth = 0.3
            contentView.layer.borderColor = UIColor.lightGray.cgColor
            contentView.backgroundColor = .white
            label.textColor = .black
        }
    }
}
