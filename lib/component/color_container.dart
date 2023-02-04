import 'package:developer_count_up_app/extension/deviceSize.dart';
import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth / 10,
      height: context.screenWidth / 10,
      color: color,
    );
  }
}
