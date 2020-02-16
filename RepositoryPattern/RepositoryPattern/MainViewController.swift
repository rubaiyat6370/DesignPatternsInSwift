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
    
    fileprivate func fetchData() {
        userManager = UserCRUDManger(DB: RealmDB())

        self.users = userManager.getAllUser() ?? [UserProfile]()
    }

    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        fetchData()
        setupTableView()
    }

}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? ProfileTableViewCell
        cell?.layer.zPosition = 0.0
        cell?.radius = 10
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? ProfileTableViewCell
        cell?.radius = 0
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users.count)
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileTableViewCell
        cell.setupView(user: users[indexPath.row])
        return cell
    }

    
}

//        _ = userManager.createUser(name: "Pritam Sen", city: "Dhaka", country: "Bangladesh", bio: "Magnanimous Software Engineer/ iOS Developer", gender: "Male", image: nil)
//        _ = userManager.createUser(name: "Hasan Ibrahim Shuvo", city: "Mississauga", country: "Canada", bio: "Software Engineer at Geotab", gender: "Male", image: nil)
//        _ = userManager.createUser(name: "Rubaiyat Jahan Mumu", city: "Mississauga", country: "Canada", bio: "I am an iOS developer", gender: "Female", image: nil)
 //       _ = userManager.createUser(name: "Israt Jhumu", city: "Noakhali", country: "Bangladesh", bio: "Studying Software Engineering at Noakhali Science and Technology Institute Software Engineering at Noakhali Science and Technology Institute", gender: "Female", image: nil)
//        _ = userManager.createUser(name: "Abdullah Al Shahriar", city: "Dhaka", country: "Bangladesh", bio: "Studying Statistics at Dhaka College", gender: "Male", image: nil)
//        _ = userManager.createUser(name: "Shahida Akter", city: "Comilla", country: "Bangladesh", bio: "I am a housewife", gender: "Female", image: nil)
//        _ = userManager.createUser(name: "Md. Abdul Halim", city: "Mymensingha", country: "Bangladesh", bio: "Regional Officer at Grameen kalyan", gender: "Male", image: nil)
//        let predicate: NSPredicate = NSPredicate(format: "name == %@", "Rubaiyat Jahan Mumu")
//        self.users = userManager.getAllUser(where: predicate) ?? [UserProfile]()
//
//        for user in users {
//            _ = userManager.delete(user: user)
//        }
