//
//  ViewController.swift
//  Series
//
//  Created by Fehér Donát on 19.08.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var series: [SeriesItem] = []
 

    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initSeries()
        numberOfItemsLabel.text = "Number of items: \(series.count)"
    }
    
    func initSeries() {
        series.append(SeriesItem("Distant Adventures", 2021))
        series.append(SeriesItem("Conjured Fantasies", 2021))
        series.append(SeriesItem("Sweet Tales", 2021))
        series.append(SeriesItem("Gloomy Stories", 2021))
        series.append(SeriesItem("Hell's Galaxy", 2021))
        series.append(SeriesItem("Modern Nightmare", 2021))
        series.append(SeriesItem("Foolish Wonders", 2021))
        series.append(SeriesItem("Nightqueen", 2021))
        series.append(SeriesItem("Shadowgirl", 2021))
        series.append(SeriesItem("Honeyvoice", 2021))
        series.append(SeriesItem("Daydream Drama", 2021))
        series.append(SeriesItem("Little Romance", 2021))
        series.append(SeriesItem("Spoiled Legend", 2021))
        series.append(SeriesItem("Angelic Fantasies", 2021))
        series.append(SeriesItem("Weird Hope", 2021))
        series.append(SeriesItem("Eternal Party", 2021))
        series.append(SeriesItem("Stupid Secrets", 2021))
        series.append(SeriesItem("Comicshock", 2021))
        series.append(SeriesItem("Subgames", 2021))
        series.append(SeriesItem("Crimsonsmile", 2021))
        //series.append(SeriesItem("Freakflake", 2021))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath)
        cell.textLabel?.text = series[indexPath.row].title
        cell.detailTextLabel?.text = String(series[indexPath.row].year)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return series.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(series[indexPath.row].title)
        showAlert(title: series[indexPath.row].title, message: "\(series[indexPath.row].year)")
    }

    @IBAction func addOnTouch(_ sender: Any) {
        let item = SeriesItem(newItemTextField.text!, 2021)
        series.append(item)
        tableView.reloadData()
        numberOfItemsLabel.text = "Number of items: \(series.count)"
        newItemTextField.text = ""
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

