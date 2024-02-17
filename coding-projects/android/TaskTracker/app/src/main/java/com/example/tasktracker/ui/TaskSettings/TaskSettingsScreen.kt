package com.example.tasktracker.ui.TaskSettings

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TaskSettingsScreen() {
    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    /*
                        TODO - #155 - Add a header text, play with `fontSize` or `fontStyle` and remove the
                        "This is the settings screen" text now that we no longer need it.
                     */
                }
            )
        }
    ) { paddingValue ->
        Column(
            modifier = Modifier
                .padding(
                    top = paddingValue.calculateTopPadding(),
                    start = 12.dp,
                    end = 12.dp
                )
                .fillMaxSize(),
        ) {
            Text(text = "This is the settings screen")
            // TODO - #156 - Add a section header for info and feedback, play with `fontSize` or `fontStyle` in your Text composable
            Card(modifier = Modifier.fillMaxWidth()){
                // TODO - #158 - Add an About Us row with an icon and a text
                // TODO - #163 - Add a Privacy Policy row with an icon and a text
                // TODO - #164 - Add a Tutorial row with an icon and text
                // TODO - #165 - Add a Rate app row with an icon and text
                // TODO - #166 - Add a Follow us on Twitter row with an icon and text
            }
            // TODO - #167 - Add a section header for Notifications
            Card(modifier = Modifier.fillMaxWidth()){
                // TODO - #173 - Add a "Show Days" row
                // TODO - #174 - Add a "Task Reminder" row
                // TODO - #175 - Add a "Show Badge" row
                // TODO - #176 - Add a "Reminder Time" row
            }
            // TODO - #168 - Add a section header for "What's New?"
            Card(modifier = Modifier.fillMaxWidth()){
                // TODO - #172 - Add a "Vote on Future Requests row"
            }

            // TODO - #157 - Add a section header for appearance, play with `fontSize` or `fontStyle in your Text composable`
            Card(modifier = Modifier.fillMaxWidth()) {
                // TODO - #171 - Add an App Theme row
                // TODO - #170 - Add an App Icon row
            }
            // TODO - #169 - Add a version footer row
        }
    }
}

@Preview(showBackground = true)
@Composable
fun TaskSettingsPreview() {
    TaskSettingsScreen()
}
