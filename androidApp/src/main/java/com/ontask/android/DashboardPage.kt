package com.ontask.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.focusable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Card
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

class DashboardPage : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            dashboardPage()

        }
    }

}

@Composable
@Preview
fun dashboardPage() {

    // male/female icon
    Box(modifier = Modifier
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
                    .fillMaxWidth()
                    .padding(20.dp)
            ) {
                Image(
                    painter = painterResource(id = R.drawable.woman),
                    contentDescription = "parent icon",
                    modifier = Modifier
                        .height(80.dp)
                        .width(80.dp)
                        .padding(10.dp)
                )

                Box(modifier = Modifier.padding(10.dp)) {
                    Text(text = "Welcome!\n{username}")
                }
            }

            Row(
                modifier = Modifier
//                    .size(width = 200.dp, height = 200.dp)
                    .padding(10.dp)
                    .fillMaxWidth()
            ) {
                Image(
                    painter = painterResource(id = R.drawable.family_icon),
                    contentDescription = "family icon",
                    modifier = Modifier
                        .height(60.dp)
                        .width(60.dp)
                        .padding(10.dp)
                )

                Column(
                    modifier = Modifier.padding(20.dp)
                )
                {
                    Text(text = "Family list")
                }


            }

            childProfileCard()
            childProfileCard()
            childProfileCard()

        }
    }

}

@Composable
fun childProfileCard() {
    val configuration = LocalConfiguration.current
    val screenWidth = configuration.screenWidthDp.dp
    val cardWidth = screenWidth - 30.dp

    Card(
        modifier = Modifier
            .size(width = cardWidth, height = 120.dp),
        border = BorderStroke(1.5.dp, Color.White),
        elevation = 10.dp, // shadow around box
        shape = RoundedCornerShape(10.dp),

        ) {
        Column() {
            Row() {
                Image(
                    painter = painterResource(id = R.drawable.daughter),
                    contentDescription = "daughter icon",
                    modifier = Modifier
                        .height(70.dp)
                        .width(70.dp)
                        .padding(10.dp)
                )

                Column(
                    modifier = Modifier
                        .padding(23.dp)
                )
                {
                    Text(text = "{child name}")
                }
            }

            //TODO: centre this entire thing to the middle of the card, or right justify.
            Row() {

                Image(
                    painter = painterResource(id = R.drawable.medal_icon),
                    contentDescription = "medal icon",
                    modifier = Modifier
                        .height(40.dp)
                        .width(40.dp)
                        .padding(10.dp)
                )

                Column(modifier = Modifier.padding(10.dp)) {
                    Text(text = "{20}")
                }

                Image(
                    painter = painterResource(id = R.drawable.target_icon),
                    contentDescription = "target icon",
                    modifier = Modifier
                        .height(40.dp)
                        .width(40.dp)
                        .padding(10.dp)
                )

                Column(modifier = Modifier.padding(10.dp)) {
                    Text(text = "{20}")
                }

                Image(
                    painter = painterResource(id = R.drawable.trophy_icon),
                    contentDescription = "trophy icon",
                    modifier = Modifier
                        .height(40.dp)
                        .width(40.dp)
                        .padding(10.dp)
                )

                Column(modifier = Modifier.padding(10.dp)) {
                    Text(text = "{20}")
                }

            }
        }
    }
    Spacer(modifier = Modifier.padding(5.dp))
}