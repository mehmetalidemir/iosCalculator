//
//  ViewController.swift
//  iOSCalculator
//
//  Created by Mehmet Ali Demir on 18.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var islemLabel: UILabel!
    @IBOutlet weak var sonucLabel: UILabel!

    var bosText: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        tumunuTemizle()
    }

    func tumunuTemizle()
    {
        bosText = ""
        islemLabel.text = "0"
        sonucLabel.text = "0"
    }


    @IBAction func resetButton(_ sender: Any) {
        tumunuTemizle()
    }

    @IBAction func toplaButton(_ sender: Any) {
        islemEkle(deger: "+")
    }

    @IBAction func sonucButton(_ sender: Any) {
        if(girilenDeger())
        {
            let yuzdeKontrol = bosText.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: yuzdeKontrol)
            let sonuc = expression.expressionValue(with: nil, context: nil) as! Double
            let sonucString = sonucFormat(result: sonuc)
            sonucLabel.text = sonucString
        }
        else
        {
            let alert = UIAlertController(
                title: "Hata!",
                message: "Lütfen Geçerli İşlem Yapınız",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }


    func girilenDeger() -> Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()

        for char in bosText
        {
            if(ozelKarakter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }

        var previous: Int = -1

        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }

            if(index == bosText.count - 1)
            {
                return false
            }

            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }

        return true
    }


    func ozelKarakter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }

    func sonucFormat(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }

    func islemEkle(deger: String)
    {
        bosText = bosText + deger
        islemLabel.text = bosText
    }

    @IBAction func sifir(_ sender: Any) {
        islemEkle(deger: "0")
    }
    @IBAction func bir(_ sender: Any) {
        islemEkle(deger: "1")
    }
    @IBAction func iki(_ sender: Any) {
        islemEkle(deger: "2")
    }
    @IBAction func uc(_ sender: Any) {
        islemEkle(deger: "3")
    }
    @IBAction func dort(_ sender: Any) {
        islemEkle(deger: "4")
    }
    @IBAction func bes(_ sender: Any) {
        islemEkle(deger: "5")
    }
    @IBAction func alti(_ sender: Any) {
        islemEkle(deger: "6")
    }
    @IBAction func yedi(_ sender: Any) {
        islemEkle(deger: "7")
    }
    @IBAction func sekz(_ sender: Any) {
        islemEkle(deger: "8")
    }
    @IBAction func dokuz(_ sender: Any) {
        islemEkle(deger: "9")
    }
    @IBAction func noktaButton(_ sender: Any) {
        islemEkle(deger: ".")
    }
}

