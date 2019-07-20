//
//  ViewController.swift
//  cameraClone
//
//  Created by 池内将真 on 2019/07/15.
//  Copyright © 2019 WAKUike. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var pictureImage: UIImageView!
    @IBAction func cameraButtonAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "確認", message: "選択してください", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
        
            let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler: { (action:UIAlertAction) in
                
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            
        alertController.addAction(cameraAction)
        
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
                let photoLibraryAction = UIAlertAction(title: "フォトライブラリ", style: .default, handler: { (action:UIAlertAction) in
                    
                    let imagePickerController = UIImagePickerController()
                    imagePickerController.sourceType = .photoLibrary
                    imagePickerController.delegate = self
                    self.present(imagePickerController, animated: true, completion: nil)
                })
        alertController.addAction(photoLibraryAction)
            }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        alertController.popoverPresentationController?.sourceView = view
        present(alertController, animated: true, completion: nil)
        
           }
    
}

    @IBAction func SNSButtonAction(_ sender: Any) {
        
        func SNSButtonAction(_ sender: Any) {
            if let shareImage = pictureImage.image {
                let shareItems = [shareImage]
                let controller = UIActivityViewController(activityItems: shareItems ,applicationActivities: nil)
                controller.popoverPresentationController?.sourceView = view
                present(controller, animated: true, completion: nil)
            }
            
        }
        
        func imagePickerController(_ picker: UIImagePickerController , didFinishPickingMediaWithInfo
            info: [UIImagePickerController.InfoKey : Any]){
            pictureImage.image = info[UIImagePickerController . InfoKey.originalImage] as? UIImage
            dismiss(animated: true, completion: nil)
        }
    }
}
