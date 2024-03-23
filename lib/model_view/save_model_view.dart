import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/PlaceModel.dart';

class SaveModelView extends GetxController {
  var saveItemList = <PlaceModel>[].obs;
  final box = GetStorage();

  static const String saveKey = "saveItemList";

  @override
  void onInit() {
    _loadSaveItems();
    super.onInit();
  }

  void saveItem(PlaceModel place) {
    saveItemList.add(place);
    _saveSaveItemList();
  }

  void _saveSaveItemList() {
    box.write(saveKey, saveItemList);
  }

  void _loadSaveItems() {
    List<PlaceModel>? encodedList = box.read<List<PlaceModel>>(saveKey);
    if (encodedList != null) {
      saveItemList.value = encodedList;
    }
  }
}
