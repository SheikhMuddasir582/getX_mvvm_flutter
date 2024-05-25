

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/login/user_model.dart';
import 'package:getx_app/repositoy/login%20repository/login_repository.dart';
import 'package:getx_app/res/routes/routes_name.dart';
import 'package:getx_app/utils/utils.dart';
import 'package:getx_app/view_model_back_end/controllers/user%20preferences/user_preference.dart';

class LoginScreenController extends GetxController{
  UserPreference userPreference= UserPreference();
  final _api= LoginRepository();
  final emailController= TextEditingController().obs;
  final passwordController= TextEditingController().obs;

  final emailFocusNode= FocusNode().obs;
  final passFocusNode= FocusNode().obs;
  RxBool loading= false.obs;
  void loginApi(){
    loading.value= true;
    Map data={
      'email' : emailController.value.text,
      'password' : passwordController.value.text,

    };
    _api.loginApi(data).then((value){
       loading.value= false;
       if(value['error'] == 'user not found'){
         Utils.snackBar('Login', value['error']);
       }
       else{
        UserModel userModel= UserModel(
          token: value['token'],
          isLogin: true,
        );
        Utils.snackBar('Login', 'login succesfully'); //userPreference.saveUser(UserModel.fromJson(value))
        userPreference.saveUser(userModel).then((value){
          Get.toNamed(RouteName.HomeScreen);
        }).onError((error, stackTrace) => null);
       }

    }).onError((error, stackTrace){
      Utils.snackBar('Error', error.toString());
      loading.value= false;
    });
  }
}