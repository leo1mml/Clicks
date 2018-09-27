//
//  PhotosSlideScreenViewController.swift
//  Clicks!
//
//  Created by Leonel Menezes on 14/09/2018.
//  Copyright (c) 2018 Leonel Menezes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PhotosSlideScreenDisplayLogic: class
{
    //  func displaySomething(viewModel: PhotosSlideScreen.Something.ViewModel)
}

class PhotosSlideScreenCollectionViewController: UICollectionViewController, PhotosSlideScreenDisplayLogic
{
    
    // MARK: - Delegates
    var interactor: PhotosSlideScreenBusinessLogic?
    var router: (NSObjectProtocol & PhotosSlideScreenRoutingLogic & PhotosSlideScreenDataPassing)?
    var homeInteractorDelegate: HomeVCInteraction?
    
    // MARK: - VARIABLES
    private let photoCellID = "photoCellID"
    private var prevIndex : Int = 0;
    private var currentIndex: Int!;
    
    // MARK: - UI Variables
    
    private let topStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = UIStackViewAlignment.center
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.layer.zPosition = 6
        return stack
    }()
    
    private let leftControl: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.zPosition = 6
//        btn.backgroundColor = .red
        return btn
    }()
    private let rightControl: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.backgroundColor = .green
        btn.layer.zPosition = 6
        return btn
    }()
    
    private let xButton : UIImageView = {
        let btn = UIImageView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.image = UIImage(named: "x-btn")
        btn.layer.zPosition = 5
        return btn
    }()
    
    private let indexLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Medium", size: 15)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let flagButton: UIImageView = {
        let button = UIImageView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.image = UIImage(named: "flag")
        button.layer.zPosition = 5
        return button
    }()
    
    private let gradientLayer : CAGradientLayer = {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [AppColors.clearblack.color.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.0, 0.4]
        gradient.name = "gradient"
        gradient.zPosition = 4
        return gradient
    }()

    
    
    // MARK: Object lifecycle
    
    init(layout: UICollectionViewLayout, index: Int) {
        super.init(collectionViewLayout: layout)
        self.currentIndex = index
        self.collectionView?.register(ImageViewCell.self, forCellWithReuseIdentifier: self.photoCellID)
        setup()
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = PhotosSlideScreenInteractor()
        let presenter = PhotosSlideScreenPresenter()
        let router = PhotosSlideScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.indexLabel.text = "\(currentIndex + 1)/\(String(describing: collectionView!.numberOfItems(inSection: 0)))"
        self.leftControl.addTarget(self, action: #selector(xButtonAction), for: .touchUpInside)
        setupTopStackView()
        gradientLayer.frame = self.view.bounds
        view.layer.addSublayer(self.gradientLayer)
        let toggleControlsGesture = UITapGestureRecognizer(target: self, action: #selector(toggleControls))
        toggleControlsGesture.numberOfTapsRequired = 1
        self.collectionView?.addGestureRecognizer(toggleControlsGesture)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollToIndex(index: currentIndex)
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = self.view.bounds
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        scrollToIndex(index: currentIndex)
    }
    
    // MARK: - UI Setup Items
    
    private func setupTopStackView(){
        self.view.addSubview(self.topStack)
        NSLayoutConstraint.activate([
                self.topStack.heightAnchor.constraint(equalToConstant: 70/667 * view.frame.height),
                self.topStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                self.topStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                self.topStack.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.flagButton.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        self.topStack.addArrangedSubview(self.leftControl)
        self.topStack.addArrangedSubview(self.indexLabel)
        self.topStack.addArrangedSubview(self.rightControl)
        
        // Configure the buttons
        self.view.addSubview(self.xButton)
        self.view.addSubview(self.flagButton)
        NSLayoutConstraint.activate([
                self.xButton.heightAnchor.constraint(equalToConstant: 16),
                self.xButton.widthAnchor.constraint(equalToConstant: 16),
                self.xButton.leadingAnchor.constraint(equalTo: self.leftControl.leadingAnchor),
                self.xButton.centerYAnchor.constraint(equalTo: self.topStack.centerYAnchor),
                
                self.flagButton.heightAnchor.constraint(equalToConstant: 24),
                self.flagButton.widthAnchor.constraint(equalToConstant: 16),
                self.flagButton.trailingAnchor.constraint(equalTo: self.rightControl.trailingAnchor),
                self.flagButton.centerYAnchor.constraint(equalTo: self.topStack.centerYAnchor),
            ])
    }
    
    // MARK: - Collection View
    
    ///Configures the collectionview and changes it to its right size and color.
    func setupCollectionView() {
        collectionView?.backgroundColor = AppColors.clearblack.color
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        //Registers the collection view page cells
        collectionView?.register(ImageViewCell.self, forCellWithReuseIdentifier: self.photoCellID)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.photoCellID, for: indexPath) as! ImageViewCell
        indexPath.item % 2 == 0 ?
            cell.setData(data: PhotosSlideScreen.FetchPhotos.ViewModel.Photo(isMyShot: true, isVoted: true, photo: UIImage(named: "chronoimg")!))
        :
            cell.setData(data: PhotosSlideScreen.FetchPhotos.ViewModel.Photo(isMyShot: true, isVoted: true, photo: UIImage(named: "dmcimg")!))
        
        return cell
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 44
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! ImageViewCell
        cell.updateZoomScaleForSize(UIScreen.main.bounds.size)
    }
    // MARK: - SCROLL VIEW
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        ///gets the current page index from 0 to n-1
        currentIndex = Int(x/view.frame.width)
        if(self.prevIndex != currentIndex){
            prevIndex = currentIndex
        }
        
        self.indexLabel.text = "\(currentIndex + 1)/\(String(describing: collectionView!.numberOfItems(inSection: 0)))"
    }
    
    func scrollToIndex(index: Int){
        collectionView?.collectionViewLayout.invalidateLayout()
        let indexPath = IndexPath(item: currentIndex, section: 0)
        DispatchQueue.main.async {
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
    }
    
    // MARK: - Interaction UI Functions
    
    @objc private func toggleControls() {
        if(self.leftControl.isEnabled){
            UIView.animate(withDuration: 0.5) {
                self.gradientLayer.opacity = 0
                self.topStack.alpha = 0
                self.indexLabel.alpha = 0
                self.flagButton.alpha = 0
                self.xButton.alpha = 0
            }
        }else {
            UIView.animate(withDuration: 0.5) {
                self.gradientLayer.opacity = 1
                self.topStack.alpha = 1
                self.indexLabel.alpha = 1
                self.flagButton.alpha = 1
                self.xButton.alpha = 1
            }
        }
        self.leftControl.isEnabled = !self.leftControl.isEnabled
    }
    
    @objc private func xButtonAction(sender: UIButton){
        self.router?.dismissSelf()
    }
}

