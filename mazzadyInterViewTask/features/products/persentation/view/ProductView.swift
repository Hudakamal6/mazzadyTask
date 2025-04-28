//
//  ProductView.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class ProductView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var productsCollectionView: UICollectionView!

    var viewModel: ProductsViewModel? {
        didSet {
            viewModel?.onDataUpdated = { [weak self] in
                print("Products updated: \(self?.viewModel?.productList ?? [])")

                DispatchQueue.main.async {
                    self?.productsCollectionView.reloadData()
                }
            }
        }
    }

       override func awakeFromNib() {
           super.awakeFromNib()
           setupCollectionView()
       }

       
       private func setupCollectionView() {
           let nib = UINib(nibName: "ProductCell", bundle: nil)
           productsCollectionView.register(nib, forCellWithReuseIdentifier: "productCell")
           
           productsCollectionView.delegate = self
           productsCollectionView.dataSource = self
       }
       
       // MARK: - CollectionView DataSource
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return viewModel!.productList.count 
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCell else {
               return UICollectionViewCell()
           }
           
           let product = viewModel!.productList[indexPath.item]
           cell.configure(with: product)
           
           return cell
       }
       
       // MARK: - CollectionView FlowLayout
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let itemSpacing: CGFloat = 5
           let itemsPerRow: CGFloat = 3
           let totalSpacing = itemSpacing * (itemsPerRow + 1)
           
           let width = (collectionView.frame.width - totalSpacing) / itemsPerRow
           
           let product = viewModel!.productList[indexPath.item]
           let height = calculateCellHeight(for: product)
           
           return CGSize(width: width, height: height)
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 4
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 4
       }
       
       // MARK: - Helpers
       private func calculateCellHeight(for product: ProductEntity) -> CGFloat {
           let baseHeight: CGFloat = 170
           var extraHeight: CGFloat = 0
           
           if product.offer != nil {
               extraHeight += 20
           }
           
           if product.endDate != nil {
               extraHeight += 60
           }
           
           if product.offer == nil && product.endDate != nil {
               extraHeight += 20
           }
           
           return baseHeight + extraHeight
       }
   }
