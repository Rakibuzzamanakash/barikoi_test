import 'package:barikoi_test/data/response/status.dart';
import 'package:barikoi_test/model/AutoCompleteModel.dart';
import 'package:barikoi_test/repository/autoComplete_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class AutoCompleteViewModel extends GetxController {
  final _api = AutoCompleteRepository();

  final rxRequestStatus = Status.idle.obs;
  final searchDataList = Rx<AutoCompleteModel>(AutoCompleteModel());
  RxString error = "".obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setTestDataSearchList(AutoCompleteModel value) =>
      searchDataList.value = value;
  void setError(String value) => error.value = value;

  final String apiKey = dotenv.env["apiKey"]!;

  void search(String query) {
    if (query.isEmpty) {
      setRxRequestStatus(Status.idle);
      return;
    }
    setRxRequestStatus(Status.loading);
    autoCompleteDataSearchApi(query);
  }

  void autoCompleteDataSearchApi(String key) {
    final queryParameters = {
      'q': key,
      'api_key': apiKey,
      'autocomplete': '3',
    };
    _api.autoCompleteListApi(queryParameters).then((value) {
      setRxRequestStatus(Status.completed);
      setTestDataSearchList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.error);
    });
  }
}
