//
//  Test1ViewController.swift
//  MAD_Ind04_Sosa_Aaron
//
//  Created by Nicole Sosa on 4/7/22.
//


// this was an attmept from a downloaded api and handler, adnan-tech way
import UIKit
import SwiftUI

class Test1ViewController: UIViewController {
    
@State var models: [Table] = []
    
    var body: some View{
        VStack{
            List (self.models) {(model) in
                HStack{
                    Text(model.name ?? "").bold()
                    Text(model.nickname ?? "")
                }
            }
            
        }.onAppear(perform: {
        
            guard let url = URL(string: "https://cs.okstate.edu/~aasosa/improve.php") else{
                print ("Invalid URL")
                return
            }
            
            var urlRequest: URLRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            URLSession.shared.dataTask(with: urlRequest , completionHandler: { (data , response, error) in
                
                guard let data = data else{
                    print("No data recieved")
                    return
                }
                
                do{
                    self.models = try JSONDecoder().decode([Table].self, from:data)
               //     print(json)
                } catch let error as NSError {
                    print("Error serializing JSON Data: \(error)")
                }
                
            })
        }
            )
        }
    
    class Table: Codable, Identifiable {
        var name: String? = ""
        var nickname: String? = ""
    }

}
