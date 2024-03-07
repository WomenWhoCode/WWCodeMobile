package com.example.tasktracker.ui.TaskSettings

data class TaskSettingViewState(
    val taskReminderEnabled: Boolean = false,
)
class TaskSettingsViewModel : ViewModel() {

    private val _stateflow = mutableStateFlow(TaskSettingViewState())
    val stateflorw: StateFlow<TaskSettingViewState> = _stateflow

    fun toggleTaskReminder() {
        _stateflow.value = _stateFlow.value.copy(taskReminderEnabled = !taskReminderEnabled)
    }

}