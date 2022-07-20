//
//  PaymentDataInfo.swift
//  PaymentDashboard
//
//  Created by Антон Шкурай on 18.07.22.
//

import UIKit

final class PaymentDataInfo {
    static let paymentData = [
        PaymentInfo(payerName: "Tony",
                    payerEmail: "tonymail@gmail.com",
                    payerPhone: nil,
                    amount: 18.25,
                    paymentDate: Date(),
                    status: "succeeded"),
        PaymentInfo(payerName: "Bruce",
                    payerEmail: "brucemail@gmail.com",
                    payerPhone: "+375291234123",
                    amount: 43.12,
                    paymentDate: Date(),
                    status: "pending"),
        PaymentInfo(payerName: "Alfred",
                    payerEmail: nil,
                    payerPhone: nil,
                    amount: 66.15,
                    paymentDate: Date(),
                    status: "succeeded"),
        PaymentInfo(payerName: "Peter",
                    payerEmail: "petermail@gmail.com",
                    payerPhone: nil,
                    amount: 88.30,
                    paymentDate: Date(),
                    status: "pending"),
        PaymentInfo(payerName: "Shaun",
                    payerEmail: nil,
                    payerPhone: nil,
                    amount: 4313.21,
                    paymentDate: getEarlierDate(numberOfDays: 1),
                    status: "succeeded"),
        PaymentInfo(payerName: "Harley",
                    payerEmail: nil,
                    payerPhone: "+375449876543",
                    amount: 22.22,
                    paymentDate: getEarlierDate(numberOfDays: 1),
                    status: "pending"),
        PaymentInfo(payerName: "John",
                    payerEmail: "johnmail@gmail.com",
                    payerPhone: "+375441231239",
                    amount: 99.12,
                    paymentDate: getEarlierDate(numberOfDays: 1),
                    status: "pending"),
        PaymentInfo(payerName: "Cuphead",
                    payerEmail: nil,
                    payerPhone: nil,
                    amount: 90.32,
                    paymentDate: getEarlierDate(numberOfDays: 2),
                    status: "succeeded"),
        PaymentInfo(payerName: "Freddy",
                    payerEmail: "freddymail@gmail.com",
                    payerPhone: nil,
                    amount: 54.12,
                    paymentDate: getEarlierDate(numberOfDays: 2),
                    status: "pending"),
        PaymentInfo(payerName: "Mike",
                    payerEmail: nil,
                    payerPhone: "+3756666123",
                    amount: 15643,
                    paymentDate: getEarlierDate(numberOfDays: 3),
                    status: "succeeded"),
        PaymentInfo(payerName: "Jason",
                    payerEmail: nil,
                    payerPhone: nil,
                    amount: 76.12,
                    paymentDate: getEarlierDate(numberOfDays: 4),
                    status: "pending"),
        PaymentInfo(payerName: "Spawn",
                    payerEmail: "goodbadhellspawn300@gamil.com",
                    payerPhone: nil,
                    amount: 10.55,
                    paymentDate: getEarlierDate(numberOfDays: 10),
                    status: "pending")
    ]
    
    private static func getEarlierDate(numberOfDays: Int) -> Date {
        var dayComponent = DateComponents()
        dayComponent.day = -numberOfDays
        let theCalendar = Calendar.current
        let nextDate = theCalendar.date(byAdding: dayComponent, to: Date())
        return nextDate ?? Date()
    }
}
