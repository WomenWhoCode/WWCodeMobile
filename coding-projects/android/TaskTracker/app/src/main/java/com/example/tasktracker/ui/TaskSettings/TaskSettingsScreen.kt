package com.example.tasktracker.ui.TaskSettings

import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Notifications
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Switch
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
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
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {

                    // Spacer for visual separation
                    Spacer(modifier = Modifier.width(16.dp))

                    // Text for Show Badge setting
                    Text(
                        text = "SHOW BADGE ON APP ICON",
                    )

                    // Toggle button for Show Badge setting
                    Spacer(modifier = Modifier.weight(1f))
                    var showBadgeEnabled by remember { mutableStateOf(false) }
                    Switch(
                        checked = showBadgeEnabled,
                        onCheckedChange = { isChecked ->
                            showBadgeEnabled = isChecked
                        },
                    )
                }
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
            VersionFooter(version = getFullVersionName())
        }
    }
}

@Preview(showBackground = true)
@Composable
fun TaskSettingsPreview() {
    TaskSettingsScreen()
}

@Composable
fun VersionFooter(version: String) {
    Text(
        text = "Version $version",
        color = Color.Gray,
        style = MaterialTheme.typography.labelSmall
    )
}

@Composable
fun getFullVersionName(): String {
    val context = LocalContext.current
    val packageInfo: PackageInfo? = try {
        context.packageManager.getPackageInfo(context.packageName, 0)
    } catch (e: PackageManager.NameNotFoundException) {
        null
    }
    return packageInfo?.versionName ?: "Unknown"
}
