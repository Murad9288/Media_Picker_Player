//
//  ViewController.swift
//  CustomVideoPlayer
//
//  Created by Md Murad Hossain on 1/12/22.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var videoViewP: UIView!
    
    @IBOutlet weak var plusButton: UIButton!
    
    var avPlayer: AVPlayer!
    var avpController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func videoAddButtion(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.mediaTypes = ["public.movie"]
        pickerController.sourceType = .savedPhotosAlbum
        pickerController.modalPresentationStyle = .fullScreen
        self.present(pickerController, animated: true, completion: nil)
        
    }
}

extension ViewController:  UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let movieUrl = info[.mediaURL] as? URL else { return }
        avPlayer = AVPlayer(url: movieUrl)
        avpController.player = avPlayer
        avpController.view.frame.size.height = videoViewP.frame.size.height
        avpController.view.frame.size.width = videoViewP.frame.size.width
        self.videoViewP.addSubview(avpController.view)
        avPlayer.play()
    }
}

extension ViewController: UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
