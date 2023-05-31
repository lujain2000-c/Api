//
//  ThirdJsonExample.swift
//  ApiProject
//
//  Created by لجين إبراهيم الكنهل on 11/11/1444 AH.
//

import SwiftUI

struct ThirdExample: Codable{
    let title: String
    let difficulty: String
    let description: String
    let data: Courses
}

struct Courses: Codable{
    let courses: [Information]
}

struct Information: Codable, Identifiable{
    var id: String {
        title
      }
    var title: String
    let students: [StudentsInfo]
}

struct StudentsInfo: Codable{
    let name: String
    let grade: String
}


struct ThirdJsonExample: View {
    @State var courses: [Information] = []
    @State var studentsInfo: [StudentsInfo] = []
    var body: some View {
        VStack{
            List(courses,id: \.id){ cours in
                
                Text(cours.title)
//                ForEach(courses) { course in
//                    Text(course.students.name)
//                }
               // Text(cours.students.name)
              //  Text(cours.students.grade)
            }.task {
                await read()
            }
        }
        
    }
    func read() async {
            let path = Bundle.main.path(forResource: "data", ofType: "json")
            let url = URL(fileURLWithPath: path!)
            
            URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                do{
               
                   if let data = data{
                        let json = try JSONDecoder().decode(ThirdExample.self, from: data)
                       //print(json)
                       courses = json.data.courses
                   }else{
                       print("No Data")
    }
            
        }catch{
                    print(error)
                    }
            }.resume()

        }
}

struct ThirdJsonExample_Previews: PreviewProvider {
    static var previews: some View {
        ThirdJsonExample()
    }
}
