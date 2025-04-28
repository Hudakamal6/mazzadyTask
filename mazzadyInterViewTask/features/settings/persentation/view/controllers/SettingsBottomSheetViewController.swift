//
//  SettingsBottomSheetViewController.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import UIKit

class SettingsBottomSheetViewController: UIViewController {
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var languagesTable: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    private var languages = ["English", "العربية"]
       private var selectedLanguageIndex: Int?
       
       override func viewDidLoad() {
           super.viewDidLoad()
           setupViews()
       }
       
       private func setupViews() {
           view.layer.cornerRadius = 40
           view.clipsToBounds = true
           view.backgroundColor = .white
           
           languagesTable.delegate = self
           languagesTable.dataSource = self
           
           let nib = UINib(nibName: "LanguageTableviewCellTableViewCell", bundle: nil)
           languagesTable.register(nib, forCellReuseIdentifier: "LangugaeTableViewCell")
           
           languagesTable.separatorStyle = .singleLine
           languagesTable.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
           
           languagesTable.allowsSelection = true
       }
   }

   extension SettingsBottomSheetViewController: UITableViewDelegate, UITableViewDataSource {
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return languages.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

           guard let cell = tableView.dequeueReusableCell(withIdentifier: "LangugaeTableViewCell", for: indexPath) as? LanguageTableviewCellTableViewCell else {
               return UITableViewCell()
           }
           
           let language = languages[indexPath.row]
           cell.langugaeLabel.text = language
           
           cell.selectionStyle = .none
           
           if selectedLanguageIndex == indexPath.row {
               cell.radioButtonLabel.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
               cell.radioButtonLabel.tintColor = .orange
           } else {
               cell.radioButtonLabel.setImage(UIImage(systemName: "circle"), for: .normal)
               cell.radioButtonLabel.tintColor = .lightGray
           }
           
           cell.radioButtonLabel.removeTarget(nil, action: nil, for: .allEvents)
           cell.radioButtonLabel.tag = indexPath.row
           cell.radioButtonLabel.addTarget(self, action: #selector(radioButtonTapped(_:)), for: .touchUpInside)
           
           return cell
       }
       
       @objc private func radioButtonTapped(_ sender: UIButton) {
           selectedLanguageIndex = sender.tag
           languagesTable.reloadData()
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           selectedLanguageIndex = indexPath.row
           languagesTable.reloadData()
       }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 60
       }
   }
