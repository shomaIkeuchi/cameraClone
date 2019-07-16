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
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("カメラは利用できます")
            
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.delegate = self
            present(imagePickerController , animated: true, completion: nil)
        } else {
            print("カメラは利用できません")
           }
    
        func SNSButtonAction(_ sender: Any) {
            if let shareImage = pictureImage.image {
               let shareItems = [shareImage]
                let controller = UIActivityViewController(activityItems: shareItems ,
                                                          applicationActivities: nil)
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
