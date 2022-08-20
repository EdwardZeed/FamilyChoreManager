package com.ontask.module

class LoginModule() {

    fun authenticate(username: String, password: String): Boolean{
        if(username == "SOFT3888" && password == "1234"){
            return true
        }

        return false
    }
}