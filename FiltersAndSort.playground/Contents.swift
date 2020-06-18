import Cocoa

struct Author: Hashable, Equatable {
    var firstName = ""
    var lastName = ""
}

struct Book: Hashable, Equatable {
    var name = ""
    var year = 2020
    var favorite = false
    var author = Author()
}

// MARK: DATA
let Book1 = Book(name: "Moby-Dick", year: 1851, favorite: false, author: Author(firstName: "Herman", lastName: "Melville"))
let Book2 = Book(name: "Pride and Prejudice", year: 1813, favorite: true, author: Author(firstName: "Jane", lastName: "Austen"))
let Book3 = Book(name: "The Big Sleep", year: 1939, favorite: false, author: Author(firstName: "Raymond", lastName: "Chandler"))
let Book4 = Book(name: "Gone Girl", year: 2012, favorite: true, author: Author(firstName: "Gillian", lastName: "Flynn"))
let Book5 = Book(name: "The Glass Hotel", year: 2020, favorite: false, author: Author(firstName: "Emily St. John", lastName: "mandel"))
let books = [Book1, Book2, Book3, Book4, Book5]

// MARK: IF FILTER
var bookBefore2000 = [Book]()
for book in books {
    if book.year < 2000 {
        bookBefore2000.append(book)
    }
}

// MARK: HIGHER ORDER FUNCTION
let bookBefore2020HOF = books.filter({$0.year < 2000})
print(bookBefore2020HOF.count)

// MARK: MULTIPLE FILTERS
let bookFilteredMultiples = books.filter({$0.year < 2000}).filter({$0.favorite})
print(bookFilteredMultiples.count)

// MARK: Searching Structore for Books
struct SearchingBook {
    var byBeforeYear = 0
    var byFavorite = FavoriteSearch.all
    var byAuthorFirstName = ""
}

// MARK: Favorite Enum to handle 3 cases: YES / NO / Not Filter
enum FavoriteSearch {
    case all
    case favorite
    case notFavorite
}

// MARK: FILTER FUNCTION
func filterBooks(books: [Book], by filters: SearchingBook) -> [Book] {
    
    var bookFiltered = books.filter({ filters.byBeforeYear == 0 || $0.year < filters.byBeforeYear})
    
    //Search by favorite
    switch filters.byFavorite {
    case .favorite:
        bookFiltered.removeAll(where: {!$0.favorite})
    case .notFavorite:
        bookFiltered.removeAll(where: {$0.favorite})
    default:
        break
    }
    
    if !filters.byAuthorFirstName.isEmpty {
        bookFiltered.removeAll(where: {$0.author.firstName.range(of: filters.byAuthorFirstName,options: .caseInsensitive) == nil})
    }
    
    return bookFiltered
}

print(books.count)
print(filterBooks(books: books, by: SearchingBook()).count)
print(filterBooks(books: books, by: SearchingBook(byBeforeYear: 2000)).count)
print(filterBooks(books: books, by: SearchingBook(byFavorite: .all)).count)
print(filterBooks(books: books, by: SearchingBook(byFavorite: .favorite)).count)
print(filterBooks(books: books, by: SearchingBook(byFavorite: .notFavorite)).count)
print(filterBooks(books: books, by: SearchingBook(byBeforeYear: 2000, byFavorite: .favorite)).count)
print(filterBooks(books: books, by: SearchingBook(byBeforeYear: 2000, byFavorite: .favorite)).count)
print(filterBooks(books: books, by: SearchingBook(byAuthorFirstName: "")).count)
print(filterBooks(books: books, by: SearchingBook(byAuthorFirstName: "Jane")).count)
print(filterBooks(books: books, by: SearchingBook(byAuthorFirstName: "e")).count)
print(filterBooks(books: books, by: SearchingBook(byAuthorFirstName: "z")).count)
print(filterBooks(books: books, by: SearchingBook(byBeforeYear: 2000, byFavorite: .favorite, byAuthorFirstName: "Jane")).count)
