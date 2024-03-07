package com.example.tasktracker.ui.TaskSettings

import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.KeyboardArrowRight
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Divider
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
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.tasktracker.R

@Preview(showBackground = true)
@Composable
fun TaskSettingsPreview() {
    TaskSettingsScreen()
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TaskSettingsScreen(viewModel: TaskSettingsViewModel) {
    val state = viewModel.stateflorw.collectAsState()

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
                Row(
                    modifier = Modifier
                        .padding(horizontal = 16.dp, vertical = 8.dp)
                        .fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(text = stringResource(id = R.string.task_reminder).uppercase(), fontSize = 16.sp , modifier = Modifier.weight(1f).padding(start = 8.dp))
                    //var taskReminderEnabled by remember { mutableStateOf(false) }
                    Switch(
                        checked = state.taskReminderEnabled,
                        onCheckedChange = { isChecked ->
                            //taskReminderEnabled = isChecked
                            viewModel.toggleTaskReminder()
                        }
                    )
                }
                // TODO - #175 - Add a "Show Badge" row
                // TODO - #176 - Add a "Reminder Time" row
            }
            Card(
                modifier = Modifier
                    .padding(vertical = 8.dp),
                colors = CardDefaults.cardColors(
                    containerColor = Color.Transparent,
                ),
            ) {
                WhatsNew()
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

@Preview
@Composable
fun WhatsNew() {
    Column(modifier = Modifier.clickable {

    }) {
        Row(
            modifier = Modifier
                .padding(4.dp)
                .fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Image(
                painter = painterResource(id = R.drawable.ic_whats_new),
                contentDescription = null
            )

            Text(
                modifier = Modifier.padding(horizontal = 8.dp),
                text = stringResource(id = R.string.whats_new),
                color = Color.Black,
                style = MaterialTheme.typography.bodyMedium
            )
            Spacer(modifier = Modifier.weight(1f))
            Icon(
                Icons.Filled.KeyboardArrowRight, contentDescription = "go", tint = Color.Gray
            )

        }
        Divider(
            color = Color.Gray,
            thickness = 0.5.dp,
            modifier = Modifier
                .align(Alignment.Start)
                .padding(start = 36.dp)
                .fillMaxWidth()
        )
    }
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
