//
//  HomePageVC.swift
//  DemoApplication
//
//  Created by sachin toskar on 12/08/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
    @IBOutlet var booksCollectionView: UICollectionView!
    @IBOutlet var comicCollectionView: UICollectionView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var viewIcon: UIView!
    
    var image: [UIImage] = [UIImage(named: "book2")!,UIImage(named: "book1")!,UIImage(named: "book2")!,UIImage(named: "book1")!]
    var name: [String] = ["Swami Vivekanad","The best of ruskin bound",
         "Swami Vivekanad","The best of ruskin bound",]
    
       var image1: [UIImage] = [UIImage(named: "book1")!,UIImage(named: "book2")!,UIImage(named: "book1")!,UIImage(named: "book2")!]
     var name1: [String] = ["Swami Vivekanad","The best of ruskin bound",
          "Swami Vivekanad","The best of ruskin bound",]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigation bar
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        //Collectionview shape
        booksCollectionView.layer.cornerRadius = 10
        comicCollectionView.layer.cornerRadius = 10
        //view
        viewIcon.layer.cornerRadius = 10
        //image in circler
        let radius = img.frame.width/2.0
        img.layer.cornerRadius = radius
        img.layer.masksToBounds = true
    }
    
    //Button Action
    @IBAction func logoutBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    //collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == booksCollectionView{
            return image.count
        }else{
            return image1.count
        }
    }
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == booksCollectionView{
            let cell = booksCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BooksCell
            cell.backgroundColor = .black
            cell.booksImg.image = image[indexPath.row]
            cell.layer.cornerRadius = 10
            return cell
        }else{
            let cell1 = comicCollectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! comicCell
            cell1.backgroundColor = .black
            cell1.comicBooks.image = image1[indexPath.row]
            cell1.layer.cornerRadius = 10
            return cell1
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == booksCollectionView{
            let vc = storyboard!.instantiateViewController(identifier: "bookDetailVC") as! bookDetailVC
            vc.img = image[indexPath.row]
            vc.name =  name[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        } else{
            let vc = storyboard!.instantiateViewController(identifier: "bookDetailVC") as! bookDetailVC
            vc.img = image1[indexPath.row]
            vc.name =  name1[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
   









































