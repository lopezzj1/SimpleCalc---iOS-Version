//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Jill Lopez on 10/21/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var operation = ""  //keeps track of the current operation
    var numsArray = [String]()  //stores the values tapped
    var isDecimal = false //a Boolean for if the user tapped the decimal
    
    @IBOutlet weak var answerOutput: UILabel!   //the grey answer area on the calculator
   
    
    //a function determines which numbers was tapped
    @IBAction func valueTapped(valueButton: UIButton) {
        if answerOutput.text == "0" {
            answerOutput.text = valueButton.titleLabel!.text! //calculator display
        } else {
            answerOutput.text =  answerOutput.text! + valueButton.titleLabel!.text! //calculator display
        }
    }
    
    //determines if the decimal button was tapped
    @IBAction func decimal(decButton : UIButton){
        isDecimal = true
    }
    
    //function that stores the current operation
    //and stores the current value into an array
    @IBAction func add(addButton: UIButton) {
        numsArray.append(answerOutput!.text!)
        operation = "+"
        answerOutput.text = "0"
    }
    
    //function that stores the current operation
    //and stores the current value into an array
    @IBAction func subtract(subButton: UIButton) {
        numsArray.append(answerOutput!.text!)
        operation = "-"
        answerOutput.text = "0"
    }
    
    //function that stores the current operation
    //and stores the current value into an array
    @IBAction func multiply(mulButton: UIButton) {
        numsArray.append(answerOutput!.text!)
        operation = "*"
        answerOutput.text = "0"
    }
    
    @IBAction func divide(divideButton: UIButton) {
        numsArray.append(answerOutput!.text!)
        operation = "÷"
        answerOutput.text = "0"
    }
    
    //function that stores the current operation
    //and stores the current value into an array
    @IBAction func mod(subButton: UIButton) {
        numsArray.append(answerOutput!.text!)
        operation = "%"
        answerOutput.text = "0"
    }
    
    //outputs the factorial of a value
    @IBAction func factorial(factButton : UIButton){
        operation = "fact"
        numsArray.append(answerOutput!.text!)
        
        if isDecimal == false {
            var answer = Int(numsArray[0])
            for var index = answer! - 1; index > 0; index-- {
                answer = answer! * index
            }
            
            //print(String(answer))
            answerOutput.text = String(answer!)
        } else if isDecimal == true {
            var answer = Double(numsArray[0])
            
            for var index = answer! - 1; index > 0; index-- {
                answer = answer! * index
            }
            
            //print(String(answer))
            answerOutput.text = String(answer!)
        }
    }
    
    //function that stores the current operation
    //and stores the current value into an array
    @IBAction func average(avgButton : UIButton){
        operation = "average"
        numsArray.append(answerOutput!.text!)
        answerOutput.text = "0"
    }
    
    //outputs the number of values in the array
    @IBAction func count(countValues : UIButton){
        numsArray.append(answerOutput!.text!)
        let numValues = numsArray.count
        answerOutput.text = "\(numValues)"
    }
    
    //clears the operations and the array
    @IBAction func clear(obj: AnyObject) {
        answerOutput.text = "0"
        operation = ""
        numsArray = [String]()
        isDecimal = false
        //print("clear")
    }
    
    //returns the value for each operation
    @IBAction func equals (obj: AnyObject) {
        
        //if the values are Int values
        if isDecimal == false {
            
            var answer = 0
            print(numsArray)
            
            if operation == "+" {
                numsArray.append(answerOutput!.text!)
                
                for var index = 0; index < numsArray.count; index++ {
                    let number = Int(numsArray[index])
                    answer += number!
                }
                
                answerOutput.text = "\(answer)"
                //print(answer)
                
            } else if operation == "-" {
                numsArray.append(answerOutput!.text!)
                answer = Int(numsArray[0])!
                
                for var index = 1; index < numsArray.count; index++ {
                    let newValue = Int(numsArray[index])
                    answer -= newValue!
                }
                
                answerOutput.text = "\(answer)"
                //print(answer)
                
            } else if operation == "*" {
                
                numsArray.append(answerOutput!.text!)
                answer = Int(numsArray[0])!
                
                for var index = 1; index < numsArray.count; index++ {
                    let newValue = Int(numsArray[index])
                    answer *= newValue!
                }
                
                answerOutput.text = "\(answer)"
                //print(answer)
                
            } else if operation == "÷" {

                numsArray.append(answerOutput!.text!)
                answer = Int(numsArray[0])!
                
                for var index = 1; index < numsArray.count; index++ {
                    let newValue = Int(numsArray[index])
                    answer /= newValue!
                }
                
                answerOutput.text = "\(answer)"
                //print(answer)

                
            } else if operation == "%" {
                
                numsArray.append(answerOutput!.text!)
                answer = Int(numsArray[0])!
                
                for var index = 1; index < numsArray.count; index++ {
                    let newValue = Int(numsArray[index])
                    answer %= newValue!
                }
                
                answerOutput.text = "\(answer)"
                //print(answer)
                
            } else if operation == "average" {
                for var index = 0; index < numsArray.count; index++ {
                    answer += Int(numsArray[index])!
                }
                
                answer = answer/numsArray.count
                //print(answer)
                answerOutput.text = String(answer)
            }
        
        //if the values in the array are doubles
        } else if isDecimal == true {
            var answer = 0.0
            
            if operation == "+" {
                
                numsArray.append(answerOutput!.text!)
                
                for var index = 0; index < numsArray.count; index++ {
                    let number = Double(numsArray[index])
                    answer += number!
                }
                
                answerOutput.text = "\(answer)"
                //print(answer)
                
            } else if operation == "-" {
                
                numsArray.append(answerOutput!.text!)
                answer = Double(numsArray[0])!
                
                for var index = 1; index < numsArray.count; index++ {
                    let newValue = Double(numsArray[index])
                    answer -= newValue!
                }
                
                answerOutput.text = "\(answer)"
                print(answer)
                
            } else if operation == "*" {
                
                numsArray.append(answerOutput!.text!)
                answer = Double(numsArray[0])!
                
                for var index = 1; index < numsArray.count; index++ {
                    let newValue = Double(numsArray[index])
                    answer *= newValue!
                }
                
                answerOutput.text = "\(answer)"
                print(answer)
                
            }  else if operation == "÷" {
                numsArray.append(answerOutput!.text!)
                answer = Double(numsArray[0])!
                
                for var index = 1; index < numsArray.count; index++ {
                    let newValue = Double(numsArray[index])
                    answer /= newValue!
                }
                
                answerOutput.text = "\(answer)"
                //print(answer)
                
                
            } else if operation == "%" {
                
                numsArray.append(answerOutput!.text!)
                answer = Double(numsArray[0])!
                
                for var index = 1; index < numsArray.count; index++ {
                    let newValue = Double(numsArray[index])
                    answer %= newValue!
                }
                
                answerOutput.text = "\(answer)"
                print(answer)
                
            }  else if operation == "average" {
                
                for var index = 0; index < numsArray.count; index++ {
                    answer += Double(numsArray[index])!
                }
                
                answer = answer/Double(numsArray.count)
                print(answer)
                
                answerOutput.text = String(answer)
            }
        }
        
    }
}

