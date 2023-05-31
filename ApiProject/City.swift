//
//  City.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 11/11/1444 AH.
//

import SwiftUI

struct Cites: Codable{
    let name: String
    let country: String
}

struct City: View {
    @State var cites = Cites(name: " ", country: " ")
    var body: some View {
        VStack{
            List(){
                Text(cites.name)
                Text(cites.country)
                
            }.task{
                await loadData()
            }
        }
    }
    func loadData() async {
       
       guard let url = URL(string: "https://api.api-ninjas.com/v1/city?name=San Francisco")
        else{
            print("error")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("7CUX/CdLOC/L3W23jUykWQ==Z6mcz0C89Ix9WT28", forHTTPHeaderField: "X-Api-Key")
        do{
       // let task = try URLSession.shared.dataTask(with: request) {(data, response, error) in
          //  guard let data = data else { return }
            
          //  print(String(data: data, encoding: .utf8))
            
          //  let apiData = try JSONDecoder().decode(Cites.self, from: data)
            //  cites = cites
      //  }
       // task.resume()
     
        
        //print("Data as String: (dataAsString)")

                 

              } catch {
                  print("Error (error)")
              }

    }
}

struct City_Previews: PreviewProvider {
    static var previews: some View {
        City()
    }
}
