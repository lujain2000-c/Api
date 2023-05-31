//
//  FoodView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 10/11/1444 AH.
//
// 6bfdca9f4a7347c5a2ec295e7161aef4
import SwiftUI

//struct Food: Codable{
//    let menuItems: [Menu]
//
//}
//
//struct Menu: Codable{
//    let id: Int
//    let title: String
//    let restaurantChain: String
//    let image: String
//}
//
//struct FoodView: View {
//    @State var items = [Menu]()
//    var body: some View {
//        VStack {
//
//            List(items,id: \.id){ item in
//                VStack{
//                    Text(item.title)
//                        .bold()
//                        .foregroundColor(.green)
//
//                    Text("\(item.restaurantChain)")
//                    Text(item.image)
//
//                }
//
//
//            }
//            .task{
//                await loadData()
//            }
//
//        }
//    }
//
//    func loadData() async {
//        guard let url = URL(string: "https://api.spoonacular.com/food/menuItems/search?query=burger&number=2")
//        else{
//            print("error")
//            return
//        }
//
//
//            var request = URLRequest(url: url)
//            request.setValue("6bfdca9f4a7347c5a2ec295e7161aef4", forHTTPHeaderField: "apikey")
//
//
//        do{
//                //  let serverMenu = try JSONDecoder().decode(Food.self, from: data)
//               // URLSession.shared.dataTask(with: request) { (data, _, _) in
//           // let (data, _) = try await URLSession.shared.dataTask(with: request)
//            let task = try URLSession.shared.dataTask(with: request) {(data, response, error) in
//                guard let data = data else { return }
//
//                let serverMenu = try JSONDecoder().decode(Food.self, from: data)
//                items = serverMenu.menuItems
//            }
//                //}.resume()
//
//
//
//
//
//        }catch{
//            print(error)
//        }
//    }
//
//}
//
//struct FoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodView()
//    }
//}
