import UIKit

var json = """
{

  "people" : [
    {
      "name" : "Fred",
      "age" : 30,
      "dog" : {
        "name" : "Spot",
        "breed" : "Beagle",
        "photo" : {
                    "size": {
                             "width":150,
                             "height":150
                            },
                    "title_of_photo":"Cute Puppy"
                  }
      }
    },
    {
      "name" : "Sue",
      "age" : 27,
      "dog" : {
        "name" : "Lassie",
        "breed" : "Collie",
        "photo" : {
                    "size": {
                             "width":150,
                             "height":250
                            },
                    "title_of_photo":"Cuter Puppy"
                  }
      }
    }
  ]
}
""".data(using: .utf8)

//struct this:Decodable{
//
//    let people:[People]

    struct People:Decodable{
        let name:String
        let age:Int
        let dog:Dog
        
        struct Dog:Decodable {
            let name:String
            let breed:String
            let photo:Photo
            
            struct Photo:Decodable {
                let size:Size
                
                struct Size:Decodable {
                    let height:Int
                    let width:Int
                }
            }
        }
    }
    
//}

let decoder = JSONDecoder()


let theGang = try decoder.decode(People.self, from: json!)

print(theGang.age)








