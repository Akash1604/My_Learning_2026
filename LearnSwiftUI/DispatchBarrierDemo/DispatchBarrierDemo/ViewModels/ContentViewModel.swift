//
//  ContentViewModel.swift
//  DispatchBarrierDemo
//
//  Created by Akash Revanna on 13/08/26.
//

import Foundation

class ContentViewModel {
    
    private var availableTickets = 5;
    
    private let concurrentQueue = DispatchQueue(label: "com.gcd.DispatchBarrierDemo", attributes: .concurrent)
    
    var tickets = [Ticket(number: 3, name: "Akash"),
                   Ticket(number: 4, name: "Adya"),
                   Ticket(number: 5, name: "Yukti"),
                   Ticket(number: 2, name: "Yakshit")]
    
    func buyTickets() {
        for ticket in tickets {
            let dispatchItem = DispatchWorkItem(flags: .barrier) {
                self.book(ticket:ticket)
            }
            concurrentQueue.async(execute: dispatchItem)
        }
    }
    
    func book(ticket:Ticket) {
        print("Ticket booking started \(ticket.name)")
        sleep(1)
        if availableTickets >= ticket.number {
            availableTickets = availableTickets - ticket.number
            print("Ticket is successful \(ticket.name)")
        } else {
            print("Ticket is unsuccessful \(ticket.name)")
        }
    }
    func doSomething() {
        print("Here i am always doing what i want")
    }
    
    
}
