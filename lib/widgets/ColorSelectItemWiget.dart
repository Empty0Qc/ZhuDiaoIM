import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSelectItemWidget extends Container {
  ColorSelectItemWidget(Color color, {Key? key})
      : super(
            key: key,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            height: 20,
            width: 20);
}
