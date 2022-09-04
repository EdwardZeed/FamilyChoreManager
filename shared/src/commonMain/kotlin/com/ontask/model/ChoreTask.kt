package com.ontask.model

/**
 * Chore task
 *
 * @property taskID
 * @property name
 * @property description
 * @property achievements
 * @property iconImage
 * @constructor Create empty Chore task
 */
data class ChoreTask(
    var taskID:Int,
    var name: String,
    var description: String,
    var achievement: Achievement,
    var iconImage: String) {
    var children: ArrayList<Child> = ArrayList()
}