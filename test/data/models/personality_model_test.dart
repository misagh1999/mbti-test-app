import 'package:english_mbti_test_app/data/models/personality_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Testing result files', () {
    test('All result files open correctly', () async {
      final AType = ['E', 'I'];
      final BType = ['N', 'S'];
      final CType = ['F', 'T'];
      final DType = ['P', 'J'];

      List<String> typeList = [];

      for (String a in AType) {
        for (String b in BType) {
          for (String c in CType) {
            for (String d in DType) {
              final type = a + b + c + d;
              typeList.add(type);
            }
          }
        }
      }

      for (String type in typeList) {
        PResultModel model = PResultModel(type: type);
        await model.loadResult();

        expect(model.type.isNotEmpty, true);
        expect(model.favoriteSentence.isNotEmpty, true);
        expect(model.desc.isNotEmpty, true);
        expect(model.work.isNotEmpty, true);
        expect(model.relationship.isNotEmpty, true);
        expect(model.hobby.isNotEmpty, true);
        expect(model.sugesstions.isNotEmpty, true);
        // expect(model.darkColor, true);
        // expect(model.lightColor, true);
        expect(model.imgPath.isNotEmpty, true);
      }
    });
  });
}
