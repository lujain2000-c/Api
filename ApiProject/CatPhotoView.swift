//
//  CatPhotoView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 11/11/1444 AH.
//

import SwiftUI
struct CatPhoto: Codable{
    let url: String
}

struct CatPhotoView: View {
    
    @State var photo = CatPhoto(url: " ")
    
    var body: some View {
        
        ZStack{
            //Color(.black)
            //List(fruits,id: \.id){ fruit in
            List(){
                
                VStack{
//                    Text(item.name)
//                        .bold()
//                        .foregroundColor(.blue)
                    AsyncImage(url: URL(string: photo.url))
                        .frame(width: 300, height:200)
                    
                    
                }
                
                
                
                
            }
            .task{
                await loadData()
                
                
                
                
            }
        }
        
    }
    
    func loadData() async {
     
        guard let url = URL(string: "https://randombig.cat/roar.json") else{
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
            do{
             let serverMakeup = try JSONDecoder().decode(CatPhoto.self, from: data)
                photo = serverMakeup
                //print(serverMenu)
            }catch{
                print(error)
            }
        }catch{
            print(error)
        }
    }
}

struct CatPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        CatPhotoView()
    }
}

