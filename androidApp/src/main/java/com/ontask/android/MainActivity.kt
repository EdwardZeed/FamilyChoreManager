package com.ontask.android

import android.app.DatePickerDialog
import android.content.Context
import android.os.Bundle
import android.widget.DatePicker
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.*
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
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.constraintlayout.compose.ConstraintLayout
import androidx.constraintlayout.compose.Dimension
import com.example.compose.ui.theme.ComposeTheme
import com.google.android.material.datepicker.MaterialDatePicker
import java.util.*

class Register : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
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
fun DatePickerDemo(context: Context) {
    val mYear: Int
    val mMonth: Int
    val mDay: Int
    val now = Calendar.getInstance()
    mYear = now.get(Calendar.YEAR)
    mMonth = now.get(Calendar.MONTH)
    mDay = now.get(Calendar.DAY_OF_MONTH)
    now.time = Date()
    val date = remember { mutableStateOf("") }
    val datePickerDialog = DatePickerDialog(
        context,
        { _: DatePicker, year: Int, month: Int, dayOfMonth: Int ->
            val cal = Calendar.getInstance()
            cal.set(year, month, dayOfMonth)
//            date.value = getFormattedDate(cal.time, "dd MMM,yyy")
        }, mYear, mMonth, mDay
    )

    val day1= Calendar.getInstance()
    day1.set(Calendar.DAY_OF_MONTH, 1)
    datePickerDialog.datePicker.minDate = day1.timeInMillis
    datePickerDialog.datePicker.maxDate = Calendar.getInstance().timeInMillis
    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Button(onClick = {
            datePickerDialog.show()
        }) {
            Text(text = "Click To Open Date Picker")
        }
        Spacer(modifier = Modifier.size(1.dp))
        Text(text = "Selected date: ${date.value}")
    }
}

@Composable
fun Greeting(name: String) {
    var paddingState by remember { mutableStateOf(16.dp) }
    val padding by animateDpAsState(
        targetValue = paddingState,
        tween(durationMillis = 1000)
    )

    val context = LocalContext.current

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
            Modifier.padding(3.dp)
                .fillMaxWidth(0.72f)
                .apply {
                    usernameInput(this, localFocusManager)
                    emailInput(this, localFocusManager)
                    passwordInput(this, localFocusManager)
//                    datePicker()
                    dateOfBirth(this, localFocusManager)
//                    DatePickerDemo(context)

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

// TODO: https://developer.android.com/jetpack/compose/layouts/material -- add shadow on the button?
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

            Row(){
                Text(
                    text = "or continue with:",
                    textAlign = TextAlign.Center,
                    modifier = Modifier.padding(top = padding, bottom = padding, start = padding, end = 0.dp)
                )
            }

            Row(modifier = Modifier
                .padding(8.dp)
                .fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                Image(
                    painter = painterResource(id = R.drawable.apple_login_btn),
                    contentDescription = "Apple logo icon",
                    modifier = Modifier
                        .height(50.dp)
                        .width(50.dp)
                        .padding(10.dp)
                )
                Image(
                    painter = painterResource(id = R.drawable.google_login_btn),
                    contentDescription = "Google logo icon",
                    modifier = Modifier
                        .height(50.dp)
                        .width(50.dp)
                        .padding(10.dp)
                )
                Image(
                    painter = painterResource(id = R.drawable.facebook_login_btn),
                    contentDescription = "Facebook logo icon",
                    modifier = Modifier
                        .height(50.dp)
                        .width(50.dp)
                        .padding(10.dp)
                )
            }
        }
    }
}

@OptIn(ExperimentalComposeUiApi::class)
@Composable
fun usernameInput(modifier: Modifier = Modifier, localFocusManager: FocusManager): String {
    var username by remember { mutableStateOf("") }
    val keyboardController = LocalSoftwareKeyboardController.current

    OutlinedTextField(value = username,
        onValueChange = { username = it },
        label = {
            Text(
                text = "First name",
                color = Color(0xff878787),
                fontFamily = FontFamily.SansSerif,
                fontSize = 16.sp
            )
        },
        singleLine = true,
        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Phone, imeAction = ImeAction.Next),
        keyboardActions = KeyboardActions(onNext = { localFocusManager.moveFocus(FocusDirection.Down) }),
        modifier = modifier,
        leadingIcon = {
            Icon(
                imageVector = Icons.Filled.Person,
                contentDescription = "profile leading icon",
                tint = Color(0xff656565))
        },
        colors = TextFieldDefaults.outlinedTextFieldColors(
            focusedBorderColor = Color(0xff656565),
            unfocusedBorderColor = Color(0xff989898)),
        textStyle = TextStyle(color = Color(0xff878787), fontFamily = FontFamily.SansSerif)
    )

    return username

}

@OptIn(ExperimentalComposeUiApi::class)
@Composable
fun emailInput(modifier: Modifier = Modifier, localFocusManager: FocusManager): String {
    var email by remember { mutableStateOf("") }
    val keyboardController = LocalSoftwareKeyboardController.current

    OutlinedTextField(
        value = email,
        onValueChange = { email = it },
        label = {
            Text(
                text = "Email address",
                color = Color(0xff878787),
                fontFamily = FontFamily.SansSerif,
                fontSize = 16.sp
            )
        },
        singleLine = true,
        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Phone, imeAction = ImeAction.Next),
        keyboardActions = KeyboardActions(onNext = { localFocusManager.moveFocus(FocusDirection.Down) }),
        modifier = modifier,
        leadingIcon = {
            Icon(
                imageVector = Icons.Filled.AlternateEmail,
                contentDescription = "email address leading icon",
                tint = Color(0xff656565))
        },
        colors = TextFieldDefaults.outlinedTextFieldColors(
            focusedBorderColor = Color(0xff656565),
            unfocusedBorderColor = Color(0xff989898)),
        textStyle = TextStyle(color = Color(0xff878787), fontFamily = FontFamily.SansSerif)
    )

    return email

}

@Composable
fun passwordInput(modifier: Modifier, localFocusManager: FocusManager): String{
    var password by remember { mutableStateOf("") }
    var passwordHidden by remember { mutableStateOf(true) }

    OutlinedTextField(value = password,
        onValueChange = { password = it },
        label = {
            Text(
                text = "Password",
                color = Color(0xff878787),
                fontFamily = FontFamily.SansSerif,
                fontSize = 16.sp
            )
        },
        visualTransformation = if (passwordHidden) PasswordVisualTransformation() else VisualTransformation.None,
        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password, imeAction = ImeAction.Done),
        keyboardActions = KeyboardActions(onDone = {localFocusManager.clearFocus()}),
        modifier = modifier,
        leadingIcon = { Icon(
            imageVector = Icons.Filled.Lock,
            contentDescription = "password leading icon",
            tint = Color(0xff656565)) },
        trailingIcon = {
            IconButton(onClick = { passwordHidden = !passwordHidden }) {
                val visibilityIcon = if (passwordHidden) Icons.Filled.Visibility else Icons.Filled.VisibilityOff
                // Please provide localized description for accessibility services
                val description = if (passwordHidden) "Show password" else "Hide password"
                Icon(imageVector = visibilityIcon, contentDescription = description)
            }
        },
        colors = TextFieldDefaults.outlinedTextFieldColors(
            focusedBorderColor = Color(0xff656565),
            unfocusedBorderColor = Color(0xff989898))
    )

    return password
}


@Composable
fun dateOfBirth(modifier: Modifier = Modifier, localFocusManager: FocusManager): String {
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
    val mDate = remember { mutableStateOf("Date of Birth") }

    // Declaring DatePickerDialog and setting
    // initial values as current values (present year, month and day)
    val mDatePickerDialog = DatePickerDialog(
        mContext,
        { _: DatePicker, mYear: Int, mMonth: Int, mDayOfMonth: Int ->
            mDate.value = "$mDayOfMonth/${mMonth+1}/$mYear"
        }, mYear, mMonth, mDay
    )

    OutlinedButton(
        onClick = {
            mDatePickerDialog.show()
        },
        modifier = Modifier
            .padding(12.dp)
            .fillMaxWidth(0.75f)
            .height(56.dp),
        colors = ButtonDefaults.buttonColors(backgroundColor = Color.Transparent),
        border = BorderStroke(1.dp, Color(0xff989898))
    )
    {
        Box(
            modifier = Modifier.fillMaxWidth(1f)
        ) {
            Row() {
                Icon(
                    imageVector = Icons.Filled.CalendarToday,
                    contentDescription = "calendar leading icon",
                    modifier = Modifier.size(25.dp),
                    tint = Color(0xff656565)
                )
                Spacer(modifier = Modifier.width(10.dp))
                Text(
                    text = "${mDate.value}",
                    color = Color(0xff878787),
                    fontFamily = FontFamily.SansSerif,
                    fontSize = 15.sp,
                    fontWeight = FontWeight.Normal
                )
            }
        }
    }

    return ""

}


// reference: https://www.geeksforgeeks.org/date-picker-in-android-using-jetpack-compose/
@Composable
fun datePicker() { // TODO: make this return the date of birth so that date of birth field can be filled?
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

    Column(modifier = Modifier.padding(1.dp), verticalArrangement = Arrangement.Center, horizontalAlignment = Alignment.CenterHorizontally) {

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


/*
// reference: https://sgkantamani.medium.com/how-to-show-date-picker-in-jetpack-compose-8bc77a3ce408
@Composable
fun datePickerView(
    datePicked : String?,
    updatedDate : ( date : Long? ) -> Unit,
) {
    val activity = LocalContext.current as AppCompatActivity

    Box(
        modifier = Modifier
            .fillMaxSize()
            .wrapContentSize(Alignment.TopStart)
            .padding(top = 10.dp)
            .border(0.5.dp, MaterialTheme.colors.onSurface.copy(alpha = 0.5f))
            .clickable{
                showDatePicker(activity, updatedDate)
            }
    ) {

        ConstraintLayout(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {

            val (lable, iconView) = createRefs()

            Text(
                text= datePicked?:"Date Picker",
                color = MaterialTheme.colors.onSurface,
                modifier = Modifier
                    .fillMaxWidth()
                    .constrainAs(lable) {
                        top.linkTo(parent.top)
                        bottom.linkTo(parent.bottom)
                        start.linkTo(parent.start)
                        end.linkTo(iconView.start)
                        width = Dimension.fillToConstraints
                    }
            )

            Icon(
                imageVector = Icons.Default.DateRange,
                contentDescription = null,
                modifier = Modifier
                    .size(20.dp, 20.dp)
                    .constrainAs(iconView) {
                        end.linkTo(parent.end)
                        top.linkTo(parent.top)
                        bottom.linkTo(parent.bottom)
                    },
                tint = MaterialTheme.colors.onSurface
            )

        }

    }
}

private fun showDatePicker(
    activity : AppCompatActivity,
    updatedDate: (Long?) -> Unit)
{
    val picker = MaterialDatePicker.Builder.datePicker().build()
    picker.show(activity.supportFragmentManager, picker.toString())
    picker.addOnPositiveButtonClickListener {
        updatedDate(it)
    }
}
*/

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    MaterialTheme {
        Greeting("Android")
    }
}

