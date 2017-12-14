//
//  ViewController.swift
//  公私钥匙RSA加解密
//
//  Created by macbook pro on 2017/12/14.
//  Copyright © 2017年 macbook pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var originTxt: UITextView!

    @IBOutlet weak var signTxt: UITextView!

    @IBOutlet weak var Txt: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unsign(_ sender: Any) {
        //公钥路径
        let path = Bundle.main.path(forResource: "rsa_public_keyofSSO", ofType: "pem")
        //导入公钥
        let ioOK = QDRSAHandler.share().importKey(with: .public, andPath: path)
        //导入成功,验证签名
        if ioOK{
            let unrasStr : Bool = QDRSAHandler.share().verifyString(self.originTxt.text, withSign: self.signTxt.text)
            if unrasStr{
                print("解密成功 😆")
            }
        }


    }

    //私钥签名
    @IBAction func sign(_ sender: UIButton) {

        //私钥路径
        let path = Bundle.main.path(forResource: "rsa_private_key_ofSSO", ofType: "pem")
        //导入私钥
        let  isOk :Bool = QDRSAHandler.share().importKey(with: .private, andPath: path)
        //导入成功后加密
        if isOk{
            let rasStr : String  =   QDRSAHandler.share().sign(self.originTxt.text)

            if rasStr.count != 0 {
                print("加密成功")
                self.signTxt.text = rasStr
            }
        }


    }




}

