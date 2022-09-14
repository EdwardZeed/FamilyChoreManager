package com.ontask.android

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.composable

@Composable
fun NavMap(navController: NavHostController, starDest:String) {
    androidx.navigation.compose.NavHost(navController = navController, startDestination = starDest){
        composable(route = "Register_screen"){
            Register(navController = navController)
        }
        composable(route = "Login_screen"){
            parentLoginPage(navController = navController)
        }
        composable(route = "dashboard_screen"){
            dashboardPage(navController = navController)
        }
        composable(route = "addChildProfile_screen"){
            addChildProfile(navController = navController)
        }
        composable(route = "parentProfile_screen"){
            AdultProfilePage(navController = navController)
        }
        composable(route = "childProfile_screen"){
            childProfilePage(navController = navController)
        }
        composable(route = "addChore_screen"){
            AddChoresPage(navController = navController)
        }
        composable(route = "assignChore_screen"){
            assignChoresPage(navController = navController)
        }
        composable(route = "createContract_screen"){
            CreateContractPage(navController = navController)
        }
    }
}


