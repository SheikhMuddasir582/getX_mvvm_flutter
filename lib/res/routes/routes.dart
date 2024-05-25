
import 'package:get/get.dart';
import 'package:getx_app/res/routes/routes_name.dart';
import 'package:getx_app/view/home/home_screen.dart';
import 'package:getx_app/view/login/login_view.dart';
import 'package:getx_app/view/splash_screen.dart';

class AppRoutes{

  static appRoutes() => [

    GetPage(name: RouteName.splashScreen, 
            page: () => SplashScreen(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade,
            ),

            GetPage(name: RouteName.LoginScreen, 
            page: () => LoginScreen(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade,
            ),
            GetPage(name: RouteName.HomeScreen, 
            page: () => HomeScreen(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade,
            ),


  ];
}