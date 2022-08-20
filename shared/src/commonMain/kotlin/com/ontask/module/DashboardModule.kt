package com.ontask.module

import com.ontask.model.*


class DashboardModule {

    fun addChild(name: String, dateOfBirth: String): Boolean {

        return false
    }

    fun assignTask(choreTask: ChoreTask, parent: Parent, child: Child){

    }

    fun createChore(name: String, description: String, achievements: ArrayList<Achievement>){

    }

    fun listChores(): ArrayList<ChoreTask>?{

        return null
    }

    fun createContract(){

    }

    fun listContracts(): ArrayList<ChoreTask>?{

        return null
    }

    fun createAchievement(points: Int, message: String): Achievement?{
        return null
    }

    fun listChildren(): ArrayList<Child>?{
        return null
    }

    fun changeTheme(theme: Theme): Boolean{
        return false
    }

    fun editProfile(user: User, name: String,dateOfBirth: String): Boolean{
        return false
    }

}