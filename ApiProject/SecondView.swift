//
//  SecondView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 10/11/1444 AH.
//
import SwiftUI


struct Holidays: Codable, Identifiable {
    var id: String {
        date
    }
    let date: String
    let localName: String
    let name: String
}




struct SecondView: View {
    @State var holidays = [Holidays]()
    
    var body: some View {
        VStack {
            
            List(holidays){ holiday in
                VStack{
                    Text(holiday.localName)
                        .bold()
                        .foregroundColor(.green)
                    Text(holiday.name)
                    Text(holiday.date)
                    
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
        //            //airport-web.appspot.com/_ah/api
        guard let url = URL(string: "https://date.nager.at/api/v2/publicholidays/2020/US")
        else{
            print("error")
            return
        }
    
        do{
            let (data, response) = try await  URLSession.shared.data(from: url)
        
            print(response)
            
            do {
                let serverHoliday = try JSONDecoder().decode([Holidays].self, from: data)
                
                holidays = serverHoliday
                
            } catch {
                print(error)
            }
        
        } catch{
            print(error)
        }
    }
    
}


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
