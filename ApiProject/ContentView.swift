//
//  ContentView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 09/11/1444 AH.
//



import SwiftUI

//struct Quote: Codable{
//    var quote_id: Int
//    var quote: String
//    var author: String
//}
struct Fruit: Codable{
    var id: Int
    var name: String
    var nutritions: Nutritions
}

struct Nutritions: Codable{
    var calories: Double
    var fat: Double
    var sugar: Double
    var carbohydrates: Double
    var protein: Double
}
struct ContentView: View {
    @State var fruits = [Fruit]()
  
    var body: some View {
        VStack {
            
            List(fruits,id: \.id){ fruit in
                VStack{
                    Text(fruit.name)
                        .bold()
                        .foregroundColor(.blue)
                    VStack{
                        Text("Calories: \(fruit.nutritions.calories)")
                        Text("Fat: \(fruit.nutritions.fat)")
                        Text("Sugar: \(fruit.nutritions.sugar)")
                        Text("Carbohydrates: \(fruit.nutritions.carbohydrates)")
                        Text("Protein: \(fruit.nutritions.protein)")
                    }.font(.footnote)
                  //  Text(quote.author)

                 
                    
                }
              
                
            }
            .task{
                await loadData()
        }
       
        }
    }
        func loadData() async {
         //   "https://www.breakingbadapi.com/api/quotes"
            guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all") else{
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
                    if let serverFruit = try? JSONDecoder().decode([Fruit ].self, from: data){
                        fruits = serverFruit
                        //print(serverMenu)
                    }
                }catch{
                    print("bad new not valid")
                }
            }
            
        }




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
