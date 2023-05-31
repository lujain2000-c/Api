//
//  MakeupView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 10/11/1444 AH.
//

//import SwiftUI
//struct Makeup: Codable{
//    //let id = UUID()
//    let name: String
//}
//
//struct MakeupView: View {
//    @State var makeup = Makeup(name: " ")
//  
//    var body: some View {
//        
//            VStack{
//                //Color(.black)
//              //  List(makeup){ item in
//               List(){
//                    
//                   Text(makeup.name)
//                            .bold()
//                            .foregroundColor(.blue)
//                      //  AsyncImage(url: URL(string: rick.image))
//                      //      .frame(width: 300, height:300)
//                       
//                    }
//                .task{
//                    await loadData()
//                }
//        }
//       
//        }
//    
//        func loadData() async {
//         //   "https://www.breakingbadapi.com/api/quotes"
//            guard let url = URL(string: "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline") else{
//                print("error")
//                return
//            }
//           // var request = URLRequest(url: url)
//          //  request.setValue("apikey", forHTTPHeaderField: <#T##String#>)
//         
//           // URLSession.shared.dataTask(with: url) {
//              //  (data, response, error) in
//                do{
//                    let (data, _) = try await  URLSession.shared.data(from: url)
//                  // if let data = data{
//                    if let serverMakeup = try? JSONDecoder().decode(Makeup.self, from: data){
//                        makeup = serverMakeup
//                        //print(serverMenu)
//                    }
//                }catch{
//                    print(error)
//                }
//            }
//}
//
//struct MakeupView_Previews: PreviewProvider {
//    static var previews: some View {
//        MakeupView()
//    }
//}
