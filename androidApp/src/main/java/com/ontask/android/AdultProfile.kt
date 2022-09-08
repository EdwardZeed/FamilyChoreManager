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

class AdultProfile : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    AdultProfilePage()
                }
            }
        }
    }

}

@Composable
@Preview
fun AdultProfilePage() {
    Box(modifier = Modifier
        .fillMaxSize()
        .focusable()
        .background(color = Color.White)
    ) {
        Column(
            horizontalAlignment = Alignment.Start,
            modifier = Modifier
                .fillMaxSize()
                .padding(20.dp)
        ) {
            Text(
                text = "{name}",
                fontSize = 20.sp,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.padding(10.dp))

            Row() {
                Image(
                    painter = painterResource(id = R.drawable.man),
                    contentDescription = "parent icon",
                    modifier = Modifier
                        .height(80.dp)
                        .width(80.dp)
                        .padding(10.dp)
                )

                Spacer(modifier = Modifier.padding(10.dp))

                Image(
                    painter = painterResource(id = R.drawable.family),
                    contentDescription = "parent icon",
                    modifier = Modifier
                        .height(70.dp)
                        .width(70.dp)
                        .padding(10.dp)
                )

                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.padding(20.dp)
                ) {
                    Text(
                        text = "5",
                        fontSize = 18.sp
                    )
                }

                Image(
                    painter = painterResource(id = R.drawable.children),
                    contentDescription = "parent icon",
                    modifier = Modifier
                        .height(70.dp)
                        .width(70.dp)
                        .padding(10.dp)
                )

                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.padding(20.dp)
                ) {
                    Text(
                        text = "3",
                        fontSize = 18.sp
                    )
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
                    Text(
                        text = "Chores",
                        fontSize = 18.sp
                    )
                }
            }

            val configuration = LocalConfiguration.current
            val screenWidth = configuration.screenWidthDp.dp
            val cardWidth = screenWidth - 30.dp

            //TODO: list of completed chores?!
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