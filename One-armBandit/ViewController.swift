//
//  ViewController.swift
//  One-armBandit
//
//  Created by 三斗 on 5/12/16.
//  Copyright © 2016 com.streamind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var pickerView: UIPickerView!
  @IBOutlet weak var resultLabel: UILabel!
  var constellationArray = [UIImage]()
  
  var dataArray = ["双子座","狮子座","处女座","巨蟹座","金牛座","摩羯座","射手座","双鱼座","水瓶座","天蝎座"]
  var componenArray1 = [Int]()
  var componenArray2 = [Int]()
  var componenArray3 = [Int]()
  var rowsInPickerView = 100
  
  @IBAction func spin(sender: UIButton) {
    pickerView.selectRow(Int(arc4random_uniform(94)+3), inComponent: 0, animated: true)
    pickerView.selectRow(Int(arc4random_uniform(94)+3), inComponent: 1, animated: true)
    pickerView.selectRow(Int(arc4random_uniform(94)+3), inComponent: 2, animated: true)
    
    print(componenArray1[pickerView.selectedRowInComponent(0)],componenArray2[pickerView.selectedRowInComponent(1)],componenArray3[pickerView.selectedRowInComponent(2)])
    
    if componenArray1[pickerView.selectedRowInComponent(0)] == componenArray2[pickerView.selectedRowInComponent(1)] && componenArray2[ pickerView.selectedRowInComponent(1)] == componenArray3[pickerView.selectedRowInComponent(2)]{
      resultLabel.text = "Congratulations"
    }else{
      resultLabel.text = "Try Again"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    for _ in 0..<rowsInPickerView{
      componenArray1.append(Int(arc4random_uniform(10)))
      componenArray2.append(Int(arc4random_uniform(10)))
      componenArray3.append(Int(arc4random_uniform(10)))
    }
    configConstellationArray()
    pickerView.delegate = self
    pickerView.dataSource = self
    print(componenArray1,"\r\n",componenArray2,"\r\n",componenArray3)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func configConstellationArray(){
    constellationArray = UIImage().getImageSimple(dataArray)
  }

  
}
extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource{
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 100
  }
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 3
  }
  func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    return 100
  }
  func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return 100
  }
  
  func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
    let pickerImage = UIImageView()
    if component == 0{
      pickerImage.image = constellationArray[componenArray1[row]]
    }else if component == 1{
      pickerImage.image = constellationArray[componenArray2[row]]
    }else{
      pickerImage.image = constellationArray[componenArray3[row]]
    }
    return pickerImage
  }
}
extension UIImage{
  
  func getImageSimple(nameArray:[String]) -> [UIImage] {
    let imageArray = nameArray.map(getImageOneByOne)
    return imageArray
  }
  
  func getImageOneByOne(name:String) -> UIImage{
    return UIImage(named: name)!
  }
  
}
