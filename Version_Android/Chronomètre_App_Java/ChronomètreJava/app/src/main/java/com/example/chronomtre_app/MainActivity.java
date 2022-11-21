package com.example.chronomtre_app;

// Les différentes importations :

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.TextView;
import java.util.Locale;
/*
lien utile:
https://developer.android.com/reference/android/os/Handler

 */

public class MainActivity extends AppCompatActivity {


    private int seconde = 0;
    private boolean running;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        /*

        Appel de la fonction Start_Chrono :
         va lancer le chronomètre

        */
        Start_Chrono();
    }


    public void onClickStart(View view) {
        running = true;
    }

    public void onClickStop(View view) {
        running = false;
    }

    public void onClickReset(View view) {
        running = false;
        seconde = 0;
    }

    private void Start_Chrono(){



        final TextView timeView = (TextView) findViewById(R.id.TextView_temps);
        final Handler handler = new Handler();

        handler.post(new Runnable() {
            @Override
            public void run() {

                // opérations du chronomètre:

                int heures = seconde/3600;
                int minutes = (seconde%3600)/60;
                int secs = seconde%60;

                String time = String.format(Locale.getDefault(), "%02d:%02d:%02d", heures, minutes, secs);
                timeView.setText(time);
                if (running) {
                    seconde++;
                }
                handler.postDelayed(this,1000);
            }
        });
    }
}
