//
//  AddViewController.swift
//  SpendWise
//
//  Created by ya su on 2023-03-24.
//

import UIKit

class AddViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    let categoryLabel: [String] = ["Cloth", "Groceries", "Gas", "Gym", "Restaurant", "Vacation", "Rent", "Transport", "Gift", "Phone", "Entertainment"]
    
    
    let categoryIcon = ["cloth", "groceries", "gas", "gym", "restaurant", "vacation", "rent", "transport", "gift", "phone", "entertainment"]


    
    
    @IBOutlet var lbAmount : UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var amountLabel: UILabel!
    
    var selectedCategory : String = "Cloth"
    var selectedDateOfBirth : String = ""
    var amount: Double = 0.0
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    let dateFormatter = DateFormatter()

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CollectionViewCell
        cell.CategoryImageView.image = UIImage(named: categoryIcon[indexPath.row])
        cell.CategoryNameLabel.text = categoryLabel[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = categoryLabel[indexPath.row]
        print(selectedCategory)
    }

    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func addTransaction(sender : Any){
        let transaction : TransactionData = TransactionData.init()
        transaction.initWithData(theRow: 0, theDate: selectedDateOfBirth, theCategory: selectedCategory, theAmount: lbAmount.text!, theType: "Expense", theDescriptions: "N/A", theBalance: "0")
        
        let returnCode = mainDelegate.insertIntoDatabase(transcation: transaction)
        
        var returnMSG : String = "Transaction Added"
        if returnCode == false {
            returnMSG = "Transaction add failed"
        }
        
        let alertController = UIAlertController(title: "SQLite add", message: returnMSG, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
    }
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        view.backgroundColor = .white
//        //navigationBar.delegate = nil
//
//        categoryCollectionView.delegate = self
//        categoryCollectionView.dataSource = self
//
//        // Create the date picker
//        datePicker.datePickerMode = .date
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
//        datePicker.isHidden = true // Hide the date picker initially
//
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//    }
    
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
            let tag = sender.tag
            switch tag {
            case -1:
                // Delete button pressed
                amount = 0
                amountLabel.text = String(format: "$%.2f", amount)

            case 0...9:
                // Number button pressed
                let digit = Double(tag)
                if amount == 0 {
                    amount = digit / 100
                } else {
                    amount = amount * 10 + digit / 100
                }
                amountLabel.text = String(format: "$%.2f", amount)
            default:
                break
            }
        }
    

    @IBAction func okPressed(_ sender: Any) {
        // Perform action with amount
    }
    
    @IBAction func calanderPressed(_ sender: UIButton) {
        
            // Set the frame for the date picker
            datePicker.frame = CGRect(x: 0, y: view.frame.height - 216, width: view.frame.width, height: 216)
            
            // Unhide the date picker
            datePicker.isHidden = false
        
       }
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker){
        let selectedDate = sender.date
        selectedDateOfBirth = dateFormatter.string(from: selectedDate)
        
    }
    
//    @IBAction func calanderPressed(sender : UIButton){
//        // Create the date picker
//            let datePicker = UIDatePicker()
//            datePicker.datePickerMode = .date
//            datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
//
//            // Create the alert controller
//            let alertController = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
//            alertController.view.addSubview(datePicker)
//
//            // Create the OK action
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
//                // Update the label with the selected date
//                self.dateFormatter.dateFormat = "MMM dd, yyyy"
//                self.selectedDateOfBirth = self.dateFormatter.string(from: datePicker.date)
//            })
//            alertController.addAction(okAction)
//
//            // Create the cancel action
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//            alertController.addAction(cancelAction)
//
//            // Present the alert controller
//            present(alertController, animated: true, completion: nil)
//    }
    
    @IBAction func onePressed(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    @IBAction func twoPressed(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    @IBAction func threePressed(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    
    @IBAction func fourPressed(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    
    @IBAction func fivePressed(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    
    @IBAction func sixPressed(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    
    
    @IBAction func sevenPressed(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    
    @IBAction func eightPressed(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    @IBAction func ninePressed(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        //navigationBar.delegate = nil
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        // Create the date picker
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
        datePicker.isHidden = true // Hide the date picker initially
  
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    
    
    
    
}

