import 'package:get/get.dart';
import 'package:maplibre_gl/mapbox_gl.dart';

import '../resources/app_assets/app_assets.dart';

class CartItem{
  final String? titel;
  final String? icon;
  CartItem(this.titel, this.icon);
}

class MapViewModel extends GetxController {



  final List<CartItem> data = [
    CartItem("ATM", AppAssets.atmIcon),
    CartItem("School", AppAssets.hatIcon),
    CartItem("Hospital", AppAssets.hospitalIcon),
    CartItem("Bank", AppAssets.bankIcon),
  ];

  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(23.835677, 90.380325), zoom: 12);
  MaplibreMapController? mController;
   // final String apiKey = dotenv.env["apiKey"]!;
  static const styleId = 'osm-liberty';
  static const apiKey = "bkoi_aefb8f773488c7024c0793b2c8c384f92d5be58e691545b5a1474a4621dfa83b";
  static const mapUrl = 'https://map.barikoi.com/styles/$styleId/style.json?key=$apiKey';
}
