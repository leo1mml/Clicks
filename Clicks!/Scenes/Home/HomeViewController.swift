 
 //
 //  HomeViewController.swift
 //  Clicks!
 //
 //  Created by Leonel Menezes on 24/05/2018.
 //  Copyright (c) 2018 Leonel Menezes. All rights reserved.
 //
 //  This file was generated by the Clean Swift Xcode Templates so
 //  you can apply clean architecture to your iOS and Mac projects,
 //  see http://clean-swift.com
 //
 
 import UIKit
 
 class HomeViewController: UIViewController
 {
    
    // MARK: - Variables
    
    ///last scroll offset value
    private var lastOffset : CGFloat = 0.0
    ///scale proportion per point moved in the scroll
    private var homeImageScaleFactor : CGSize = CGSize(width: 0.0, height: 0.0)
    ///scale proportion per point moved in the scroll
    private var profileImageScaleFactor : CGSize = CGSize(width: 0.0, height: 0.0)
    ///scale proportion per point moved in the scroll
    private var configScaleFactor : CGSize = CGSize(width: 0.0, height: 0.0)
    ///move proportion per point moved in the scroll
    private var moveFactor : CGFloat = 0.0
    ///Transformations max distance
    var maxDistanceTransformations : CGFloat = 0.0
    ///Current profile image scale
    private var profileImageScale : CGSize = CGSize(width: 1.0, height: 1.0)
    ///Current home home scale
    private var homeImageScale : CGSize = CGSize(width: 1.0, height: 1.0)
    ///Current container collection view page index
    private var pageIndex = 0
    ///Main Scren cell id
    private let mainScreenCellId = "MainScreenCell"
    ///Profile screen cell id
    private let profileScreenCellId = "ProfileScreenCell"
    
    
    // MARK: - Outlets
    
    //Controls
    @IBOutlet weak var leftControl: UIButton!
    @IBOutlet weak var middleControl: UIButton!
    @IBOutlet weak var rightControl: UIButton!
    
    //CollectionView
    @IBOutlet weak var containerCollectionView: UICollectionView!
    
    //Images
    @IBOutlet weak var configImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var homeImage: UIImageView!
    
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupImages()
        self.containerCollectionView.register(MainScreenView.self, forCellWithReuseIdentifier: mainScreenCellId)
        self.containerCollectionView.register(ProfileView.self, forCellWithReuseIdentifier: profileScreenCellId)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.maxDistanceTransformations = self.profileImage.center.x - homeImage.center.x
        setFactors()
    }
    
    ///Sets the initial values for the move and scale factors
    func setFactors() {
        self.moveFactor = (maxDistanceTransformations)/view.frame.width
        self.homeImageScaleFactor = getItemScaleRate(distance: view.frame.width, from: homeImage.frame.size, to: CGSize(width: homeImage.frame.width * 0.75, height: homeImage.frame.height * 0.75))
        self.profileImageScaleFactor = getItemScaleRate(distance: view.frame.width, from: profileImage.frame.size, to: CGSize(width: profileImage.frame.width * 1.066, height: profileImage.frame.height * 1.066))
    }
    
    ///Configures the initial position of images
    func setupImages() {
        
        //Home Image
        
        self.homeImage.translatesAutoresizingMaskIntoConstraints = false
        self.homeImage.centerXAnchor.constraint(equalTo: self.middleControl.centerXAnchor).isActive = true
        self.homeImage.widthAnchor.constraint(equalToConstant: view.frame.width * 0.094).isActive = true
        self.homeImage.heightAnchor.constraint(equalToConstant: view.frame.height * 0.06).isActive = true
        self.homeImage.tintColor = AppColors.clearblack.color
        
        //Profile Image
        self.profileImage.translatesAutoresizingMaskIntoConstraints = false
        self.profileImage.trailingAnchor.constraint(equalTo: self.rightControl.trailingAnchor).isActive = true
        self.profileImage.widthAnchor.constraint(equalToConstant: view.frame.width * 0.07).isActive = true
        self.profileImage.heightAnchor.constraint(equalToConstant: view.frame.height * 0.045).isActive = true
        self.profileImage.tintColor = AppColors.gray.color
        
        //Config Image
        self.configImage.translatesAutoresizingMaskIntoConstraints = false
        self.configImage.leadingAnchor.constraint(equalTo: self.profileImage.trailingAnchor, constant: view.frame.width * 0.33368).isActive = true
    }
    
    /**
     Switches the colors of the profile image and the home image if necessary
     - Parameters:
        - index: The current page index
     */
    func switchHeaderImagesColorsToIndex(index: Int) {
        if(index == 0){
            UIView.animate(withDuration: 0.2) {
                self.homeImage.tintColor = AppColors.clearblack.color
                self.profileImage.tintColor = AppColors.gray.color
            }
            
        }else {
            UIView.animate(withDuration: 0.2) {
                self.homeImage.tintColor = AppColors.gray.color
                self.profileImage.tintColor = AppColors.clearblack.color
            }
        }
    }
    
    @IBAction func leftButtonAction(_ sender: Any) {
        scrollToMenuIndex(index: 0)
        self.pageIndex = 0
        switchHeaderImagesColorsToIndex(index: 0)
    }
    
    
    @IBAction func middleAction(_ sender: Any) {
        
    }
    
    
    @IBAction func rightAction(_ sender: Any) {
        if(pageIndex == 1) {
            
        }else {
            scrollToMenuIndex(index: 1)
            self.pageIndex = 1
            switchHeaderImagesColorsToIndex(index: 1)
        }
    }
    
 }
 
 extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    // MARK: - Collectionview configuration
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.item == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainScreenCellId, for: indexPath)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileScreenCellId, for: indexPath)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: containerCollectionView.frame.width, height: containerCollectionView.frame.height)
    }
    
    
    // MARK: - CollectionView ScrollView
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //If last offset was smaller than the current one, move items to the right, else move to left.
        let differenceOffsetX = scrollView.contentOffset.x - lastOffset
        updateImagesCenterX(xDistance: -(differenceOffsetX * moveFactor))
        updateImagesScale(xDistance: differenceOffsetX)
        lastOffset = scrollView.contentOffset.x
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pageIndex = Int(scrollView.contentOffset.x/view.frame.width)
        switchHeaderImagesColorsToIndex(index: self.pageIndex)
    }
    
    
    /**
     Scrolls the container collection view to a specific page
     - Parameters:
        - index: The desired page to be scrolled.
     */
    func scrollToMenuIndex(index: Int){
        let indexPath = IndexPath(item: index, section: 0)
        self.containerCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    // MARK: - Scroll Animations
    
    /**
     Updates the images scale as the scrolling happens based on each image scaleFactor
     - Parameters:
        - xDistance: The scroll offset variation
     
     - Attention: In this case we're using the scrolling distance to scale the items.
     */
    func updateImagesScale(xDistance: CGFloat) {
        self.profileImageScale.width += (profileImageScaleFactor.width * xDistance)
        self.profileImageScale.height += (profileImageScaleFactor.height * xDistance)
        self.homeImageScale.width += (homeImageScaleFactor.width * xDistance)
        self.homeImageScale.height += (homeImageScaleFactor.height * xDistance)
        self.profileImage.transform = CGAffineTransform(scaleX: self.profileImageScale.width, y: self.profileImageScale.height)
        self.homeImage.transform = CGAffineTransform(scaleX: self.homeImageScale.width, y: self.homeImageScale.height)
    }
    
    
    /**
     Changes the images center x with a value to be incremented or decremented.
     - Parameters:
     - xDistance: The distance value to be applied to the images center.
     */
    func updateImagesCenterX(xDistance: CGFloat){
        self.configImage.center.x += xDistance
        self.profileImage.center.x += xDistance
        self.homeImage.center.x += xDistance
    }
    
    /**
     Gets the scale rate of the item based on it's final size and the distance in which it should vary.
     - Parameters:
     - distance: The amount of distance left until the item destination.
     - initialSize: The item initial size
     - finalSize: The item final size at the end of the movement
     - Attention: In this case we should use the screen width, because we're moving the entire screen to resize the items.
     */
    func getItemScaleRate(distance: CGFloat, from initialSize: CGSize, to finalSize: CGSize) -> CGSize{
        
        //First we get the width and height difference from the initial state to the final
        let widthDifference = finalSize.width - initialSize.width
        let heightDifference = finalSize.height - initialSize.height
        
        if((widthDifference == 0 && heightDifference == 0) || distance == 0) {
            return CGSize(width: 0, height: 0)
        }
        
        //Then we store the percentage of growth of the frame from the beginning
        let widthGrowthPercentage = widthDifference/initialSize.width
        let heightGrowthPercentage = heightDifference/initialSize.height
        
        /*
         If the frame grew n% we just need to update the scale based on how much it should grow by each point moved.
         */
        let growthScalePercentagePerPoint = CGSize(width: widthGrowthPercentage/distance, height: heightGrowthPercentage/distance)
        
        return growthScalePercentagePerPoint
    }
 }

