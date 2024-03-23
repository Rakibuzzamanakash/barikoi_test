import 'package:barikoi_test/data/response/status.dart';
import 'package:barikoi_test/model/PlaceModel.dart';
import 'package:barikoi_test/model_view/save_model_view.dart';
import 'package:barikoi_test/resources/dimension/app_dimension.dart';
import 'package:barikoi_test/views/widgets/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model_view/autoComplete_view_model.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final AutoCompleteViewModel controller = Get.put(AutoCompleteViewModel());
  final SaveModelView saveModelView = Get.put(SaveModelView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: AppDimension(context).height * .05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () => Get.back(), child: const Icon(Icons.arrow_back)),
              SizedBox(
                width: AppDimension(context).width * .8,
                child: TextFormField(
                  //onChanged: (value) => controller.fetchAutocompleteResults(value),
                  onChanged: (value) => controller.search(value),
                  decoration: const InputDecoration(
                      hintText: "search",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        left: 8,
                      )),
                ),
              ),
              InkWell(onTap: () {}, child: const Icon(Icons.close))
            ],
          ),
          const Divider(),
          Obx(() {
            switch (controller.rxRequestStatus.value) {
              case Status.idle:
                return const Center(
                  child: Text("search your address"),
                );
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
                return const Center(
                  child: Text("something went wrong"),
                );
              case Status.completed:
                return Expanded(
                    child: ListView.builder(
                        itemCount:
                            controller.searchDataList.value.places!.length,
                        itemBuilder: (context, index) {
                          var data =
                              controller.searchDataList.value.places![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5),
                            child: Card(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: CustomModalBottomSheet(
                                              action: () {
                                                saveModelView
                                                    .saveItem(PlaceModel(
                                                  area: data.area.toString(),
                                                  address:
                                                      data.address.toString(),
                                                  longitude:
                                                      data.longitude.toString(),
                                                  latitude:
                                                      data.latitude.toString(),
                                                  uCode: data.uCode.toString(),
                                                  postCode:
                                                      data.postCode.toString(),
                                                  district:
                                                      data.district.toString(),
                                                  city: '',
                                                  pType: '',
                                                  subType: '',
                                                  id: data.id!.toInt(),
                                                ));
                                              },
                                              area: data.area.toString(),
                                              address: data.address.toString(),
                                              long: data.longitude.toString(),
                                              lat: data.latitude.toString(),
                                              placeCode: data.uCode.toString(),
                                              postCode:
                                                  data.postCode.toString(),
                                              district:
                                                  data.district.toString(),
                                            ));
                                      });
                                },
                                child: ListTile(
                                  title: Text(data.area.toString()),
                                  subtitle: Text(data.address.toString()),
                                ),
                              ),
                            ),
                          );
                        }));
            }
          }),
        ],
      ),
    );
  }
}
