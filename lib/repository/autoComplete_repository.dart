import 'package:barikoi_test/data/network/network_api_services.dart';
import 'package:barikoi_test/resources/app_urls/app_url.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/AutoCompleteModel.dart';

class AutoCompleteRepository {
  final _apiService = NetworkApiServices();
  final String apiKey = dotenv.env["apiKey"]!;
  Future<AutoCompleteModel> autoCompleteListApi(dynamic  query) async{
     //dynamic response = await _apiService.getApi('${AppUrl.autoCompleteApi}q=$query&autocomplete=3&api_key=$apiKey');
     dynamic response = await _apiService.getApi(AppUrl.autoCompleteApi,queryParameters: query);
    return AutoCompleteModel.fromJson(response);
  }
}