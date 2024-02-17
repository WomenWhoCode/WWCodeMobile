package com.example.tasktracker.ui.TaskList

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.tooling.preview.Preview
import com.example.tasktracker.R
import com.example.tasktracker.data.model.Task

/**
 * Created by Gauri Gadkari on 1/23/24.
 */
class TaskItemView {

}

@Composable
fun TaskCard(task: Task, modifier: Modifier = Modifier) {
    Card(modifier = modifier
            .fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = Color.White,
        ),
        ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(
                text = task.taskTitle,
                modifier = Modifier.padding(
                    top = dimensionResource(id = R.dimen.medium_padding),
                    bottom = dimensionResource(id = R.dimen.medium_padding),
                    start = dimensionResource(id = R.dimen.medium_padding)
                ),
                style = MaterialTheme.typography.bodySmall,

            )
            Spacer(
                Modifier
                    .weight(1f)
                    .fillMaxWidth())
            Text(
                modifier = Modifier
                    .padding(end = dimensionResource(R.dimen.medium_padding))
                    .align(alignment = Alignment.CenterVertically),
                text = task.taskTime,
                style = MaterialTheme.typography.bodySmall
            )
        }

    }

}

@Preview(showBackground = true)
@Composable
private fun TaskCardPreview(){
    TaskCard(Task("Walking", "01:35:08", "Yesterday"))
}