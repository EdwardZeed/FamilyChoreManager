package com.ontask.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.focusable
import androidx.compose.foundation.layout.*
import androidx.compose.material.Card
import androidx.compose.material.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

class AssignChores : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            assignChoresPage()

        }
    }

}

@Composable
@Preview
fun assignChoresPage() {

    var paddingState by remember { mutableStateOf(16.dp) }
    val padding by animateDpAsState(
        targetValue = paddingState,
        tween(durationMillis = 1000)
    )

    Box(
        modifier = Modifier
            .fillMaxSize()
            .focusable()
            .background(color = Color.White)
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.fillMaxSize()
        ) {
            Row(
                modifier = Modifier
                    .padding(20.dp)
                    .fillMaxWidth(),
                horizontalArrangement = Arrangement.Center
            ) {
                Text(text = "hihihi this is assign chores page!!")
            }

            // reference: https://www.geeksforgeeks.org/card-in-android-jetpack-compose/
            Card(
                modifier = Modifier
                    .padding(20.dp),
                border = BorderStroke(2.dp, Color.Black)
            ) {
                Column(
                    modifier = Modifier
                        .padding(20.dp) // TODO: make this the width of the screen minus a bit
                ){
                    Text(text = "hihihi this is assign chores page!!")
                }

//                Column(Modifier.padding(10.dp)) {
//                    Text("GeeksforGeeks", fontWeight = FontWeight.W700)
//                    Text("+91 1800 2584458")
//                    Text("Noida, India", color = Color.Gray)
//                }
            }
        }
    }
}