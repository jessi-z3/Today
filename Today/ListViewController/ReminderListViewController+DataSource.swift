//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by Jessi Zimmerman on 11/7/22.
//

import Foundation
import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Reminder.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Reminder.ID>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID) {
        let reminder = reminder(for: id)
        var contentConfiguation = cell.defaultContentConfiguration()
        contentConfiguation.text = reminder.title
        contentConfiguation.secondaryText = reminder.dueDate.dayAndTimeText
        contentConfiguation.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguation
        
        var doneButtonConfiguation = doneButtonConfiguation(for: reminder)
        doneButtonConfiguation.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        cell.accessories = [ .customView(configuration: doneButtonConfiguation), .disclosureIndicator(displayed: .always) ]
        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = #colorLiteral(red: 0.2269999981, green: 0.2269999981, blue: 0.2350000143, alpha: 0.5)
        cell.backgroundConfiguration = backgroundConfiguration
    }
    func completeReminder(with id: Reminder.ID){
        var reminder = reminder(for: id)
        reminder.isComplete.toggle()
        update(reminder, with: id)
    }
    private func doneButtonConfiguation(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "checkmark.circle.fill" : "circle"
        let symbolConfiguation = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguation)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
    func reminder(for id: Reminder.ID) -> Reminder {
        let index = reminders.indexOfReminder(with: id)
        return reminders[index]
    }
    func update(_ reminder: Reminder, with id: Reminder.ID) {
        let index = reminders.indexOfReminder(with: id)
        reminders[index] = reminder
    }
}
