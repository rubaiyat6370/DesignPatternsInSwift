//
//  MainViewController.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-11.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var userManager: UserCRUDManger!

    @IBOutlet weak var tableView: UITableView!

    var users = [UserProfile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        tableView.delegate = self
        tableView.dataSource = self
        userManager = UserCRUDManger(DB: RealmDB())
        //let u1 = userManager.createUser(name: "Pritam", city: "Dhaka", country: "Bangladesh")
       //_ = userManager.createUser(name: "Shuvo", city: "Mississauga", country: "Canada")

        self.users = userManager.getAllUser() ?? [UserProfile]()

        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    }

}

extension MainViewController: UITableViewDelegate {

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users.count)
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileTableViewCell
        cell.NameLabel.text = users[indexPath.row].name
        return cell
    }

    
}
