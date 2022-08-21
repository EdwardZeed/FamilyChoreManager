package com.ontask.model

/**
 * Contract
 *
 * @property name
 * @property sponser
 * @property receiver
 * @property maxPoint
 * @property rewards
 * @property detail
 * @constructor Create empty Contract
 */
data class Contract(
    var name: String,
    var sponser: Parent,
    var receiver: Child,
    var maxPoint: Int,
    var rewards: HashMap<Int, Reward>,
    var detail: String?)