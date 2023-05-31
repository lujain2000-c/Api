//
//  UniversityView.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 10/11/1444 AH.
//


import SwiftUI
struct University: Codable{
    //var id = UUID()
    var id: String {
        name
    }
    
    let country: String
    let name: String
   //
}
struct UniversityView: View {
    @State var university = University(country: " ", name: " ")
  
    var body: some View {
        VStack {
            
         //   List(university,id: \.id){ univer in
    List(){
                VStack{
                    Text(university.name)
                        .bold()
                        .foregroundColor(.blue)
                    Text(university.country)
                    
                        
                }
                

                 
                    
                }
            .task{
                await loadData()
              
                
            }
            
        }
       
        }
    
        func loadData() async {
         //   "https://www.breakingbadapi.com/api/quotes"
            guard let url = URL(string: "https://rickandmortyapi.com/api/character/108") else{
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
                    do{
                        let serverUniversity = try JSONDecoder().decode(University.self, from: data)
                        university = serverUniversity
                        //print(serverMenu)
                    }catch{
                        print(error)
                    }
                }catch{
                    print(error)
                }
            }
}

struct UniversityView_Previews: PreviewProvider {
    static var previews: some View {
        UniversityView()
    }
}
