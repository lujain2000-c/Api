//
//  DeckOfCardsApi.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 10/11/1444 AH.

    

import SwiftUI

struct Poke: Codable,Identifiable{
    //let id: String
    let id: UUID
    var name: String
    let logo: String
    
}

struct DeckOfCardsApi: View {
    @State var pokes = [Poke]()
    
    var body: some View {
        VStack {
            
            List($pokes){ poke in
                VStack{
//                    Text(poke.name)
//                        .bold()
//                        .foregroundColor(.green)
//                   
//                    Text(poke.url)
                  
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
        guard let url = URL(string: "https://api.tcgdex.net/v2/en/sets")
        else{
            print("error")
            return
        }
    
        do{
            let (data, _) = try await  URLSession.shared.data(from: url)
        
            print("ggg")
            
            do {
                let serverPoke = try JSONDecoder().decode([Poke].self, from: data)
                
               // holidays = serverHoliday
                pokes = serverPoke
                
            } catch {
                print(error)
            }
        
        } catch{
            print(error)
        }
    }
    
}


struct DeckOfCardsApi_Previews: PreviewProvider {
    static var previews: some View {
        DeckOfCardsApi()
    }
}
