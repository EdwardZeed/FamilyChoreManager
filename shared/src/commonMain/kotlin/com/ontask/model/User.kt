package com.ontask.model

open class User(var name: String, var dateOfBirth: String) {
    var userID: Int = 0
    var chooseTheme: Theme? = null
    var avatarPic: String? = null
    var choress: ArrayList<ChoreTask>? = ArrayList()
    var contracts: ArrayList<Contract> = ArrayList()

}
