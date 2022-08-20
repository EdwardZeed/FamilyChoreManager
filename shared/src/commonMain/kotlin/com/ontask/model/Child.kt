package com.ontask.model

class Child(name: String, dateOfBirth: String): User(name, dateOfBirth) {
    var qrCode: QRcode ?= null
    var totalCreditPoint: Int = 0

}