//
//  ItemViewController.swift
//  WengZheng Mini App
//
//  Created by Jeremy Weng on 10/2/18.
//  Copyright © 2018 Jeremy Weng and Alicia Zheng. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.latitudeTextField.delegate=self
        self.longitudeTextField.delegate=self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        updateView()
    }
    
    var bucketItem: BucketItem?
    var index: Int?
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String)-> Bool{
        let allowedCharacters=CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        
    }
    func updateView() {
        guard let item = bucketItem else {return}
        nameTextField.text = item.title
        latitudeTextField.text = item.latitude
        longitudeTextField.text = item.longitude
        detailsTextField.text = item.details
        dueDatePicker.setDate(existingDate(dateString: item.date), animated: true)
    }
    
    internal func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = dueDatePicker.date
        return formatter.string(from: date)
    }
    
    internal func existingDate(dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return  formatter.date(from: dateString)!
    }
    
    // MARK: - Navigation
    
    @IBAction func cancelAddItem(_ sender: Any) {
        dismiss(animated:true, completion:nil)
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        guard let name = nameTextField.text,
            let latitude = latitudeTextField.text,
            let longitude = longitudeTextField.text,
            let details = detailsTextField.text else {return}
        bucketItem = BucketItem(title: name, latitude: latitude, longitude: longitude, details: details, date: getDate())
    }
 

}
