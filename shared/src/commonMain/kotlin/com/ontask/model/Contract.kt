package com.ontask.model

class Contract(var name: String, var sponser: Parent, var receiver: Child, var maxPoint: Int, var rewards: HashMap<Int, Reward>, var detail: String?) {

}