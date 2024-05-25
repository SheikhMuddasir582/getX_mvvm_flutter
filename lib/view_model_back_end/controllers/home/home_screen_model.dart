
import 'package:get/get.dart';
import 'package:getx_app/data/response/status.dart';
import 'package:getx_app/models/home/user_list_model.dart';
import 'package:getx_app/repositoy/home%20repository/home_repository.dart';

class HomeViewModel extends GetxController{
  final _api= HomeRepository();

  final rxRequestStatus= Status.LOADING.obs;
  final userList= UserListModel().obs;
  RxString error= ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value= _value;
  void setUserList(UserListModel _value) => userList.value= _value;
  void setError(String _value) => error.value= _value;


  void userListApi(){
    _api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

    }).onError((error, stackTrace){
        setRxRequestStatus(Status.ERROR);
        print(error.toString());
        setError(error.toString());
    });
  }

   void refreshApi(){
    setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

    }).onError((error, stackTrace){
        setRxRequestStatus(Status.ERROR);
        print(error.toString());
        setError(error.toString());
    });
  }
}