package com.ontask.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

class ChildProfile : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            childProfilePage()
        }
    }

}

@Composable
@Preview
fun childProfilePage() {

    Box(modifier = Modifier
        .fillMaxSize()
        .focusable()
        .background(color = Color.White)
    ) {
        Column(
            horizontalAlignment = Alignment.Start,
            modifier = Modifier.fillMaxSize()
                .padding(20.dp)
        ) {
            Text(
                text = "{Child name}",
                fontWeight = FontWeight.Bold,
                fontSize = 20.sp
            )

            Spacer(modifier = Modifier.height(10.dp))

            Row() {

                Image(
                    painter = painterResource(id = R.drawable.daughter), // TODO: the icons from dashboard page branch need to be copied over to this branch
                    contentDescription = "daughter icon",
                    modifier = Modifier
                        .height(70.dp)
                        .width(70.dp)
                        .padding(10.dp)
                )

                Row(
                    modifier = Modifier
                        .height(70.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {

                    Image(
                        painter = painterResource(id = R.drawable.medal_icon),
                        contentDescription = "medal icon",
                        modifier = Modifier
                            .height(50.dp)
                            .width(50.dp)
                            .padding(10.dp)
                    )

                    Column(modifier = Modifier.padding(10.dp)) {
                        Text(text = "{20}")
                    }

                    Image(
                        painter = painterResource(id = R.drawable.target_icon),
                        contentDescription = "target icon",
                        modifier = Modifier
                            .height(50.dp)
                            .width(50.dp)
                            .padding(10.dp)
                    )

                    Column(modifier = Modifier.padding(10.dp)) {
                        Text(text = "{20}")
                    }

                    Image(
                        painter = painterResource(id = R.drawable.trophy_icon),
                        contentDescription = "trophy icon",
                        modifier = Modifier
                            .height(50.dp)
                            .width(50.dp)
                            .padding(10.dp)
                    )

                    Column(modifier = Modifier.padding(10.dp)) {
                        Text(text = "20")
                    }

                }
            }

            Text(text = "Date of birth: {dob}")
            Spacer(modifier = Modifier.padding(1.dp))
            Text(text = "Theme: {theme}")

            OutlinedButton(
                onClick = {
                    // TODO
                },
                modifier = Modifier
                    .padding(12.dp)
                    .fillMaxWidth(1f)
                    .height(40.dp),
                colors = ButtonDefaults.buttonColors(backgroundColor = Color.Transparent),
                border = BorderStroke(1.dp, Color(0xff989898))
            ) {
                Text(
                    text = "Edit profile",
                    color = Color(0xff878787),
                    fontFamily = FontFamily.SansSerif,
                    fontSize = 15.sp,
                    fontWeight = FontWeight.Normal
                )
            }

            Row() {
                Image(
                    painter = painterResource(id = R.drawable.reward_icon),
                    contentDescription = "reward icon",
                    modifier = Modifier
                        .height(50.dp)
                        .width(50.dp)
                        .padding(10.dp)
                )

                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.padding(13.dp)
                ) {
                    Text(text = "Reward List")
                }
            }

            val configuration = LocalConfiguration.current
            val screenWidth = configuration.screenWidthDp.dp
            val cardWidth = screenWidth - 30.dp

            Card(
                modifier = Modifier
                    .size(width = cardWidth, height = 120.dp)
                    .clickable { /* TODO each card needs to be clickable to the relevant child profile. */ },
                border = BorderStroke(1.dp, Color(0xff878787)),
//                elevation = 10.dp, // shadow around box
                shape = RoundedCornerShape(10.dp)
            ) {


            }

            Row() {
                Image(
                    painter = painterResource(id = R.drawable.checklist_icon),
                    contentDescription = "checklist icon",
                    modifier = Modifier
                        .height(50.dp)
                        .width(50.dp)
                        .padding(10.dp)
                )

                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.padding(10.dp)
                ) {
                    Text(text = "Finished chores")
                }
            }

            //TODO: list of completed chores
            Card(
                modifier = Modifier
                    .size(width = cardWidth, height = 120.dp)
                    .clickable { /* TODO each card needs to be clickable to the relevant child profile. */ },
                border = BorderStroke(1.dp, Color(0xff878787)),
//                elevation = 10.dp, // shadow around box
                shape = RoundedCornerShape(10.dp)
            ) {


            }


        }
    }

}