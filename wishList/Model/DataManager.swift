//
//  dataManager.swift
//  wishList
//
//  Created by 송정훈 on 4/12/24.
//

import CoreData
import UIKit

class DataManager{
//    static var saveProduct : [Product] = []
    
    var persistent : NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    func saveData(product: Product) {
//        DataManager.saveProduct.append(product)
        guard let context = self.persistent?.viewContext else {return}
        let newPd = Wishproduct(context: context)
        newPd.id = product.id
        newPd.title = product.title
        newPd.price = product.price
        newPd.descriptionS = product.description
        newPd.thumbnail = product.thumbnail
        try? context.save()
    }
    
    func readData() -> [Product] {
        var read : [Product] = []
        guard let context = self.persistent?.viewContext else
        { return []}
        let request = Wishproduct.fetchRequest()
        let loadData = try? context.fetch(request)
        for i in loadData! {
            read.append(Product(id: i.id, title: i.title!, description: i.descriptionS!, price: i.price, thumbnail: i.thumbnail!))
        }
        return read
    }
    
    func deleteData(num : Int) {
        
        guard let context = self.persistent?.viewContext else
        { return }
        let request = Wishproduct.fetchRequest()
        guard let loadData = try? context.fetch(request) else {return}
        
        let filtered = loadData[num]
        context.delete(filtered)
        try? context.save()
    }
    
    
}
