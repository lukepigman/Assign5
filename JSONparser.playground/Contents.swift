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

struct Parser:Codable{

    let people:[People]

    struct People:Codable{
        let name:String
        let age:Int
        let dog:Dog
        
        struct Dog:Codable {
            let name:String
            let breed:String
            let photo:Photo
            
            struct Photo:Codable {
                let size:Size
                let title_of_photo:String
    
                struct Size:Codable{
                    let height:Int
                    let width:Int
                }
            }
        }
    }
}
let decoder = JSONDecoder()
let theGang = try decoder.decode(Parser.self, from: json!)
var people = theGang.people
for dudes in people{
    print("Name: \(dudes.name)\nAge: \(dudes.age)\nDog Name: \(dudes.dog.name)\nDog Breed: \(dudes.dog.breed)\nPhoto title: \(dudes.dog.photo.title_of_photo)\nPhoto size: \(dudes.dog.photo.size.height) x \(dudes.dog.photo.size.width)\n")
}










