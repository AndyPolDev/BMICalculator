import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        print(String(format:"%.2f", sender.value))
        heightLabel.text = String(format:"%.2f", sender.value) + "m"
        
    }
    
    @IBAction func weightSliderChaneged(_ sender: UISlider) {
        print(String(format:"%.0f", sender.value))
        weightLabel.text = String(format:"%.0f", sender.value) + "Kg"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.bmiColor = calculatorBrain.getColor()
            destinationVC.bmiAdvice = calculatorBrain.getAdvice()
            
        }
    }
}


