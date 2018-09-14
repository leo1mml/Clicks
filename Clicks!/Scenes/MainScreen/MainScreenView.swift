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
//    func displaySomething(viewModel: MainScreen.Something.ViewModel)
}

class MainScreenView: UICollectionViewCell, MainScreenDisplayLogic
{
    
    // MARK: - Variables
    
    var navigationController : UINavigationController?
    
    //Delegates
    
    var interactor: MainScreenBusinessLogic?
    var router: (NSObjectProtocol & MainScreenRoutingLogic & MainScreenDataPassing)?
    
    //Commom variables
    private let headerCellId = "headerCellId"
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
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup(){
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
    
//    func doSomething(){
//        let request = MainScreen.Something.Request()
//        interactor?.doSomething(request: request)
//    }
    
//    func displaySomething(viewModel: MainScreen.Something.ViewModel){
//        //nameTextField.text = viewModel.name
//    }
    
    //MARK: - Configure View
    
    ///Set up the initial configurations for the container table view
    func setupTableView() {
        self.containerTableView = UITableView(frame: self.frame, style: .grouped)
        guard let tableView = self.containerTableView else {
            return
        }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        //Appearance
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = AppColors.darkwhite.color
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        //Register
        tableView.register(MainScreenTableHeaderView.self, forCellReuseIdentifier: headerCellId)
        tableView.register(OpenChallengesContainerCell.self, forCellReuseIdentifier: self.openChallengesCellId)
        tableView.register(LastChallengesContainerCell.self, forCellReuseIdentifier: self.lastWinnersCellId)
        tableView.register(NextChallengesContainerCell.self, forCellReuseIdentifier: self.nextChallengesCellId)
        
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
        
        var cell : UITableViewCell?
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: openChallengesCellId)
            break;
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: lastWinnersCellId)
            break;
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: nextChallengesCellId)
            break;
        default:
            return UITableViewCell()
        }
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return self.frame.height * (374/592)
        case 1:
            return self.frame.height * (136/592)
        case 2:
            return self.frame.height * (336/592)
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: headerCellId) as! MainScreenTableHeaderView
        switch section {
        case 1:
            header.title.text = NSLocalizedString("LAST WINNERS", comment: "")
            break;
        case 2:
            header.title.text = NSLocalizedString("NEXT CHALLENGES", comment: "")
            break;
        default:
            header.title.text = ""
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.0
        }
        return self.frame.height * (68/592)
    }
}

