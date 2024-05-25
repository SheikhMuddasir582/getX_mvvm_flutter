
import 'package:getx_app/data/network/network_api_services.dart';
import 'package:getx_app/res/app%20url/app_url.dart';

class LoginRepository{

  final _apiService= NetworkApiservices();

  Future<dynamic> loginApi(var data) async{
   dynamic response= await _apiService.postApi(data, AppUrl.endUrl);
   return response;
  }
}