package com.ontask.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.animation.core.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.*
import androidx.compose.foundation.text.ClickableText
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.*
import androidx.compose.material.icons.*
import androidx.compose.material.icons.filled.*
import androidx.compose.runtime.*
import androidx.compose.ui.*
import androidx.compose.ui.draw.*
import androidx.compose.ui.focus.*
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.painter.*
import androidx.compose.ui.platform.*
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.*
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.*
import androidx.constraintlayout.compose.*

class MainActivity: ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            parentLoginPage()
        }
    }
}

@Composable
@Preview
fun parentLoginPage() {
    var paddingState by remember { mutableStateOf(16.dp) }
    val padding by animateDpAsState(
        targetValue = paddingState,
        tween(durationMillis = 1000)
    )

    Box(modifier = Modifier
        .fillMaxSize()
        .focusable()
        .background(color = Color.Transparent)
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.fillMaxSize()
        ) {
            Row(modifier = Modifier
                .padding(20.dp)
                .fillMaxWidth(),
                horizontalArrangement = Arrangement.End
            ) {
                Image(
                    painter = painterResource(id = R.drawable.qr_code_icon),
                    contentDescription = "QR scan icon",
                    modifier = Modifier.height(50.dp).width(50.dp).padding(10.dp)
                )
            }

            Image(
                painter = painterResource(id = R.drawable.user_icon),
                contentDescription = "Parent icon",
                modifier = Modifier.height(150.dp).width(150.dp).padding(top = 4.dp)
            )

            Text(
                text = "Welcome back!",
                textAlign = TextAlign.Center,
                modifier = Modifier.padding(top = 16.dp, bottom = 4.dp),
                style = TextStyle(
                    fontSize = 20.sp
                )
            )

            Row() {
                Text(
                    text = "If you don't have an account, ",
                    textAlign = TextAlign.Center,
                    modifier = Modifier.padding(top = 4.dp, bottom = 16.dp),
                    style = TextStyle(
                        fontSize = 20.sp
                    )
                )
                ClickableText(
                    text = AnnotatedString("sign up"),
                    modifier = Modifier.padding(top = 4.dp, bottom = 16.dp),
                    style = TextStyle(
                        fontSize = 20.sp,
                        color = Color(0.41f, 0.62f, 0.93f)
                    ),
                    onClick = {
                        // do something when sign up button clicked
                    }
                )
            }

            val localFocusManager = LocalFocusManager.current
            Modifier.padding(3.dp)
                .fillMaxWidth(0.8f)
                .onFocusChanged { focused ->
                    if (focused.isFocused) {
                        paddingState = 8.dp
                    } else {
                        paddingState = 16.dp
                    }
                }
                .apply {
                    emailInput(this, localFocusManager)
                    passwordInput(this, localFocusManager)
                }

            ClickableText(
                text = AnnotatedString("Forgot your password?"),
                modifier = Modifier.padding(top = padding, bottom = padding, start = 0.dp, end = 0.dp),
                style = TextStyle(
                    fontSize = 14.sp,
                    color = Color(0.41f, 0.62f, 0.93f)
                ),
                onClick = {
                    // do something when forgot password button clicked
                }
            )

            Button(
                onClick = {},
                colors = ButtonDefaults.buttonColors(
                    backgroundColor = Color(0.41f, 0.62f, 0.93f),
                    contentColor = Color.White),
                modifier = Modifier
                    .fillMaxWidth(0.5f)
                    .height(50.dp)
            ) {
                Text(
                    text = "Log in",
                    textAlign = TextAlign.Center,
                    style = TextStyle(
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                    )
                )
            }

            Row(modifier = Modifier
                .padding(20.dp)
                .fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                Image(
                    painter = painterResource(id = R.drawable.apple_login_btn),
                    contentDescription = "Apple logo icon",
                    modifier = Modifier.height(50.dp).width(50.dp).padding(10.dp)
                )
                Image(
                    painter = painterResource(id = R.drawable.google_login_btn),
                    contentDescription = "Google logo icon",
                    modifier = Modifier.height(50.dp).width(50.dp).padding(10.dp)
                )
                Image(
                    painter = painterResource(id = R.drawable.facebook_login_btn),
                    contentDescription = "Facebook logo icon",
                    modifier = Modifier.height(50.dp).width(50.dp).padding(10.dp)
                )
            }
        }
    }
}

@OptIn(ExperimentalComposeUiApi::class)
@Composable
fun emailInput(modifier: Modifier = Modifier, localFocusManager: FocusManager): String {
    var email by remember { mutableStateOf("") }
    val keyboardController = LocalSoftwareKeyboardController.current

    OutlinedTextField(value = email,
        onValueChange = { email = it },
        label = { Text(text = "Email address", textAlign = TextAlign.Center) },
        singleLine = true,
        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Text, imeAction = ImeAction.Next),
        keyboardActions = KeyboardActions(onNext = { localFocusManager.moveFocus(FocusDirection.Down) }),
        modifier = modifier,
        leadingIcon = {
            Icon(
                imageVector = Icons.Filled.AlternateEmail,
                contentDescription = "phone leading icon",
                tint = Color(0xff656565)
            )
        },
        colors = TextFieldDefaults.outlinedTextFieldColors(
            focusedBorderColor = Color(0xff656565),
            unfocusedBorderColor = Color(0xff989898)
        )

    )

    return email
}

@Composable
fun passwordInput(modifier: Modifier, loaclFoucsManager: FocusManager): String{
    var password by remember { mutableStateOf("") }
    var passwordHidden by remember { mutableStateOf(true) }

    OutlinedTextField(value = password,
        onValueChange = { password = it },
        label = { Text(text = "Password")},
        visualTransformation = if (passwordHidden) PasswordVisualTransformation() else VisualTransformation.None,
        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password, imeAction = ImeAction.Done),
        keyboardActions = KeyboardActions(onDone = {loaclFoucsManager.clearFocus()}),
        modifier = modifier,
        leadingIcon = {
            Icon(
                imageVector = Icons.Filled.Lock,
                contentDescription = "password leading icon",
                tint = Color(0xff656565)
            ) },
        trailingIcon = {
            IconButton(onClick = { passwordHidden = !passwordHidden }) {
                val visibilityIcon =
                    if (passwordHidden) Icons.Filled.Visibility else Icons.Filled.VisibilityOff
                // Please provide localized description for accessibility services
                val description = if (passwordHidden) "Show password" else "Hide password"
                Icon(imageVector = visibilityIcon, contentDescription = description)
            }
        },
        colors = TextFieldDefaults.outlinedTextFieldColors(
            focusedBorderColor = Color(0xff656565),
            unfocusedBorderColor = Color(0xff989898)
        )

    )

    return password
}
