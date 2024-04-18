//
//  File.swift
//  wishList
//
//  Created by 송정훈 on 4/15/24.
//

import UIKit

class WishViewController : ViewController {
    
    
    @IBOutlet var wishTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let smallId = UISheetPresentationController.Detent.Identifier("small")
//        let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallId) { context in
//            return 430
//            //390
//        }
//        if let sheetPresentationController = sheetPresentationController {
//            sheetPresentationController.detents = [smallDetent ]
//            sheetPresentationController.largestUndimmedDetentIdentifier = smallId
//        }
        let nib = UINib(nibName: "WishCell", bundle: nil)
        
        wishTable.dataSource = self
        wishTable.delegate = self
        
        wishTable.register(nib, forCellReuseIdentifier: "WishCell")
    }
}


extension WishViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datamanager.readData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishCell",for: indexPath) as! WishCell
        cell.idLbl.text = String(datamanager.readData()[indexPath.row].id)
        cell.titleLbl.text = datamanager.readData()[indexPath.row].title
        cell.priceLbl.text = String(datamanager.readData()[indexPath.row].price)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            datamanager.deleteData(num: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
