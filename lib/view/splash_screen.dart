import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/data/exceptions/exceptions.dart';
import 'package:getx_app/res/assets/image_assets.dart';
import 'package:getx_app/res/components/net_exception_widget.dart';
import 'package:getx_app/res/components/round_button.dart';
import 'package:getx_app/res/fonts/app_fonts.dart';
import 'package:getx_app/utils/utils.dart';
import 'package:getx_app/view_model_back_end/sevices/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices= SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(child: Text('splash text'.tr, textAlign: TextAlign.center,)),
      // appBar: AppBar(
      //   title: Text('email hint'.tr, style:  const TextStyle(fontFamily: AppFonts.fontfamilyItalic,),),
      // ),
      // // body: const Image(image: AssetImage(ImageAssets.img),
      // body: RoundButton(title: 'login text'.tr, onPress: (){

      //   print('hello');

      // })
      );
  }
}