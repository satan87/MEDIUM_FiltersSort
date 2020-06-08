import Cocoa
import SwiftUI
import PlaygroundSupport

struct Author: Hashable, Equatable {
    var firstName = ""
    var lastName = ""
}

struct Book: Hashable, Equatable {
    var name = ""
    var year = 2020
    var author = Author()
}

let Book1 = Book(name: "Moby-Dick", year: 1851, author: Author(firstName: "Herman", lastName: "Melville"))
let Book2 = Book(name: "Pride and Prejudice", year: 1813, author: Author(firstName: "Jane", lastName: "Austen"))
let Book3 = Book(name: "The Big Sleep", year: 1939, author: Author(firstName: "Raymond", lastName: "Chandler"))
let Book4 = Book(name: "Gone Girl", year: 2012, author: Author(firstName: "Gillian", lastName: "Flynn"))
let Book5 = Book(name: "The Glass Hotel", year: 2020, author: Author(firstName: "Emily St. John", lastName: "mandel"))

let books = [Book1, Book2, Book3, Book4, Book5]


struct ContentView: View {
    
    let books = [
        Book(name: "Moby-Dick", year: 1851, author: Author(firstName: "Herman", lastName: "Melville")),
        Book(name: "Pride and Prejudice", year: 1813, author: Author(firstName: "Jane", lastName: "Austen")),
        Book(name: "The Big Sleep", year: 1939, author: Author(firstName: "Raymond", lastName: "Chandler")),
        Book(name: "Gone Girl", year: 2012, author: Author(firstName: "Gillian", lastName: "Flynn")),
        Book(name: "The Glass Hotel", year: 2020, author: Author(firstName: "Emily St. John", lastName: "mandel"))]
    
    var body: some View {
        VStack {
            Text("Search")
            Text("List")
            ForEach(books, id: \.self) {book in
                Text(book.name)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
