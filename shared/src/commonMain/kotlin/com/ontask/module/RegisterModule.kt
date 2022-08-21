package com.ontask.module

import com.ontask.model.Child
import com.ontask.model.Parent

/**
 * Register module
 *
 * @constructor Create empty Register module
 */
class RegisterModule {

    /**
     * Check validation of the account
     *
     * @param username
     * @param password
     * @return
     */
    fun checkValidation(username: String, password: String): Boolean{

        return true
    }

    /**
     * Create family
     *
     * @param name
     * @param parents
     * @param children
     * @return
     */
    fun createFamily(name: String, parents: ArrayList<Parent>, children: ArrayList<Child>): Boolean{

        return false
    }

    /**
     * Register
     *
     * @param username
     * @param password
     * @return
     */
    fun register(username: String, password: String): Boolean{
        var validation: Boolean = checkValidation(username, password)

        return validation
    }
}