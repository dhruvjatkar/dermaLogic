

import UIKit
import AVKit
import Vision

var measles = [Float]()
var benignMoles = [Float]()
var malignantMelanoma = [Float]()
var ringWorm = [Float]()
var diagnoses = [String]()
var percentDiagnoses = [String]()

class Classifier: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // here is where we start up the camera
        // for more details visit: https://www.letsbuildthatapp.com/course_video?id=1252
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
      
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
       
        guard let model = try? VNCoreMLModel(for: ImageClassifier().model) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            guard let firstObservation = results.first else { return }
            
            print(firstObservation.identifier)//, firstObservation.confidence)
            
            var Identifier: String
            
            Identifier = firstObservation.identifier
        
            
            if ((measles.count < 150) && (malignantMelanoma.count < 150) && (benignMoles.count < 150) && (ringWorm.count < 150)){
            if (Identifier == "Measles") {
                measles.append(Float(firstObservation.confidence))
                print(measles)
            }
                if (Identifier == "Malignant Melanoma") {
                    malignantMelanoma.append(Float(firstObservation.confidence))
                    print(malignantMelanoma)
                }
                
                if (Identifier == "Ringworm") {
                    ringWorm.append(Float(firstObservation.confidence))
                    print(ringWorm)
                }
                
                if (Identifier == "Benign Moles") {
                    benignMoles.append(Float(firstObservation.confidence))
                    print(benignMoles)
                }
                
            } else {
                
                var sumMM = ((malignantMelanoma.reduce(0, +) / 150) * 100)
                var sumBNM = ((benignMoles.reduce(0, +) / 150) * 100)
                var sumRi = ((ringWorm.reduce(0, +) / 150) * 100)
                var sumMea = ((measles.reduce(0, +) / 150) * 100)
                
        let sumArray = [sumMM, sumBNM, sumRi, sumMea]
                
                if(sumMM == sumArray.max()!){
                    print("You Have Malignant Melanoma")
                    diagnoses.append("malignantMelanoma")
                     DispatchQueue.main.async {
                    let profileViewController = self.storyboard?.instantiateViewController(withIdentifier:
                        "ProfileViewController") as! ProfileViewController
                    
                    self.present(profileViewController, animated: true);
                }
                    
                }
                
                if(sumBNM == sumArray.max()!){
                    print("You Have A Benign Mole")
                    diagnoses.append("benignMole")
                    DispatchQueue.main.async {
                        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier:
                            "ProfileViewController") as! ProfileViewController
                        
                        self.present(profileViewController, animated: true);
                    }
                    
                }
                if(sumMea == sumArray.max()!){
                    print("You Have Measles")
                    diagnoses.append("Measles")
                    DispatchQueue.main.async {
                        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier:
                            "ProfileViewController") as! ProfileViewController
                        
                        self.present(profileViewController, animated: true);
                    }
                    
                }
                if(sumRi == sumArray.max()!){
                    print("You Have Ring Worm")
                    diagnoses.append("Ringworm")
                    DispatchQueue.main.async {
                        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier:
                            "ProfileViewController") as! ProfileViewController
                        
                        self.present(profileViewController, animated: true);
                    }
                    
                }
                
                
                
            }
         
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
    
}






