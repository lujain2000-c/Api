//
//  PhotoView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 11/11/1444 AH.
//

import SwiftUI
//struct Photo: Codable{
//    //let id: Int
//    let image: String
//    //let image: String
//}

struct Photo: Codable{
    let message: String
}
struct PhotoView: View {
    
    
    @State var photo = Photo(message: " ")
    
    var body: some View {
        
        ZStack{
            //Color(.black)
            //List(fruits,id: \.id){ fruit in
            List(){
                
                VStack{
//                    Text(item.name)
//                        .bold()
//                        .foregroundColor(.blue)
                    AsyncImage(url: URL(string: photo.message))
                        .frame(width: 300, height:300)
                    
                    
                }
                
                
                
                
            }
            .task{
                await loadData()
                
                
                
                
            }
        }
        
    }
    
    func loadData() async {
     
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else{
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
             let serverMakeup = try JSONDecoder().decode(Photo.self, from: data)
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

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}

