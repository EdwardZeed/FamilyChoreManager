package com.ontask.android

import android.app.DatePickerDialog
import android.os.Bundle
import android.widget.DatePicker
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.focusable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.ExperimentalComposeUiApi
import androidx.compose.ui.Modifier
import androidx.compose.ui.focus.FocusDirection
import androidx.compose.ui.focus.FocusManager
import androidx.compose.ui.focus.onFocusChanged
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.compose.ui.theme.ComposeTheme
import java.util.*

class Register : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            ComposeTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    Greeting("android")
                }
            }
        }
    }

}

@Composable
fun Greeting(name: String) {
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
//            Image(
//                painter = ColorPainter(Color.Gray), contentDescription = "Gray", modifier = Modifier
//                    .fillMaxHeight(0.2f)
//                    .fillMaxWidth()
//            )

            Text(
                text = "Let's get started",
                textAlign = TextAlign.Center,
                modifier = Modifier.padding(top = 60.dp, bottom = 16.dp),
                style = TextStyle(
                    fontSize = 32.sp,
                    fontWeight = FontWeight.Bold,
                )
            )

            Text(
                text = "Create an account with On Task Achievers",
                textAlign = TextAlign.Center,
                modifier = Modifier.padding(top = 2.dp, bottom = 16.dp),
                style = TextStyle(
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Normal,
                ),
                color = Color(0xFFADADAD)
            )

            val localFocusManager = LocalFocusManager.current
            Modifier.padding(padding)
                .fillMaxWidth(0.8f)
                .onFocusChanged { focused ->
                    if (focused.isFocused) {
                        paddingState = 8.dp
                    } else {
                        paddingState = 16.dp
                    }
                }
                .apply {
                    usernameInput(this, localFocusManager)
                    emailInput(this, localFocusManager)
                    passwordInput(this, localFocusManager)
                    datePicker()
                }


            Row(){
                Text(
                    text = "Have an account? ",
                    textAlign = TextAlign.Center,
                    modifier = Modifier.padding(top = padding, bottom = padding, start = padding, end = 0.dp)
                )
                Text(
                    text = "Log in",
                    modifier = Modifier.padding(top = padding, bottom = padding, end = padding, start = 0.dp),
                    color = Color.Blue // this indicates that this text is clickable although just double check the colour.
                )
            }


            Button(
                onClick = {}, modifier = Modifier
                    .fillMaxWidth(0.3f)
                    .height(50.dp),
                colors = ButtonDefaults.buttonColors(backgroundColor = Color(0xFF689FEC))
            ) {
                Text(
                    text = "Register",
                    textAlign = TextAlign.Center,
                    style = TextStyle(
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                    ),
                    color = Color.White
                )
            }
        }
    }
//    Text(text = "Hello $name!")
}

@OptIn(ExperimentalComposeUiApi::class)
@Composable
fun usernameInput(modifier: Modifier = Modifier, localFocusManager: FocusManager): String {
    var username by remember { mutableStateOf("") }
    val keyboardController = LocalSoftwareKeyboardController.current


    TextField(value = username,
        onValueChange = { username = it },
        label = { Text(text = "First name", textAlign = TextAlign.Center) },
        singleLine = true,
        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Phone, imeAction = ImeAction.Next),
        keyboardActions = KeyboardActions(onNext = { localFocusManager.moveFocus(FocusDirection.Down) }),
        modifier = modifier,
        leadingIcon = {
            Icon(imageVector = Icons.Filled.AccountCircle, contentDescription = "profile leading icon")
        }

    )

    return username

}

@OptIn(ExperimentalComposeUiApi::class)
@Composable
fun emailInput(modifier: Modifier = Modifier, localFocusManager: FocusManager): String {
    var email by remember { mutableStateOf("") }
    val keyboardController = LocalSoftwareKeyboardController.current


    TextField(value = email,
        onValueChange = { email = it },
        label = { Text(text = "Email address", textAlign = TextAlign.Center) },
        singleLine = true,
        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Phone, imeAction = ImeAction.Next),
        keyboardActions = KeyboardActions(onNext = { localFocusManager.moveFocus(FocusDirection.Down) }),
        modifier = modifier,
        leadingIcon = {
            Icon(imageVector = Icons.Filled.Email, contentDescription = "email address leading icon")
        }

    )

    return email

}

@Composable
fun passwordInput(modifier: Modifier, localFocusManager: FocusManager): String{
    var password by remember { mutableStateOf("") }
    var passwordHidden by remember { mutableStateOf(true) }

    TextField(value = password,
        onValueChange = { password = it },
        label = { Text(text = "Password")},
        visualTransformation = if (passwordHidden) PasswordVisualTransformation() else VisualTransformation.None,
        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password, imeAction = ImeAction.Done),
        keyboardActions = KeyboardActions(onDone = {localFocusManager.clearFocus()}),
        modifier = modifier,
        leadingIcon = { Icon(imageVector = Icons.Filled.Lock, contentDescription = "password leading icon") },
        trailingIcon = {
            IconButton(onClick = { passwordHidden = !passwordHidden }) {
                val visibilityIcon = if (passwordHidden) Icons.Filled.Visibility else Icons.Filled.VisibilityOff
                // Please provide localized description for accessibility services
                val description = if (passwordHidden) "Show password" else "Hide password"
                Icon(imageVector = visibilityIcon, contentDescription = description)
            }
        }

    )

    return password
}

// reference: https://www.geeksforgeeks.org/date-picker-in-android-using-jetpack-compose/
@Composable
fun datePicker() {
    // Fetching the Local Context
    val mContext = LocalContext.current

    // Declaring integer values
    // for year, month and day
    val mYear: Int
    val mMonth: Int
    val mDay: Int

    // Initializing a Calendar
    val mCalendar = Calendar.getInstance()

    // Fetching current year, month and day
    mYear = mCalendar.get(Calendar.YEAR)
    mMonth = mCalendar.get(Calendar.MONTH)
    mDay = mCalendar.get(Calendar.DAY_OF_MONTH)

    mCalendar.time = Date()

    // Declaring a string value to
    // store date in string format
    val mDate = remember { mutableStateOf("") }

    // Declaring DatePickerDialog and setting
    // initial values as current values (present year, month and day)
    val mDatePickerDialog = DatePickerDialog(
        mContext,
        { _: DatePicker, mYear: Int, mMonth: Int, mDayOfMonth: Int ->
            mDate.value = "$mDayOfMonth/${mMonth+1}/$mYear"
        }, mYear, mMonth, mDay
    )

    Column(modifier = Modifier.padding(30.dp), verticalArrangement = Arrangement.Center, horizontalAlignment = Alignment.CenterHorizontally) {

        // Creating a button that on
        // click displays/shows the DatePickerDialog
        Button(onClick = {
            mDatePickerDialog.show()
        }, colors = ButtonDefaults.buttonColors(backgroundColor = Color(0XFF0F9D58)) ) {
            Text(
                text = "Open Date Picker",
                color = Color.White
            )
        }

        // Adding a space of 100dp height
        Spacer(modifier = Modifier.size(20.dp))

        // Displaying the mDate value in the Text
        Text(
            text = "Date of birth: ${mDate.value}",
            fontSize = 18.sp,
            textAlign = TextAlign.Center
        )
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    ComposeTheme {
        Greeting("Android")
    }
}