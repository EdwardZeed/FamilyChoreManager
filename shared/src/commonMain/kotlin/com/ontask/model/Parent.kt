package com.ontask.model

/**
 * Parent
 *
 * @constructor
 *
 * @param userID
 * @param name
 * @param dateOfBirth
 * @param chooseTheme
 * @param avatarPic
 */
data class Parent(
    val userID: Int = 0,
    var name: String,
    var dateOfBirth: String,
    var chooseTheme: Theme?,
    var avatarPic: String?){
    var qrCodes: ArrayList<QRcode> = ArrayList()
    var choress: ArrayList<ChoreTask>? = ArrayList()
    var contracts: ArrayList<Contract> = ArrayList()

}