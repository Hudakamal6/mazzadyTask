//
//  TagsView.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import UIKit

class TagsView: UIView {

    @IBOutlet weak var tagsCollectionView: UICollectionView!

    var tagsViewModel: TagsViewModel? {
            didSet {
                tagsViewModel?.onDataUpdated = { [weak self] in
                    self?.tagsCollectionView.reloadData()
                }
            }
        }
        
        private var selectedIndex: Int = 0
        
        override func awakeFromNib() {
            super.awakeFromNib()
            setupCollectionView()
        }
        
        private func setupCollectionView() {
            if let layout = tagsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
                layout.minimumLineSpacing = 5
                layout.minimumInteritemSpacing = 5
                layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            }
            
            tagsCollectionView.delegate = self
            tagsCollectionView.dataSource = self
            tagsCollectionView.backgroundColor = .clear
            tagsCollectionView.register(TagCell.self, forCellWithReuseIdentifier: "TagCell")
        }
    }

    extension TagsView: UICollectionViewDelegate, UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return tagsViewModel?.numberOfRows() ?? 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as? TagCell else {
                return UICollectionViewCell()
            }
            
            if let tag = tagsViewModel?.tag(at: indexPath.row) {
                cell.configure(with: tag.name, isSelected: indexPath.row == selectedIndex)
            }
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            selectedIndex = indexPath.row
            
            collectionView.reloadData()
        }
    }
