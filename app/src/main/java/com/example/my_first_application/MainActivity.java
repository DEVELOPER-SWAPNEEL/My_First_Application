/*
    -------->> THE PROVIDED IS THE CODE FOR HAVING A FUNVTIONAL BUTTON;
package com.example.my_first_application;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        Button btn= findViewById(R.id.my_btn);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "BUTTON IS PRESSED!!", Toast.LENGTH_SHORT).show();
            }
        });
//        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
//            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
//            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
//
//            return insets;
        }//);
    }
//}*/

package com.example.my_first_application;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button btn= findViewById(R.id.my_btn);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText edt= findViewById(R.id.edit);
                EditText eedt=findViewById(R.id.pass);
                Toast.makeText(MainActivity.this, "YOUR USERNAME AND PASSWORD IS AS FOLLOWING:-", Toast.LENGTH_SHORT).show();
                Toast.makeText(MainActivity.this, edt.getText().toString(), Toast.LENGTH_SHORT).show();
                Toast.makeText(MainActivity.this, eedt.getText().toString() , Toast.LENGTH_SHORT).show();
            }
        });
        

    }
}
