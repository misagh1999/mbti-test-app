import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../utils/utils.dart';

class SuggestionItemWidget extends StatelessWidget {
  const SuggestionItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
                color: HexColor.fromHex('E4C728'),
                borderRadius: BorderRadius.circular(15)),
          ),
          SizedBox(
            width: 8,
          ),
          Flexible(
              child: Text(
            MyString.SUGGESTION_DEMO,
            style: TextStyle(color: HexColor.fromHex('696969'), fontSize: 16),
          ))
        ],
      ),
    );
  }
}
