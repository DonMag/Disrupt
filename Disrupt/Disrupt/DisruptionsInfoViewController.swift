//
//  DisruptionsInfoViewController.swift
//  Disrupt
//
//  Created by Don Mag on 2/10/23.
//

import UIKit

public class DisruptionsInfoViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	public override func viewDidLoad() {
		super.viewDidLoad()
	
		// not needed
		//setUp()
		
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(UINib(nibName: "DisruptionInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "disruptionsInfoTableViewCell")
	}
	
	// none of this is needed
	/*
	private func loadFromNib() -> UIView? {
		let nibName = String(describing: DisruptionsInfoViewController.self)
		let nib = UINib(nibName: nibName, bundle: Bundle(for: type(of: self)))
		return nib.instantiate(withOwner: self, options: nil).first as? UIView
	}
	
	public func setUp() {
		guard let disruptionsInfoViewController = self.loadFromNib() else { return }
		disruptionsInfoViewController.frame = self.view.bounds
	}
	*/
	
}

extension DisruptionsInfoViewController: UITableViewDataSource, UITableViewDelegate {
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// don't use guard here
		//guard let cell = tableView.dequeueReusableCell(withIdentifier: "disruptionsInfoTableViewCell", for: indexPath) as? DisruptonInfoTableViewCell else { return UITableViewCell() }
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "disruptionsInfoTableViewCell", for: indexPath) as! DisruptonInfoTableViewCell
		cell.testLabel.text = "HeaderView: \(indexPath)"
		return cell
		
	}
}

class DisruptonInfoTableViewCell: UITableViewCell {
	@IBOutlet weak var testLabel: UILabel!
}
