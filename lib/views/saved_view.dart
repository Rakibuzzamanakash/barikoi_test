import 'package:barikoi_test/model_view/save_model_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveView extends StatelessWidget {
  SaveView({super.key});
  final SaveModelView saveModelView = Get.put(SaveModelView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (saveModelView.saveItemList.isNotEmpty) {
          return ListView.builder(
              itemCount: saveModelView.saveItemList.length,
              itemBuilder: (context, index) {
                var data = saveModelView.saveItemList[index];
                return ListTile(
                  title: Text(data.area.toString()),
                  subtitle: Text(data.address.toString()),
                );
              });
        } else {
          return const Center(
            child: Text("No data save"),
          );
        }
      }),
    );
  }
}
