package com.ontask.model

/**
 * User
 *
 * @property name
 * @property dateOfBirth
 * @constructor Create empty User
 */
open class User(var name: String, var dateOfBirth: String) {
    var userID: Int = 0
    var chooseTheme: Theme? = null
    var avatarPic: String? = null
    var choress: ArrayList<ChoreTask>? = ArrayList()
    var contracts: ArrayList<Contract> = ArrayList()

}
