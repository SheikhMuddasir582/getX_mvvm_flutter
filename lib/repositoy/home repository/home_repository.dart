
import 'package:getx_app/data/network/network_api_services.dart';
import 'package:getx_app/models/home/user_list_model.dart';
import 'package:getx_app/res/app%20url/app_url.dart';

class HomeRepository{

  final _apiService= NetworkApiservices();

  Future<UserListModel> userListApi() async{
   dynamic response= await _apiService.getApi(AppUrl.userListApi);
   return UserListModel.fromJson(response);
  }
}