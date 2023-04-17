import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../utils/utils.dart';

class ResultTopWidget extends StatelessWidget {
  const ResultTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Get.back();
          },
          borderRadius: BorderRadius.circular(24),
            child: SvgPicture.asset(
          Assets.BACK_ICON,
          width: 20,
        )),
        Spacer(),
        Text(
          'Your result',
          style: TextStyle(fontSize: 20, color: HexColor.fromHex('A4A4A4')),
        ),
        Spacer(),
        SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
