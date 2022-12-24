import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class dashbordController extends GetxController {
  var gymData;
  RxBool isLoading = false.obs;
  String path = "assets/Icons/";
  List<String> icon = [
    "assets/Icons/aerobics.svg",
    "assets/Icons/box.svg",
    "assets/Icons/children_selection.svg",
    "assets/Icons/dances.svg",
    "assets/Icons/gym.svg",
    "assets/Icons/run.svg",
    "assets/Icons/swimming.svg",
    "assets/Icons/wrestling.svg"
  ];

  @override
  void onInit() async {
    gymData.clear();
    readJson();
    super.onInit();
  }

  updateState(val) {
    gymData = val;
    update();
  }

  updateFav(val) {
    isLoading.value = val;
    update();
  }

  Future<void> readJson() async {
    updateFav(true);
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    gymData = data;
    // return data;
    updateFav(false);
    print(data);
    updateState(data);
  }

  UpdateFav(id, index, context) async {
    var rawJSON = await json.decode(
        await DefaultAssetBundle.of(context).loadString('assets/data.json'));

    rawJSON['gyms'][index]['favorite'] = true;
    // ? rawJSON['gyms'][index]['favorite'] = false
    // : rawJSON['gyms'][index]['favorite'] = true;
    var var1 = json.encode(rawJSON);
    await readJson();
    print('updated');
  }
}
