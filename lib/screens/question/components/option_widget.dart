import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class OptionWidget extends StatelessWidget {
  OptionWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: HexColor.fromHex('EEEEEE'),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: HexColor.fromHex('626262')),
      ),
    );
  }
}