//
//  ViewController.swift
//  Disrupt
//
//  Created by Don Mag on 2/10/23.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

class SimpleCell: UITableViewCell {
	@IBOutlet weak var theLabel: UILabel!
}

class WrongVC: UIViewController {
	
	@IBOutlet var tableView: UITableView!
	
	let data: [String] = [
		"This is the Wrong way to use a view from another view controller",
		"(that contains a table view) as a section header view",
		"note that we don't see any rows in the section header!"
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Wrong"
		
		tableView.dataSource = self
		tableView.delegate = self
	}
	
}

extension WrongVC: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let c = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath) as! SimpleCell
		c.theLabel.text = data[indexPath.row]
		return c
	}
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 150.0
	}
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		
		let disruptionsViewController = DisruptionsInfoViewController()
		return disruptionsViewController.view
		
		// as soon as we return, disruptionsViewController is released
		//	and no code it contains will be executed
		
	}
}

class RightVC: UIViewController {
	
	@IBOutlet var tableView: UITableView!
	
	let data: [String] = [
		"This is the Right way to use a view from another view controller",
		"(that contains a table view) as a section header view",
		"note that we now DO see the rows in the section header!"
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.title = "Right"

		tableView.dataSource = self
		tableView.delegate = self
	}
	
}

extension RightVC: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let c = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath) as! SimpleCell
		c.theLabel.text = data[indexPath.row]
		return c
	}
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 150.0
	}
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		
		let disruptionsViewController = DisruptionsInfoViewController()
		
		// add disruptionsViewController as a child view controller
		//	this will "hold on to it" so its code can execute
		addChild(disruptionsViewController)
		disruptionsViewController.didMove(toParent: self)
		
		return disruptionsViewController.view
		
	}
}

