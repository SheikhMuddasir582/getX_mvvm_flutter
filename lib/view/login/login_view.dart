
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_app/res/components/round_button.dart';
import 'package:getx_app/utils/utils.dart';
import 'package:getx_app/view/login/widgets/input_email_widget.dart';
import 'package:getx_app/view/login/widgets/input_password_widget.dart';
import 'package:getx_app/view/login/widgets/login_button.dart';
import 'package:getx_app/view_model_back_end/controllers/login/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// final LoginScreenController controller= Get.put(LoginScreenController());
final controller= Get.put(LoginScreenController());
final _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('login text'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputEmailWidget(),
                    SizedBox(
                height: 20,
              ),
                InputPasswordWidget(),
                ],
              ),
            ),
            
            SizedBox(
              height: 40,
            ),
            LoginButtonWidget(
              formkey: _formKey,
            )
            
          ],
        ),
      ),
    );
  }
}