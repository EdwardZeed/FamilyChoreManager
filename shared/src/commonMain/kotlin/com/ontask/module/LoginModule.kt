package com.ontask.module

/**
 * Login module
 *
 * @constructor Create empty Login module
 */
class LoginModule() {

    /**
     * Authenticate
     *
     * @param username
     * @param password
     * @return
     */
    fun authenticate(username: String, password: String): Boolean{
        if(username == "SOFT3888" && password == "1234"){
            return true
        }

        return false
    }
}