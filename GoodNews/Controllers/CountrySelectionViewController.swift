//
//  CountrySelectionViewController.swift
//  GoodNews
//
//  Created by Rafael Plinio on 22/06/21.
//

import UIKit

class CountrySelectionViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usButton: UIButton!
    @IBOutlet weak var brazilButton: UIButton!
    @IBOutlet weak var swedenButton: UIButton!
    @IBOutlet weak var germanyButton: UIButton!

    private var country = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        buttonActions()
    }


    private func setup() {
        title = "Good News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        titleLabel.text = "Select Country"

        usButton.setBackgroundImage(UIImage(named: "usFlag"), for: .normal)
        brazilButton.setBackgroundImage(UIImage(named: "brazilFlag"), for: .normal)
        swedenButton.setBackgroundImage(UIImage(named: "swedenFlag"), for: .normal)
        germanyButton.setBackgroundImage(UIImage(named: "germanyFlag"), for: .normal)
    }

    private func buttonActions() {
        usButton.addTarget(self, action: #selector(usButtonTapped), for: .touchUpInside)
        brazilButton.addTarget(self, action: #selector(brazilButtonTapped), for: .touchUpInside)
        swedenButton.addTarget(self, action: #selector(swedenButtonTapped), for: .touchUpInside)
        germanyButton.addTarget(self, action: #selector(germanyButtonTapped), for: .touchUpInside)
    }

    @objc func usButtonTapped() {
        screenToShow(country: "us")
        //United States
    }

    @objc private func brazilButtonTapped() {
        screenToShow(country: "br")
        //Brasil
    }

    @objc private func swedenButtonTapped() {
        screenToShow(country: "se")
        //Sverige
    }

    @objc private func germanyButtonTapped() {
        screenToShow(country: "de")
        //Deutschland
    }

    private func screenToShow(country: String) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GoodNewsListTableViewController") as? GoodNewsListTableViewController {

            vc.country = country

            if let nc = navigationController {
                nc.pushViewController(vc, animated: true)
            }
        }
    }
}
