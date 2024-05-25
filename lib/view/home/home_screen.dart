
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/data/response/status.dart';
import 'package:getx_app/res/components/net_exception_widget.dart';
import 'package:getx_app/res/routes/routes_name.dart';
import 'package:getx_app/view_model_back_end/controllers/home/home_screen_model.dart';
import 'package:getx_app/view_model_back_end/controllers/user%20preferences/user_preference.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserPreference userPreference= UserPreference();
  final homeController= Get.put(HomeViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
              userPreference.removeUser().then((value){
                Get.toNamed(RouteName.LoginScreen);
              });
          }, icon: Icon(Icons.logout)),
        ],
      ),
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
          return CircularProgressIndicator();
          case Status.ERROR:
          if(homeController.error.value == 'No internet')
          {
            return InternetExceptionWidget(onpressed: (){
           homeController.userListApi();
          },);
          }
          else{
            return Center(child: Text(homeController.error.toString()),);
          }
          case Status.COMPLETED:
          return ListView.builder(
            itemCount: homeController.userList.value.data!.length,
            itemBuilder: (context, index){
           return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
              ),
              title: Text(homeController.userList.value.data![index].firstName.toString()),
              subtitle:Text(homeController.userList.value.data![index].email.toString()) ,
            ),
           );
          });
            
        }
      }),
    );
  }
}