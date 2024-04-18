//
//  ViewController.swift
//  wishList
//
//  Created by 송정훈 on 4/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    var datamanager = DataManager()
    var tmp = Product(id: 0, title: "", description: "", price: 0.0, thumbnail: "")
    
    @IBOutlet var descLbl: UILabel?
    @IBOutlet var titleLbl: UILabel?
    @IBAction func saveBtn(_ sender: Any) {
        datamanager.saveData(product: tmp)
    }
    @IBAction func otherProduct(_ sender: Any) {
        fetchRemoteProduct()
    }
    
    @IBOutlet var productImage: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchRemoteProduct()
    }
    
    
    private func fetchRemoteProduct(){ // 1 ~ 100 사이의 랜덤한 Int 숫자를 가져옵니다.
        let productID = Int.random(in: 1 ... 100) // URLSession을 통해 RemoteProduct를 가져옵니다.
        if let url = URL(string: "https://dummyjson.com/products/\(productID)") { 
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data { 
                    do { // product를 디코드하여, currentProduct 변수에 담습니다.
                        let product = try JSONDecoder().decode(Product.self, from: data)
                        self.tmp = product
                        self.imageDownload(self.tmp.thumbnail)
                        DispatchQueue.main.async {
                            self.descLbl?.text = self.tmp.description
                            self.titleLbl?.text = self.tmp.title
                        }
                        
                    } catch {
                        print("Decode Error: \(error)")
                    }
                }
            } // 네트워크 요청 시작 
            task.resume()
        }
        
    }
    
    func imageDownload(_ thumbnail : String) {
        if let url = URL(string: thumbnail) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                }else if let data = data {
                    DispatchQueue.main.async() {
                        self.productImage?.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
        }
    }
}
