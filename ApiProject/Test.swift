//
//  Test.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 11/11/1444 AH.
//
//import SwiftUI
//struct X: Codable{
//   //let id: Int
//   let recovered: Cases
////    //let image: String
//}
//struct Cases: Codable{
//    let date: Int
//    
//    private enum CodingKeys: String, CodingKey {
//           
//           case date = "1/22/20"
//          
//       }
//    
//   
//}
//
//struct Test: View {
//
//    @State var x = Cases(date: 0)
//    
//    var body: some View {
//        
//        ZStack{
//            //Color(.black)
//            //List(fruits,id: \.id){ fruit in
//            List(){ 
//                
//                VStack{
//                   Text(" Those who recovered from COVID-19 on 1/22/20: ")
//                        .font(.callout)
//                    Text(" \(x.date)")
//                        .bold()
//                        .foregroundColor(.blue)
//                 //   AsyncImage(url: URL(string: x))
//                   //     .frame(width: 500, height:500)
//                    
//                    
//                }
//                
//                
//                
//                
//            }
//            .task{
//                await loadData()
//                
//                
//                
//                
//            }
//        }
//        
//    }
//    
//    func loadData() async {
//     
//        guard let url = URL(string: "https://disease.sh/v3/covid-19/historical/all?lastdays=all") else{
//            print("error")
//            return
//        }
//        // var request = URLRequest(url: url)
//        //  request.setValue("apikey", forHTTPHeaderField: <#T##String#>)
//        
//        // URLSession.shared.dataTask(with: url) {
//        //  (data, response, error) in
//        do{
//            let (data, _) = try await  URLSession.shared.data(from: url)
//            // if let data = data{
//            do{
//             let serverMakeup = try JSONDecoder().decode(X.self, from: data)
//                x = serverMakeup.recovered
//                //print(serverMenu)
//            }catch{
//                print(error)
//            }
//        }catch{
//            print(error)
//        }
//    }
//}
//
//struct Test_Previews: PreviewProvider {
//    static var previews: some View {
//        Test()
//    }
//}


