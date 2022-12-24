import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget classes(gym, index) {
  return Container(
    // color: Colors.blue,
    margin: EdgeInsets.symmetric(
      horizontal: 10.0,
    ),
    child: CircleAvatar(
      radius: 40,
      backgroundColor: Colors.blue,
      child: SvgPicture.asset(
        gym.icon[index],
        height: 55,
        color: Colors.white,
      ),
    ),
  );
}
