//
//  MakeupView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 10/11/1444 AH.
//

import SwiftUI
struct Makeup: Codable{
    //let id = UUID()
    let name: String
}

struct MakeupView: View {
    @State var makeup = Makeup(name: " ")
  
    var body: some View {
        
            VStack{
              
                List(){
                    
                    Text(makeup.name)
                        .bold()
                        .foregroundColor(.blue)
                }
                .task{
                    await loadData()
                }
        }
       
        }
    
        func loadData() async {
        
            guard let url = URL(string: "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline") else{
                print("error")
                return
            }
           
                do{
                    let (data, _) = try await  URLSession.shared.data(from: url)
                  // if let data = data{
                    if let serverMakeup = try? JSONDecoder().decode(Makeup.self, from: data){
                        makeup = serverMakeup
                        //print(serverMenu)
                    }
                }catch{
                    print(error)
                }
            }
}

struct MakeupView_Previews: PreviewProvider {
    static var previews: some View {
        MakeupView()
    }
}
