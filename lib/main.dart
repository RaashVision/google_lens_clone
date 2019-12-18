
import 'package:flutter/material.dart';
import 'package:google_lens_clone/managers/lifecycle_manager.dart';
import 'package:google_lens_clone/views/pages/home_camera_view.dart';
import 'package:google_lens_clone/views/shared/app_colors.dart';

import 'locator.dart';


void main() async {


  //Dependecy injectiion
  setupLocator();
  
    runApp(MyApp());
}

class MyApp extends StatelessWidget {

 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


   return LifeCycleManager(
      child: MaterialApp(
      
        
        title: 'Google Lens Clone',
        theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: PrimaryColor,
      ),
         home:HomeCameraView()
         
         
         
        
      ),
    );

  }
}
