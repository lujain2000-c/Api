//
//  Covid19View.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 11/11/1444 AH.
//
import SwiftUI

struct Covid19: Codable{
   
   let recovered: Cases

}
struct Cases: Codable{
    let date: Int
    
    private enum CodingKeys: String, CodingKey {
           
           case date = "1/22/20"
          
       }
    
   
}

struct Covid19View: View {

    @State var covid = Cases(date: 0)
    
    var body: some View {
           
            List(){
                
                VStack{
                   Text(" Those who recovered from COVID-19 on 1/22/20: ")
                        .font(.callout)
                    Text(" \(covid.date)")
                        .bold()
                        .foregroundColor(.blue)
                 
                    
                }
              
            }
            .task{
                await loadData()
                
            }
    }
    
    func loadData() async {
     
        guard let url = URL(string: "https://disease.sh/v3/covid-19/historical/all?lastdays=all") else{
            print("error")
            return
        }
     
        do{
            let (data, _) = try await  URLSession.shared.data(from: url)
            
            do{
             let serverMakeup = try JSONDecoder().decode(Covid19.self, from: data)
                covid = serverMakeup.recovered
               
            }catch{
                print(error)
            }
        }catch{
            print(error)
        }
    }
}

struct Covid19View_Previews: PreviewProvider {
    static var previews: some View {
        Covid19View()
    }
}
