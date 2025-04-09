package com.giottus.testapp
import android.app.Application
import com.moengage.core.MoEngage
import com.moengage.core.DataCenter
import com.moengage.core.LogLevel
import com.moengage.core.config.LogConfig
import com.moengage.core.config.NotificationConfig



class MainApplication : Application() {
     override fun onCreate() {
        super.onCreate()
        val moEngage = MoEngage.Builder(this, "H0LK4MS1ETIM4ODCRME7R6HE", DataCenter.DATA_CENTER_3)
        .configureNotificationMetaData(
            NotificationConfig(
               smallIcon = R.drawable.launch_background,
                    largeIcon = R.drawable.launch_background,
                    notificationColor = R.color.red,
                    isMultipleNotificationInDrawerEnabled = true,
            )
        ).configureLogs(LogConfig(LogLevel.VERBOSE, true))
        .build()
        MoEngage.initialiseDefaultInstance(moEngage)
    }
}