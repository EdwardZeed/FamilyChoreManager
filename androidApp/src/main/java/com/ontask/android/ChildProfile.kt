package com.ontask.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.focusable
import androidx.compose.foundation.layout.*
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
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
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.fillMaxSize().padding(10.dp)
        ) {

            Text(
                text = "{Child name}",
                fontWeight = FontWeight.Bold,
                fontSize = 20.sp
            )

            Image(
                painter = painterResource(id = R.drawable.daughter), // TODO: the icons from dashboard page branch need to be copied over to this branch
                contentDescription = "daughter icon",
                modifier = Modifier
                    .height(50.dp)
                    .width(50.dp)
                    .padding(10.dp)
            )
        }
    }

}