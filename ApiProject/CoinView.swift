//
//  CoinView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 10/11/1444 AH.
//

import SwiftUI
struct Data: Codable{
    var data: [Coin]

}
struct Coin: Codable {
//    var id: String {
//        date
//    }
  var id: String
  var rank: String
  var symbol: String
 var name: String

}

struct CoinView: View {
    @State var coins = [Coin]()
 
     var body: some View {
         VStack {
 
             List(coins,id: \.rank){ coin in
                 VStack{
                     Text(coin.symbol)
                         .bold()
                         .foregroundColor(.green)
 
                     Text("\(coin.rank)")
                     Text(coin.name)
                  
 
                     //  Text(quote.author)
 
 
 
                 }
 
 
             }
             .task{
                 await loadData()
             }
 
         }
     }
     func loadData() async {
         guard let url = URL(string: "https://api.coincap.io/v2/assets")
         else{
             print("error")
             return
         }
 
         do{
             let (data, _) = try await  URLSession.shared.data(from: url)
//             let x = String(data: data, encoding: .utf8)
//             print(  " \(x)kkkkkkkkkkkkk")
 
             do {
                 let serverCoin = try JSONDecoder().decode(Data.self, from: data)
 
                 coins = serverCoin.data
                // self.holidays = serverHoliday.events.title

             } catch {
                 print(error)
             }
 
         } catch{
             print(error)
         }
     }
 
 }

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView()
    }
}
