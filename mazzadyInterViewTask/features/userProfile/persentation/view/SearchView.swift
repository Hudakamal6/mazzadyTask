//
//  SearchView.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import UIKit

protocol SearchViewDelegate: AnyObject {
    func didUpdateSearchQuery(_ query: String)
}
class SearchView: UIView {
    @IBOutlet weak var sendButton: UIButton!

    @IBOutlet weak var searchTextField: UITextField!
    
    weak var delegate: SearchViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        setupSearchTextField()
    }
    
   
      
    private func setup() {
        sendButton.layer.cornerRadius = sendButton.frame.height / 3
        sendButton.clipsToBounds = true
        sendButton.isEnabled = false
        
        searchTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc private func textDidChange() {
        delegate?.didUpdateSearchQuery(searchTextField.text ?? "")
        
    }
}

extension SearchView :UITextFieldDelegate {
    private func setupSearchTextField() {
           searchTextField.delegate = self
       }
    
    // MARK: - UITextFieldDelegate

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Search" {
            textField.text = ""
        }
    }
    
}
