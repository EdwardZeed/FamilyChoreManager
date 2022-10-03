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
    var sponserName: String,
    var sponserId: String,
    var receiverName: String,
    var receiverId: String,
    var maxPoint: Int,
    var rewardList: List<String>,
    var pointList: List<Int>,
    var detail: String?)