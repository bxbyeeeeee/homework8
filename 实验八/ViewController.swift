//
//  ViewController.swift
//  实验八
//
//  Created by student on 2018/11/29.
//  Copyright © 2018年 2016110301. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var chooseLabel1: UILabel!
    @IBOutlet weak var chooseLabel2: UILabel!
    @IBOutlet weak var teanameTextField: UITextField!
    @IBOutlet weak var teaTableView: UITableView!
    
    @IBOutlet weak var stunameTextField: UITextField!
    @IBOutlet weak var stuTableView: UITableView!
    
    var teaArray = [String]()
    var stuArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teaArray.append("Thor")
        teaArray.append("Tony")
        teaArray.append("Steve")
        stuArray.append("Peter")
        stuArray.append("Natasha")
        stuArray.append("Clinton")
    }
    
    @IBAction func add1Clicked(_ sender: Any) {
        if let name1 = teanameTextField.text{
            teaArray.append(name1)
            teaTableView.reloadData()
        }
        teanameTextField.resignFirstResponder()
    }
    @IBAction func add2Clicked(_ sender: Any) {
        if let name2 = stunameTextField.text{
            stuArray.append(name2)
            stuTableView.reloadData()
        }
        stunameTextField.resignFirstResponder()
    }
    
    @IBAction func edit1Clicked(_ sender: Any) {
        if let row = teaTableView.indexPathForSelectedRow?.row{
            if let name1 = teanameTextField.text{
                teaArray[row] = name1
                teaTableView.reloadData()
            }
        }
    }
    @IBAction func edit2Clicked(_ sender: Any) {
        if let row = stuTableView.indexPathForSelectedRow?.row{
            if let name2 = stunameTextField.text{
                stuArray[row] = name2
                stuTableView.reloadData()
            }
        }
    }
    
    
    @IBAction func delete1Clicked(_ sender: Any) {
        teaTableView.isEditing = !teaTableView.isEditing
    }
    @IBAction func delete2Clicked(_ sender: Any) {
        stuTableView.isEditing = !stuTableView.isEditing
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == self.teaTableView){
            return teaArray.count
        }
        else{
            return stuArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == self.teaTableView){
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherTableViewCell
            let tea = teaArray[indexPath.row]
            cell1.teachername.text = tea
            cell1.teachername.sizeToFit()
            return cell1
        }
        else{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
            let stu = stuArray[indexPath.row]
            cell2.stuName.text = stu
            cell2.stuName.sizeToFit()
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView == self.teaTableView){
            chooseLabel1.text = "You choose: Teacher \(teaArray[indexPath.row])"
        }
        else{
            chooseLabel2.text = "You choose: Student \(stuArray[indexPath.row])"
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if(tableView == self.teaTableView){
                teaArray.remove(at: indexPath.row)
            }
            else{
                stuArray.remove(at: indexPath.row)
            }
            tableView.reloadData()
        }
    }
    

}


