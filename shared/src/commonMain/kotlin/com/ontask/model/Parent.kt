package com.ontask.model

/**
 * Parent
 * subclass of User
 *
 * @constructor
 *
 * @param name
 * @param dateOfBirth
 */
class Parent(name: String, dateOfBirth: String): User(name, dateOfBirth){
    var qrCodes: ArrayList<QRcode> = ArrayList()


}