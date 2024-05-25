
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/res/routes/routes_name.dart';
import 'package:getx_app/view_model_back_end/controllers/user%20preferences/user_preference.dart';

class SplashServices{

  UserPreference userPreference= UserPreference();

  void isLogin(){
   userPreference.getUser().then((value){
    if(value.isLogin == false || value.isLogin.toString() == 'null'){ //value.token!.isEmpty || value.token.toString()
      Timer(Duration(seconds: 3),
    () => Get.toNamed(RouteName.LoginScreen),
   );
    }
     else{
    Timer(Duration(seconds: 3),
    () => Get.toNamed(RouteName.HomeScreen),
   );
   }
   });
    
  }
}