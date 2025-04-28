//
//  AdsView.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import UIKit

class AdsView: UIView {

    @IBOutlet weak var adsTableView: UITableView!

    var adsViewModel: AdvertisementViewModel? {
            didSet {
                adsViewModel?.onDataUpdated = { [weak self] in
                    self?.adsTableView.reloadData()
                }
            }
        }

        override func awakeFromNib() {
            super.awakeFromNib()
            setupTableView()
        }

        private func setupTableView() {
            adsTableView.delegate = self
            adsTableView.dataSource = self
            adsTableView.register(UINib(nibName: "AdsTableViewCell", bundle: nil), forCellReuseIdentifier: "AdsCell")
        }
    }

extension AdsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adsViewModel?.numberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdsCell", for: indexPath) as! AdsTableViewCell
        if let ad = adsViewModel?.advertisement(at: indexPath.row) {
            cell.configure(with: ad)
        }
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

   
}
