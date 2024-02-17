package com.example.tasktracker.navigation

import androidx.compose.runtime.Composable

sealed class NavScreens(val route:String) {
    companion object {
        private const val LIST_SCREEN_ROUTE = "List"
        private const val SETTINGS_SCREEN_ROUTE = "Settings"
        private const val DETAIL_SCREEN_ROUTE = "Detail"
    }
    object TaskList: NavScreens(LIST_SCREEN_ROUTE)
    object TaskSettings: NavScreens(SETTINGS_SCREEN_ROUTE)
    object TaskDetail: NavScreens(DETAIL_SCREEN_ROUTE)
}