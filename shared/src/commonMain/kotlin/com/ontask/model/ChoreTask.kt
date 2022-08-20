package com.ontask.model

class ChoreTask(var taskID:Int, var name: String, var description: String, var achievements: ArrayList<Achievement>, var iconImage: String) {
    var children: ArrayList<Child> = ArrayList()

}