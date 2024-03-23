import 'dart:convert';
/// places : [{"id":1790269,"longitude":"90.3678577679267","latitude":"23.754073839411365","address":"D Block Field, Block D, Lalmatia, Dhaka","city":"Dhaka","area":"Lalmatia","postCode":1207,"pType":"Recreation","subType":"Field","district":"Dhaka","uCode":"EKLK9287"},{"id":861110,"longitude":"90.36019469","latitude":"23.81680473","address":"D/28, House  D/28, Road  4, Block D, Arambagh, Mirpur, Dhaka","city":"Dhaka","area":"Mirpur","postCode":1216,"pType":"Residential","subType":"Apartment","district":"Dhaka","uCode":"LNYJ2990"},{"id":1737186,"longitude":"90.36644793844317","latitude":"23.75275828785946","address":"D Autos, House  3/D, Satmasjid Road, West Dhanmondi, Dhanmondi, Dhaka","city":"Dhaka","area":"Dhanmondi","postCode":1207,"pType":"Commercial","subType":"Car Showroom","district":"Dhaka","uCode":"UWXT0234"},{"id":907258,"longitude":"89.212158434093","latitude":"23.17878178803415","address":"D Block Masjid, Block D, New Town, Jashore","city":"Jashore","area":"New Town","postCode":7400,"pType":"Religious Place","subType":"Masjid","district":"Jashore","uCode":"QNLG2869"},{"id":1649967,"longitude":"90.36104437389997","latitude":"23.818072558227897","address":"House  14/D, Block D, Arambagh, Mirpur, Dhaka","city":"Dhaka","area":"Mirpur","postCode":1216,"pType":"Residential","subType":"House","district":"Dhaka","uCode":"FVZN1479"},{"id":660122,"longitude":"91.83046952102416","latitude":"22.361884022662064","address":"D&D, Road  1, Panchlaish Residential Area, Panchlaish, Chattogram","city":"Chattogram","area":"Panchlaish","postCode":4000,"pType":"Office","subType":"Real Estate Developer","district":"Chattogram","uCode":"LPQR7495"},{"id":1069216,"longitude":"90.38804724264692","latitude":"23.862663309399117","address":"Shilamoni, House  16/D, Road  9/D, Ahalia, Turag, Dhaka","city":"Dhaka","area":"Turag","postCode":1230,"pType":"Residential","subType":"House","district":"Dhaka","uCode":"DZIT9074"},{"id":1201598,"longitude":"90.43236329091616","latitude":"23.81814332804053","address":"House  8/D, Road  1, Block D, Bashundhara, Dhaka","city":"Dhaka","area":"Bashundhara","postCode":1229,"pType":"Residential","subType":"House","district":"Dhaka","uCode":"VCJG1605"},{"id":129578,"longitude":"90.43240427970886","latitude":"23.818072426742113","address":"House  8/D, Road  1, Block D, Bashundhara, Dhaka","city":"Dhaka","area":"Bashundhara","postCode":1229,"pType":"Residential","subType":"House","district":"Dhaka","uCode":"ABLE8125"},{"id":526575,"longitude":"90.41478938797928","latitude":"23.760632728035574","address":"Bismillah Bhabna, House  1/d/6/d, Mirbagh, Moghbazar, Dhaka","city":"Dhaka","area":"Moghbazar","postCode":1217,"pType":"Residential","subType":"House","district":"Dhaka","uCode":"VERD8219"}]
/// status : 200

AutoCompleteModel autoCompleteModelFromJson(String str) => AutoCompleteModel.fromJson(json.decode(str));
String autoCompleteModelToJson(AutoCompleteModel data) => json.encode(data.toJson());
class AutoCompleteModel {
  AutoCompleteModel({
      List<Places>? places, 
      num? status,}){
    _places = places;
    _status = status;
}

  AutoCompleteModel.fromJson(dynamic json) {
    if (json['places'] != null) {
      _places = [];
      json['places'].forEach((v) {
        _places?.add(Places.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<Places>? _places;
  num? _status;
AutoCompleteModel copyWith({  List<Places>? places,
  num? status,
}) => AutoCompleteModel(  places: places ?? _places,
  status: status ?? _status,
);
  List<Places>? get places => _places;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_places != null) {
      map['places'] = _places?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// id : 1790269
/// longitude : "90.3678577679267"
/// latitude : "23.754073839411365"
/// address : "D Block Field, Block D, Lalmatia, Dhaka"
/// city : "Dhaka"
/// area : "Lalmatia"
/// postCode : 1207
/// pType : "Recreation"
/// subType : "Field"
/// district : "Dhaka"
/// uCode : "EKLK9287"

Places placesFromJson(String str) => Places.fromJson(json.decode(str));
String placesToJson(Places data) => json.encode(data.toJson());
class Places {
  Places({
      num? id, 
      String? longitude, 
      String? latitude, 
      String? address, 
      String? city, 
      String? area, 
      num? postCode, 
      String? pType, 
      String? subType, 
      String? district, 
      String? uCode,}){
    _id = id;
    _longitude = longitude;
    _latitude = latitude;
    _address = address;
    _city = city;
    _area = area;
    _postCode = postCode;
    _pType = pType;
    _subType = subType;
    _district = district;
    _uCode = uCode;
}

  Places.fromJson(dynamic json) {
    _id = json['id'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _address = json['address'];
    _city = json['city'];
    _area = json['area'];
    _postCode = json['postCode'];
    _pType = json['pType'];
    _subType = json['subType'];
    _district = json['district'];
    _uCode = json['uCode'];
  }
  num? _id;
  String? _longitude;
  String? _latitude;
  String? _address;
  String? _city;
  String? _area;
  num? _postCode;
  String? _pType;
  String? _subType;
  String? _district;
  String? _uCode;
Places copyWith({  num? id,
  String? longitude,
  String? latitude,
  String? address,
  String? city,
  String? area,
  num? postCode,
  String? pType,
  String? subType,
  String? district,
  String? uCode,
}) => Places(  id: id ?? _id,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
  address: address ?? _address,
  city: city ?? _city,
  area: area ?? _area,
  postCode: postCode ?? _postCode,
  pType: pType ?? _pType,
  subType: subType ?? _subType,
  district: district ?? _district,
  uCode: uCode ?? _uCode,
);
  num? get id => _id;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get address => _address;
  String? get city => _city;
  String? get area => _area;
  num? get postCode => _postCode;
  String? get pType => _pType;
  String? get subType => _subType;
  String? get district => _district;
  String? get uCode => _uCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['address'] = _address;
    map['city'] = _city;
    map['area'] = _area;
    map['postCode'] = _postCode;
    map['pType'] = _pType;
    map['subType'] = _subType;
    map['district'] = _district;
    map['uCode'] = _uCode;
    return map;
  }

}