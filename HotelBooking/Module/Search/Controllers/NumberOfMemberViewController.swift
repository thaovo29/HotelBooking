//
//  NumberOfMemberViewController.swift
//  HotelBooking
//
//  Created by MacOS on 20/12/2022.
//

import UIKit

class NumberOfMemberViewController: UIViewController {

    @IBOutlet weak var lblChildren: UILabel!
    @IBOutlet weak var lblAdult: UILabel!
    @IBOutlet weak var lblRoom: UILabel!
    @IBOutlet weak var childrenNumber: UILabel!
    @IBOutlet weak var roomAdult: UILabel!
    @IBOutlet weak var roomNumber: UILabel!
    @IBOutlet weak var viewChildren: UIView!
    @IBOutlet weak var viewAdult: UIView!
    @IBOutlet weak var viewRoom: UIView!
    var callBack : ((Int, Int, Int) -> Void)?
    var adult : Int?
    var room : Int?
    var child : Int?
    var vm = NumberOfMemberVM()
    func setUIRoom(){
        if vm.rooms ?? 0 > 1 {
            lblRoom.text = "Rooms"
        } else {
            lblRoom.text = "Room"
        }
        roomNumber.text = String(vm.rooms ?? 1)
    }
    @IBAction func plusRoom(_ sender: Any) {
        vm.inscreaseRoom()
        setUIRoom()
    }
    
    @IBAction func minusRoom(_ sender: Any) {
        vm.decreaseRoom()
        setUIRoom()
    }
    
    func setUIAdult(){
        if vm.adults ?? 0 > 1 {
            lblAdult.text = "Adults"
        }
        else{
            lblAdult.text = "Adult"
        }
            roomAdult.text = String(vm.adults ?? 1)
    }
    
    @IBAction func plusAdult(_ sender: Any) {
        vm.inscreaseAdult()
        setUIAdult()
    }
    
    @IBAction func minusAdult(_ sender: Any) {
        vm.decreaseAdult()
        setUIAdult()
    }
    func setUIChildren(){
        if vm.children ?? 0 != 1 {
            lblChildren.text = "Children"
        } else {
            lblChildren.text = "Child"
        }
            childrenNumber.text = String(vm.children ?? 1)
    }
    @IBAction func plusChildren(_ sender: Any) {
        vm.inscreaseChildren()
        setUIChildren()
    }
    
    @IBAction func minusChildren(_ sender: Any) {
        vm.decreaseChildren()
        setUIChildren()
    }
    
    @IBAction func returnResult(_ sender: Any) {
        self.callBack?(vm.rooms ?? 1, vm.adults ?? 1, vm.children ?? 0)
        self.dismiss(animated: true)

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vm.mapData(adults: self.adult, children: self.child, room: self.room)
        setupUI()
        setUIAdult()
        setUIRoom()
        setUIChildren()
    }
    
    func bindData(room: Int?, adult: Int?, children: Int?){
        self.adult = adult
        self.room = room
        self.child = children
    }
    
    func setupUI(){
        viewRoom.layer.cornerRadius = 8
        HomeManager.shared.makeShadow(view: viewRoom)
        
        viewAdult.layer.cornerRadius = 8
        HomeManager.shared.makeShadow(view: viewAdult)
        
        viewChildren.layer.cornerRadius = 8
        HomeManager.shared.makeShadow(view: viewChildren)
    }

    
    
}
