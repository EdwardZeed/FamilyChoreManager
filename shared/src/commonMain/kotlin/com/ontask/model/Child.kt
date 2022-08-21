package com.ontask.model

/**
 * Child
 * subclass of User
 *
 * @constructor
 *
 * @param name
 * @param dateOfBirth
 */
class Child(name: String, dateOfBirth: String): User(name, dateOfBirth) {
    var qrCode: QRcode ?= null
    var totalCreditPoint: Int = 0

}