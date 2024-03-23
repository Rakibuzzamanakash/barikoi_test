import 'dart:convert';

class PlaceModel {
  final int? id;
  final String longitude;
  final String latitude;
  final String address;
  final String city;
  final String area;
  final String postCode;
  final String pType;
  final String subType;
  final String district;
  final String uCode;

  PlaceModel({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.address,
    required this.city,
    required this.area,
    required this.postCode,
    required this.pType,
    required this.subType,
    required this.district,
    required this.uCode,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json['id'] as int,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      area: json['area'] as String,
      postCode: json['postCode'] as String,
      pType: json['pType'] as String,
      subType: json['subType'] as String,
      district: json['district'] as String,
      uCode: json['uCode'] as String,
    );
  }

  String toJsonString() {
    final Map<String, dynamic> data = {
      'id': id,
      'longitude': longitude,
      'latitude': latitude,
      'address': address,
      'city': city,
      'area': area,
      'postCode': postCode,
      'pType': pType,
      'subType': subType,
      'district': district,
      'uCode': uCode,
    };
    return jsonEncode(data);
  }

  factory PlaceModel.fromJsonString(String jsonString) {
    final Map<String, dynamic> data = jsonDecode(jsonString);
    return PlaceModel.fromJson(data);
  }
}
