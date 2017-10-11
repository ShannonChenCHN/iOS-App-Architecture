//
//  ViewController.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            // Assembling of MVC
            let model = MVCPerson.init(name: "David")
            let viewController = MVCViewController()  // viewController is a combination of view and controller
            viewController.person = model
            viewController.title = "MVC"
            self.navigationController?.pushViewController(viewController, animated: true)
            
        } else if indexPath.row == 1 {
            
            // Assembling of MVP
            let model = MVCPerson.init(name: "David")
            let view = MVCViewController()  // viewController is the view
            view.person = model
            view.title = "MVP"
            self.navigationController?.pushViewController(view, animated: true)
            
        } else if indexPath.row == 2 {
            
            // Assembling of MVVM
            let model = MVVMPerson(name: "David")
            let viewModel = MVVMViewModel(person: model)
            let view = MVVMViewController()  // viewController is the view
            view.viewModel = viewModel
            view.title = "MVVM"
            self.navigationController?.pushViewController(view, animated: true)
            
        } else if indexPath.row == 3 {
            
            // Assembling of VIPER module, without Router
            let view = VIPERViewController()
            let presenter = VIPERGreetingPresenter()
            let interactor = VIPERGreetingInteractor()
            view.eventHandler = presenter
            presenter.view = view
            presenter.greetingProvider = interactor
            interactor.output = presenter
            view.title = "VIPER"
            self.navigationController?.pushViewController(view, animated: true)
        }
        
    }

}

