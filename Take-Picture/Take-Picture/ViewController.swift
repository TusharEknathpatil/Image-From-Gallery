//
//  ViewController.swift
//  Take-Picture
//
//  Created by Mac on 01/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPic: UIImageView!
    
    @IBOutlet weak var takeAPic: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        allDesignView()
    }

    @IBAction func buttonTakePic(_ sender: Any) {
        let alertController = UIAlertController(title: "Select Image ", message: "select Image From?", preferredStyle: .actionSheet)
        let cameraBtn = UIAlertAction(title: "Camera", style: .default) {
            (_) in
            self.showImagePicker(selectedSource: .camera)
            
        }
        let gallery = UIAlertAction(title: "Gallery", style: .default) {
            (_) in
            self.showImagePicker(selectedSource: .photoLibrary)

        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cameraBtn)
        alertController.addAction(gallery)
        alertController.addAction(cancelBtn)
        self.present(alertController, animated: true,completion: nil)
    }
    
    
    func allDesignView() {
        self.imgPic.backgroundColor = .secondarySystemBackground
        self.takeAPic.backgroundColor = .systemBlue
        self.takeAPic.titleLabel?.textColor = .black
    
    }
}

extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func showImagePicker(selectedSource:UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("Something Not Supported Camera")
            return
        }
        
        let imagePicKer = UIImagePickerController()
        imagePicKer.delegate = self
        imagePicKer.sourceType = selectedSource
        imagePicKer.allowsEditing = false
        self.present(imagePicKer, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
            imgPic.image = selectedImage
        } else {
            print("Image NOt Found ")
        }
        picker.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
