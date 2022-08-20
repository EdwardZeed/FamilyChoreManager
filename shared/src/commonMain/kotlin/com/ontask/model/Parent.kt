package com.ontask.model

class Parent(name: String, dateOfBirth: String): User(name, dateOfBirth){
    var qrCodes: ArrayList<QRcode> = ArrayList()


}