//
//  LocalNotificationService.swift
//  AigerimNotification
//
//  Created by Айгерим on 22.10.2024.
//

import Foundation
import UserNotifications

class LocalNotificationService {
    static let shared = LocalNotificationService()
    private init() { }
    func registerForLatestIfPossible() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Разрешение на отправку уведомлений разрешено")
                self.sheduleDailyNotification()
            } else {
                print("Разрешение отклонено")
        }
        }
    }
    private func sheduleDailyNotification() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = "Напоминание"
        content.body = "Посмори последние обновления"
        content.sound = .default
       var  dateComponents = DateComponents()
        dateComponents.hour = 19
        dateComponents.minute = 0
        var trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "dailyNotification", content: content, trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("Ошибка добавления")
            }
        }
        
    }
}
