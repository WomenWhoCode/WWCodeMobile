package com.example.tasktracker

import androidx.compose.runtime.Composable
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.tasktracker.navigation.NavScreens
import com.example.tasktracker.ui.TaskDetail.TaskDetailScreen
import com.example.tasktracker.ui.TaskList.TaskListScreen
import com.example.tasktracker.ui.TaskSettings.TaskSettingsScreen
import com.example.tasktracker.ui.TaskSettings.TaskSettingsViewModel

@Composable
fun MainScreen() {
    val navController = rememberNavController()

    NavHost(navController = navController, startDestination = NavScreens.TaskList.route) {
        composable(NavScreens.TaskList.route) {
            TaskListScreen(
                onNavigateToSettings = { navController.navigate(NavScreens.TaskSettings.route) },
                onNavigateToDetail = { navController.navigate(NavScreens.TaskDetail.route) })
        }
        composable(NavScreens.TaskSettings.route) {
            val viewModel = hiltViewModel<TaskSettingsViewModel>()
            TaskSettingsScreen(viewModel)
        }
        composable(NavScreens.TaskDetail.route) {
            TaskDetailScreen(onNavigateToList = { navController.navigate(NavScreens.TaskList.route) },
                )
        }
    }
}