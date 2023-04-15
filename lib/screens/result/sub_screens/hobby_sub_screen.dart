import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../utils/utils.dart';

class HobbySubScreen extends StatelessWidget {
  const HobbySubScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                'Hobby',
                style: TextStyle(fontFamily: Fonts.Bold, fontSize: 16),
              ),
              Spacer(),
              Text(
                'ISTP',
                style: TextStyle(fontFamily: Fonts.Bold, fontSize: 22),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            MyString.DESCRIPTION_DEMO,
            style: TextStyle(color: HexColor.fromHex('5F5F5F'), fontSize: 16),
          ),
          Spacer(
            flex: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                Assets.HOBBY_IMG,
                height: Get.width / 2,
              ),
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}
