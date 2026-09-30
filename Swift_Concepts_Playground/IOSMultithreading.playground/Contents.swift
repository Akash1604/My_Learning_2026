//import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class Flight {
    let company = "Vistara"
    var availableSeats:[String] = ["1A", "1B", "1C"]
    //var dispatchQueue = DispatchQueue(label: "barrierQueue")
    func getAvailableSeats() -> [String] {
       // dispatchQueue.sync(flags: .barrier) {
            return availableSeats
       // }
        
    }
    
    func bookSeat() -> String {
        //dispatchQueue.sync(flags: .barrier) {
            let bookedSeat = availableSeats.first ?? ""
            availableSeats.removeFirst()
            return bookedSeat
       // }
    }
}

class BookSeatVC {
    let fligt: Flight = Flight()
    var bookedSeat = ""
    var avialbleSeats:[String]?
    let queue1 = DispatchQueue(label: "queue1", attributes: .concurrent)
    let queue2 = DispatchQueue(label: "queue2", attributes: .concurrent)
    let queue3 = DispatchQueue(label: "queue2", attributes: .concurrent)
    
    func startBooking()  {
        
        queue1.async { [weak self] in
            self?.bookedSeat = (self?.fligt.bookSeat())!
            print("Booked Seat: \(String(describing: self?.bookedSeat))")
        }
        queue2.async { [weak self] in
            self?.avialbleSeats = self?.fligt.getAvailableSeats()
            print("Available Seats: \(String(describing: self?.avialbleSeats))")
        }
        queue3.async { [weak self] in
            self?.bookedSeat = (self?.fligt.bookSeat())!
            print("Booked Seat: \(String(describing: self?.bookedSeat))")
        }
        
    }
}

let book = BookSeatVC()
book.startBooking()



