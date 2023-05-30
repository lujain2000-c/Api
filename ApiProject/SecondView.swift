//
//  SecondView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 10/11/1444 AH.
//
import SwiftUI

//struct Quote: Codable{
//    var quote_id: Int
//    var quote: String
//    var author: String
//}
//struct Holidays: Codable{
//    var deck_id: String
//    var code: String
// 
//    }
//   
//
//
//
//struct SecondView: View {
//    @State var holidays = [Holidays]()
//  
//    var body: some View {
//        VStack {
//            
//            List(holidays, id: \.deck_id){ holiday in
//                VStack{
//                    Text(holiday.code)
//                        .bold()
//                        .foregroundColor(.green)
//                       
//                   
//                  //  Text(quote.author)
//
//                 
//                    
//                }
//              
//                
//            }
//            .task{
//                await loadData()
//        }
//       
//        }
//    }
//        func loadData() async {
//         //   "https://www.breakingbadapi.com/api/quotes"
//            //airport-web.appspot.com/_ah/api
//            guard let url = URL(string: "https://deckofcardsapi.com/api/deck/<<deck_id>>/shuffle/?remaining=true")
//                                else{
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
//                    if let serverMeal = try? JSONDecoder().decode([Holidays ].self, from: data){
//                        holidays = serverMeal
//                        //print(serverMenu)
//                    }
//                }catch{
//                    print("bad new not valid data")
//                }
//            }
//            
//        }
//
//
//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView()
//    }
//}
