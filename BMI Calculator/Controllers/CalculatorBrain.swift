import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format:"%.1f", bmi?.value ?? 0.0)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        
        let bmiValue = weight / pow(height, 2)
        switch bmiValue {
        case 0..<18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        case 18.5...24.9:
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        case 24.9...:
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.6285375953, green: 0.1133165434, blue: 0.1126715019, alpha: 1))
        default:
            bmi = BMI(value: 0.0, advice: "Somthing wrong!", color: .gray)
        }
 
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Somthing wrong!"
    }
    
    

    
    
}
