//
//  ViewController.swift
//  EcommerceDemo
//
//  Created by Ahmed Amer on 25/11/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var productData:ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func loadJson() {
           if let path = Bundle.main.path(forResource: "EcommerceJson", ofType: "json") {
               do {
                   let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                   let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                   let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                   let jsonDecoder = JSONDecoder()
                   jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                   productData = try jsonDecoder.decode(ProductModel.self, from: jsonData)
                   
                 } catch {
                      // handle error
                 }
           }
       }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData?.response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductsTableViewCell else {
            return UITableViewCell()}
        return cell
    }
    
}

