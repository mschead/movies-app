//
//  FilterViewController.swift
//  Movies
//
//  Created by Marcos Schead on 14/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import UIKit
import ReSwift

class FilterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, StoreSubscriber {

    typealias StoreSubscriberStateType = FilterState

    @IBOutlet weak var yearPicker: UIPickerView!

    var year: String = ""
    
    var years: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateYearsArray()
        year = years[0]

        yearPicker.delegate = self
        yearPicker.dataSource = self

        mainStore.subscribe(self, selector: { $0.filterState })
    }


    func newState(state: FilterState) {
        if let index = years.index(of: state.year) {
            year = state.year
            yearPicker.selectRow(index, inComponent: 0, animated: true)
        }
    }


    @IBAction func applyFilter(_ sender: UIBarButtonItem) {
        mainStore.dispatch(ApplyFilterAction(year: year))
        self.navigationController?.popViewController(animated: true)
    }

    fileprivate func generateYearsArray() {
        for year in 1960...2018 {
            years.append(String(year))
        }
    }

    /* PICKERVIEW METHODS */

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return years[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        year = years[row]
        mainStore.dispatch(SetYearFiltroAction(year: year))
    }

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let str = years[row]
        return NSAttributedString(string: str, attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
    }

}
