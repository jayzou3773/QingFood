//
//  ImagePickView.swift
//  QingFood
//
//  Created by 吴卓航 on 2023/5/28.
//

import SwiftUI
import Vision
import CoreML

struct ImagePickView: View {
    let InputSize = CGSize(width: 416, height: 416)
    
    @State private var showImagePicker = false
    //这里的image用于放置等会获取的照片
    @State private var image: UIImage = UIImage()
    @State private var showCalories = false
    //显示网络结果
    @State private var model: VNCoreMLModel?
    @State private var detectionResult: [VNRecognizedObjectObservation] = []
    
    @State private var item: FoodIntroduction = FoodInfo[1]
    
    /*
    init(){
        guard let modelURL = Bundle.main.url(forResource: "YOLOv3FP16", withExtension: "mlmodelc") else {
            fatalError("Failed to load model file.")
        }
        do {
            let coreMLModel = try VNCoreMLModel(for: MLModel(contentsOf: modelURL))
            model = coreMLModel
        } catch {
            fatalError("Failed to create model instance: \(error)")
        }
        // print("initialize successfully")
    }
     */
    
    var body: some View {
        VStack {
            List{
                Button(action: {
                    showImagePicker = true
                }, label: {
                    Text("Select Image")
                })
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Button(action:{
                    showCalories = true
                    performObjectDetection(image: image)
                    for result in detectionResult{
                        GetEntity(name: result.labels[0].identifier)
                    }
                }, label: {
                    Text("Detect Objects")
                })
                
                
                VStack {
                    List(detectionResult, id: \.self) { result in
                        Text("\(result.labels[0].identifier) - \(result.labels[0].confidence)")
                    }
                }
                
            }
            .sheet(isPresented: $showImagePicker,
                   content: {
                ImagePicker(sourceType: .photoLibrary) { image in
                    self.image = image
                }
            })
            .sheet(isPresented: $showCalories, content: {
                CaloriesList(item: item)
            })
            .onAppear{
                loadModel()
            }
        }
    }
    
    func resizeCGImage(_ image: CGImage, to newSize: CGSize) -> CGImage? {
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let context = CGContext(data: nil, width: Int(newSize.width), height: Int(newSize.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil
        }
        
        context.interpolationQuality = .high
        context.draw(image, in: rect)
        
        guard let resizedImage = context.makeImage() else {
            return nil
        }
        
        return resizedImage
    }

    
    func loadModel(){
        guard let modelURL = Bundle.main.url(forResource: "YOLOv3FP16", withExtension: "mlmodelc") else {
            fatalError("Failed to load model file.")
        }
        do {
            model = try VNCoreMLModel(for: MLModel(contentsOf: modelURL))
            //model = coreMLModel
        } catch {
            fatalError("Failed to create model instance: \(error)")
        }
    }

    func GetEntity(name: String) {
        if(item.category != FoodIntroduction.Category.empty){
            return
        }
        for entity in FoodInfo {
            if name == entity.name {
                item = entity
                break
            }
        }
    }
    
    func ResetItem(){
        item.category = FoodIntroduction.Category.empty
    }
    
    func performObjectDetection(image: UIImage) {
        if let cgImg = image.cgImage, let Model = model {
            if let reSizedcgImg = resizeCGImage(cgImg, to: InputSize){
                let handler = VNImageRequestHandler(cgImage: reSizedcgImg)
                
                let request = VNCoreMLRequest(model: Model) { request, error in
                    guard let results = request.results as? [VNRecognizedObjectObservation] else {
                        print("Object detection failed.")
                        return
                    }
                    detectionResult = results
                    //print("complete")
                }
                
                do {
                    try handler.perform([request])
                } catch {
                    print("Object detection request failed: \(error)")
                }
                
                detectionResult = (request.results as? [VNRecognizedObjectObservation])!
                
                //重制item类别
                item.category = FoodIntroduction.Category.empty
            } else { print("cannot convert to input size")}
        } else {
            print("failed to convert UIImage to CGImage")
        }
    }
}

struct ImagePickView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickView()
    }
}
