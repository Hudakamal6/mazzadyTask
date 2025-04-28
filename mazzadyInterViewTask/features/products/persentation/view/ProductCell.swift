//
//  ProductCell.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productOfferPriceLabel: UILabel!
    
    @IBOutlet weak var productOfferPrice: UILabel!
    
    @IBOutlet weak var productBasePrice: UILabel!
    
    @IBOutlet weak var lotsStartsInLabel: UILabel!
    
    @IBOutlet weak var daysView: UIView!
    
    @IBOutlet weak var hoursView: UIView!
    
    @IBOutlet weak var monthsView: UIView!
    
    @IBOutlet weak var offerDays: UILabel!
    
    @IBOutlet weak var offerHours: UILabel!
    
    @IBOutlet weak var offerMintues: UILabel!
    
 
    // MARK: - Properties
    private var timer: Timer?
    private var remainingSeconds: TimeInterval = 0
    private var currentProduct: ProductEntity?
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        timer?.invalidate()
        timer = nil
        remainingSeconds = 0
        currentProduct = nil
    }
    
    // MARK: - Configuration
    func configure(with product: ProductEntity) {
        currentProduct = product
        remainingSeconds = product.endDate ?? 0
        
        setupUI()
        updateProductInfo()
        updateCountdown()
        startCountdownTimer()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        mainView.layer.cornerRadius = 24
        mainView.layer.masksToBounds = false
        mainView.layer.backgroundColor = UIColor.white.cgColor
        
        productImage.layer.cornerRadius = 8
        productImage.clipsToBounds = true
        
        [daysView, hoursView, monthsView].forEach { view in
            view?.layer.cornerRadius = 14
            view?.backgroundColor = UIColor.systemGray6
        }
    }
    
    private func updateProductInfo() {
        guard let product = currentProduct else { return }
        
        // Load image
        if let url = URL(string: product.image) {
            downloadImage(from: url, into: productImage)
        }
        
        productName.text = product.name
        productPrice.text = "\(product.price) \(product.currency)"
        
        if let offer = product.offer {
            productOfferPriceLabel.isHidden = false
            productOfferPrice.isHidden = false
            productBasePrice.isHidden = false
            
            productOfferPrice.text = "\(offer) \(product.currency)"
            productBasePrice.attributedText = NSAttributedString(
                string: "\(product.price) \(product.currency)",
                attributes: [
                    .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                    .foregroundColor: UIColor.systemRed
                ]
            )
        } else {
            productOfferPriceLabel.isHidden = true
            productOfferPrice.isHidden = true
            productBasePrice.isHidden = true
        }
    }
    
    // MARK: - Countdown Timer
    private func startCountdownTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            self.remainingSeconds -= 1
            
            self.updateCountdown()
            
            if self.remainingSeconds <= 0 {
                self.timer?.invalidate()
                self.hideTimerViews()
            }
        }
    }
    
    private func updateCountdown() {
        guard remainingSeconds > 0 else {
            hideTimerViews()
            return
        }
        
        let (days, hours, minutes, seconds) = breakDownSeconds(remainingSeconds)
        
        DispatchQueue.main.async {
            // Update UI with remaining time
            self.offerDays.text = "\(days)"
            self.offerHours.text = "\(hours)"
            self.offerMintues.text = "\(seconds)"
           
            
            // Show the countdown UI
            self.lotsStartsInLabel.isHidden = false
            self.daysView.isHidden = false
            self.hoursView.isHidden = false
            self.monthsView.isHidden = false
        }
    }
    
    private func breakDownSeconds(_ seconds: TimeInterval) -> (days: Int, hours: Int, minutes: Int, seconds: Int) {
        let days = Int(seconds / 86400)
        let remainingAfterDays = seconds.truncatingRemainder(dividingBy: 86400)
        
        let hours = Int(remainingAfterDays / 3600)
        let remainingAfterHours = remainingAfterDays.truncatingRemainder(dividingBy: 3600)
        
        let minutes = Int(remainingAfterHours / 60)
        let seconds = Int(remainingAfterHours.truncatingRemainder(dividingBy: 60))
        
        return (days, hours, minutes, seconds)
    }
    
    private func hideTimerViews() {
        DispatchQueue.main.async {
            self.lotsStartsInLabel.isHidden = true
            self.daysView.isHidden = true
            self.hoursView.isHidden = true
            self.monthsView.isHidden = true
        }
    }
    
    // MARK: - Image Loading
    private func downloadImage(from url: URL, into imageView: UIImageView) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error downloading image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
