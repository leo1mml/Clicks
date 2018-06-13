//
//  MainScreenViewController.swift
//  Clicks!
//
//  Created by Leonel Menezes on 12/06/2018.
//  Copyright (c) 2018 Leonel Menezes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainScreenDisplayLogic: class
{
    func displaySomething(viewModel: MainScreen.Something.ViewModel)
}

class MainScreenView: UICollectionViewCell, MainScreenDisplayLogic
{
    
    // MARK: - Variables
    
    //Delegates
    
    var interactor: MainScreenBusinessLogic?
    var router: (NSObjectProtocol & MainScreenRoutingLogic & MainScreenDataPassing)?
    
    //Commom variables
    private let openChallengesCellId = "OpenChallengesCell"
    private let lastWinnersCellId = "LastWinnersCell"
    private let nextChallengesCellId = "NextChallengesCell"
    
    //Screen Items
    
    ///Table view to store the current challenges, last winners and next challenges
    var containerTableView : UITableView?
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        self.backgroundColor = AppColors.darkwhite.color
        let viewController = self
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter()
        let router = MainScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.view = viewController
        router.dataStore = interactor
    }
    
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = MainScreen.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: MainScreen.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
    
    //MARK: - Configure View
    
    ///Set up the initial configurations for the container table view
    func setupTableView() {
        self.containerTableView = UITableView(frame: self.frame, style: .grouped)
        guard let tableView = self.containerTableView else {
            return
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = AppColors.clearblack.color
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(OpenChallengesCell.self, forCellReuseIdentifier: self.openChallengesCellId)
        tableView.allowsSelection = false
        self.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MainScreenView : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: openChallengesCellId)
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return self.frame.height * 0.633
        default:
            return 100
        }
    }
    
    
    
}

