//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Jessi Zimmerman on 11/8/22.
//

import Foundation
import UIKit


extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
//        ended with section 4 https://developer.apple.com/tutorials/app-dev-training/making-reminders-identifiable
    }
}
