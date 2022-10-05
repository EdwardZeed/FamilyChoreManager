package com.ontask.android

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.navigation.NavHostController
import com.ontask.android.Utils.LoadingState
import com.google.firebase.auth.AuthCredential
import com.google.firebase.auth.FirebaseAuth
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.tasks.await

class LoginScreenViewModel : ViewModel() {

    val loadingState = MutableStateFlow(LoadingState.IDLE)

    fun signWithGoogleCredential(credential: AuthCredential,auth: FirebaseAuth, navController: NavHostController) = viewModelScope.launch {
        try {
            loadingState.emit(LoadingState.LOADING)
            auth.signInWithCredential(credential).await()
            loadingState.emit(LoadingState.LOADED)
            navController.navigate("dashboard_screen")
        } catch (e: Exception) {
            loadingState.emit(LoadingState.error(e.localizedMessage))
        }
    }

}