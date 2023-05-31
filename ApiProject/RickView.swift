//
//  RickView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 10/11/1444 AH.
//
 

import SwiftUI
struct Rick: Codable{
    let name: String
    let image: String
}


import SwiftUI

struct RickView: View {
    @State var rick = Rick(name: " ", image: " ")
  
    var body: some View {
        
            ZStack{
                //Color(.black)
                //List(fruits,id: \.id){ fruit in
                List(){
                    VStack{
                        Text(rick.name)
                            .bold()
                            .foregroundColor(.blue)
                        AsyncImage(url: URL(string: rick.image))
                            .frame(width: 300, height:300)
                        
                            
                    }
                    

                     
                        
                    }
                .task{
                    await loadData()
                  
                    
                
                
            }
        }
       
        }
    
        func loadData() async {
         //   "https://www.breakingbadapi.com/api/quotes"
            guard let url = URL(string: "https://rickandmortyapi.com/api/character/108") else{
                print("error")
                return
            }
           // var request = URLRequest(url: url)
          //  request.setValue("apikey", forHTTPHeaderField: <#T##String#>)
         
           // URLSession.shared.dataTask(with: url) {
              //  (data, response, error) in
                do{
                    let (data, _) = try await  URLSession.shared.data(from: url)
                  // if let data = data{
                    if let serverRick = try? JSONDecoder().decode(Rick.self, from: data){
                        rick = serverRick
                        //print(serverMenu)
                    }
                }catch{
                    print(error)
                }
            }
}

struct RickView_Previews: PreviewProvider {
    static var previews: some View {
        RickView()
    }
}
