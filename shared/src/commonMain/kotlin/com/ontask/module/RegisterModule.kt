package com.ontask.module

import com.ontask.model.Child
import com.ontask.model.Parent

class RegisterModule {

    fun checkValidation(username: String, password: String): Boolean{

        return true
    }

    fun createFamily(name: String, parents: ArrayList<Parent>, children: ArrayList<Child>): Boolean{

        return false
    }

    fun register(username: String, password: String): Boolean{
        var validation: Boolean = checkValidation(username, password)

        return validation
    }
}