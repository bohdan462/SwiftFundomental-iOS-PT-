import UIKit

// Enum is very similar to struct. Allows to create predefind cases that type they may have

enum AppleProducts: String {
    case iPhone
    case iPad
    case macBook
    case watch = "Apple Watch"
}

enum PizzaCategory: String { // these different cases dont have sub properties
    case classic
    case specialty
    case glutenFree
}

// creating instance

let specialtyPizza = PizzaCategory.specialty
let myFavoritePizza: PizzaCategory = .classic



// Struct

struct Pizza {
    let name: String
    let cost: Double
    let category: PizzaCategory
}

let myPizza = Pizza(name: "49-er", cost: 12.99, category: .classic)

print("I Would like to order \(myPizza.name)")

class PizzaPlace { //BluePrint of a pizza place object
    var name: String
    var address: String
   private(set) var pizzas: [Pizza] //method would be acces only inside of class. Genarely use it when creating modelcontroling. to set up restriction. to keep data clean. It is just limiting access to other classes. it is giving more control how to interact with objects
    
    //create init
    init(name: String, address: String) {
        self.name = name
        self.address = address
        self.pizzas = []
    }
    
    func add(pizza: Pizza) {
        pizzas.append(pizza)
    }
    
}

let johnnyPizzaPlace = PizzaPlace(name: "Johnny's Pizza", address: "123 Address. St NYC")

let hawaiianClassic = Pizza(name: "Hawaiian Classic", cost: 12.99, category: .classic)
let chicakenAlfredo = Pizza(name: "Call me Mr. Alfredo", cost: 15.99, category: .specialty)
let margharita = Pizza(name: "Margarita Seniorita", cost: 16.99, category: .glutenFree)

johnnyPizzaPlace.add(pizza: hawaiianClassic)
johnnyPizzaPlace.add(pizza: margharita)
johnnyPizzaPlace.add(pizza: chicakenAlfredo)

print(johnnyPizzaPlace.pizzas)

// diferencess between value type and referernce typr

//Struct = Value Tyrpe

struct Ticket { //are value types. the value is not passed by referance but past by value. It creates copies. they are not accessing the same spot in memmory
    var name: String
}

var ticket = Ticket(name: "Bob")
print(ticket.name)

var ticketCopy = ticket
ticketCopy.name = "Johnny"

print("Ticket: \(ticket.name)")
print("ThicketCopy: \(ticketCopy.name)")

func changeTicketName(ticket: Ticket) {
    var updatedticket = ticket
    updatedticket.name = "John"
    print("updatedTicket: \(updatedticket.name)")
}

print("Ticket: \(ticket.name)")
changeTicketName(ticket: ticket)
print("Ticket: \(ticket.name)")

//Referance Types: class

class City { //use the same point in memmoey
    var name: String
    var population: Int
    
    init(name: String, population: Int) {
        self.name = name
        self.population = population
    }
}

let rochester = City(name: "Rochester, NY", population: 208_000)
let roc = rochester

roc.name = "ROC"

print("rochester: \(rochester.name)") //they would refference the same value
print("roc: \(roc.name)")

func increasePopulation(city: City) {
    city.population = city.population + 1
}

print("Rochester popuation: \(rochester.population)")
increasePopulation(city: rochester)

print("Rochester popuation: \(rochester.population)") // see so it would change value in the same spot in memmory

print(roc.population)

struct Person {
    var name: String
    var age: Double
    
}

let me = Person(name: "Johnny", age: 28) //if it is let so persona age would be unchangable because use of struct
//me.age = 29

print(me.age)

class Person2 {
    var name: String
    var age: Double
    
    init(name: String, age: Double) {
        self.name = name
        self.age = age
    }
}
 let me2 = Person2(name: "bohdan", age: 25) // could use let even thos change the value because the value would be change in class
me2.age = 29

class Vacuum {
    var isOn: Bool //when they are not privat i can still modify them outside of the class
    var isPlaggedIn: Bool
    var rugHeight: Int
    var isSelfDriving: Bool
    var attachments: [String]
    
    init(isSelfDriving: Bool = false, attachments: [String] = []) { //use to create an instance
        self.isOn = false
        self.isPlaggedIn = false
        self.rugHeight = 5
        self.isSelfDriving = isSelfDriving
        self.attachments = attachments
    }
}

let sharkVacuum = Vacuum(isSelfDriving: false, attachments: ["Dusting Brush", "Crevuce tool"])
let roombavacuum = Vacuum(isSelfDriving: true)
print(roombavacuum.attachments)


// Optionals

// if your work is closed then you dont have a car
var myCar: String? = nil
// I change jobs and now i do have a car
myCar = "Subaru"
// I get into accident and totla my car
myCar = nil
//I got insurance money to get a new car
myCar = "Tesla"
//I have 4 kids and have to get rid of tesla
myCar = "Toyota Sienna"


//if let statment to unwrap an optional value
let subtotalString = "58.95"

if let subtotal = Double(subtotalString) {
    let tip = subtotal * 0.20
    let total = subtotal + tip
    print("total: \(total.rounded())\n\tsubtotal:\(subtotal.rounded())\n\ttip: \(tip.rounded())") //istead of getting type float we can .rounded and set a rule
} else {
    print("\(subtotalString) is not valid amount")
}

// if statment for nil

var yearsOld: Int? = 35

if yearsOld != nil {
    let approxomateDateOld = 365 * yearsOld!
    print("wow! your are \(yearsOld) years old")
} 
