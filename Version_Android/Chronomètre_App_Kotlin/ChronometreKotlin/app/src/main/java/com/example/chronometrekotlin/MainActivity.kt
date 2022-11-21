package com.example.chronometrekotlin

import android.os.Bundle
import android.os.Handler
import android.view.View
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import java.util.*

class MainActivity : AppCompatActivity() {

    private var seconde = 0
    private var running = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val timeView = findViewById<TextView>(R.id.TextView_temps)
        Start_Chrono(timeView);
    }

    fun onClickStart(view: View?) {
        running = true
    }

    fun onClickStop(view: View?) {
        running = false
    }

    fun onClickReset(view: View?) {
        running = false
        seconde = 0
    }

    private fun Start_Chrono(txtView: TextView) {
        val handler = Handler()
        handler.post(object : Runnable {
            override fun run() {
                val heures: Int = seconde / 3600
                val minutes: Int = seconde % 3600 / 60
                val secs: Int = seconde % 60
                val time: String = java.lang.String.format(
                    Locale.getDefault(),
                    "%02d:%02d:%02d",
                    heures,
                    minutes,
                    secs
                )
                txtView.text = time
                if (running) {
                    seconde++
                }
                handler.postDelayed(this, 1000)
            }
        })
    }
}
