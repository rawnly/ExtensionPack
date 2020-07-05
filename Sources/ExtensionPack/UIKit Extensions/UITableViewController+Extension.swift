//
//  UITableViewController+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 30/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//
#if !os(macOS)

import Foundation
import UIKit

enum CellType: Hashable {
    case Text(
        _ label: String,
        font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize),
        align: NSTextAlignment = .left,
        selectionStyle: UITableViewCell.SelectionStyle = UITableViewCell.SelectionStyle.default
    )
    
    case Label(
        _ label: String,
        value: String? = nil,
        selectionStyle: UITableViewCell.SelectionStyle = UITableViewCell.SelectionStyle.default
    )
    
    case CheckBox(
        _ label: String,
        value: String? = nil,
        checked: Bool = false,
        selectionStyle: UITableViewCell.SelectionStyle = .default
    )
    
    case AttributedLabel(
        _ label: String,
        value: NSAttributedString? = nil,
        selectionStyle: UITableViewCell.SelectionStyle = UITableViewCell.SelectionStyle.default
    )
    
    case Button(_ title: String)
    
    case Map(
        _ latitude: Double,
        _ longituede: Double,
        _ placemark: String? = nil
    )
    
    case Link(
        _ label: String,
        url: String
    )
    
    case Toggle(
        _ label: String,
        defaultValue: Bool = false,
        onToggle: Selector? = nil,
        tag: Int? = nil
    )
    
    case Detail(
        _ title: String,
        detail: String,
        extra: String? = nil
        
    )
}

public extension UITableViewDataSource {
    internal func renderRow(_ cellType: CellType, at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
         switch cellType {
         case .Detail(let title, detail: let detail, extra: let extra):
            let cell = DetailedCell.dequeque(from: tableView, at: indexPath)!;
            
            cell.title = title;
            cell.subTitle = detail;
            cell.extra = extra
            cell.accessoryType = .disclosureIndicator
            
            
            return cell
         case .CheckBox(let label, value: let val, checked: let isChecked, selectionStyle: let selectionStyle):
            let cell = CheckBoxCell.dequeque(from: tableView, at: indexPath)!;
            
            cell.value = val
            cell.labelText = label
            cell.checked = isChecked
            cell.selectionStyle = selectionStyle
            
            return cell
         case .Link(let label, _):
            let cell = ButtonCell.dequeque(from: tableView, at: indexPath)!
            cell.textLabel?.text = label
            return cell;
         case .Toggle(let title, let defaultValue, let action, let tag):
             let cell = ToggleCell.dequeque(from: tableView, at: indexPath)!
             
             cell.toggle.tag = tag ?? 0;
             cell.textLabel?.text = title
             cell.toggle.setOn(defaultValue, animated: true)
             
             if let action = action {
                cell.toggle.addTarget(self, action: action, for: .valueChanged)
             }
             
             return cell
         case .Button(let title):
             let cell = ButtonCell.dequeque(from: tableView, at: indexPath)!
             cell.textLabel?.text = title;
             return cell;
         case .Label(let l1, let l2, let selectionStyle):
             let cell = LabelCell.dequeque(from: tableView, at: indexPath)!
             
             cell.primaryLabel.text = l1;
             cell.secondaryLabel.text = l2;
             cell.selectionStyle = selectionStyle
             
             if l2 == nil {
                cell.isLoading = true
             } else {
                cell.isLoading = false
             }
             
             return cell;
        case .AttributedLabel(let l1, let l2, let selectionStyle):
            let cell = LabelCell.dequeque(from: tableView, at: indexPath)!
            
            cell.primaryLabel.text = l1;
            cell.secondaryLabel.attributedText = l2;
            cell.selectionStyle = selectionStyle
            
            if l2 == nil {
               cell.isLoading = true
            } else {
               cell.isLoading = false
            }
            
             return cell;
         case .Map(let lat, let long, let pinTitle):
             let cell = MapCell.dequeque(from: tableView, at: indexPath)!
             cell.location = .init(latitude: lat, longitude: long)
            
             if let pin = pinTitle {
                cell.addPin(title: pin, coords: cell.location)
             }
                          
             return cell
         case .Text(let text, let font, let alignment, let selectionStyle):
             let cell = ThemedTableCell.dequeque(from: tableView, at: indexPath)!
             
             cell.textLabel?.text = text;
             cell.textLabel?.font = font
             cell.textLabel?.textAlignment = alignment
             cell.textLabel?.numberOfLines = 0
             cell.selectionStyle = selectionStyle
                         
             return cell;
         }
    }
}

#endif
