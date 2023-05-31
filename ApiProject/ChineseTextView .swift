//
//  ChineseTextView .swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 11/11/1444 AH.
//

import SwiftUI

struct Word: Codable{
    let words: [Chinese]
}

struct Chinese: Codable{
    let id: String
    let entrytype: String
    let headword: String
    
}

struct ChineseTextView_: View {//Chinese Text 
    @State var texts = [Chinese]()
    
    var body: some View {
        VStack {
            
            List(texts,id: \.id){ text in
                VStack{
                    Text(text.entrytype)
                        .bold()
                        .foregroundColor(.green)
                    Text(text.headword)
                
                    
                    //  Text(quote.author)
                    
                    
                    
                }
                
                
            }
            .task{
                await loadData()
            }
            
        }
    }
    func loadData() async {
       
        guard let url = URL(string: "https://api.ctext.org/getdictionaryheadwords")
        else{
            print("error")
            return
        }
    
        do{
            let (data, response) = try await  URLSession.shared.data(from: url)
        
            print(response)
            
            do {
                let serverHoliday = try JSONDecoder().decode(Word.self, from: data)
                
                texts = serverHoliday.words
                
            } catch {
                print(error)
            }
        
        } catch{
            print(error)
        }
    }
    
}

struct ChineseTextView__Previews: PreviewProvider {
    static var previews: some View {
        ChineseTextView_()
    }
}
