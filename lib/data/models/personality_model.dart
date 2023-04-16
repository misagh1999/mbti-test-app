import 'dart:convert';

import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/services.dart';

import 'question.dart';

class PersonalityModel {
  final String code;

  late String type;

  late int eValue;
  late int iValue;

  late int nValue;
  late int sValue;

  late int fValue;
  late int tValue;

  late int pValue;
  late int jValue;

  PersonalityModel({required this.code});

  factory PersonalityModel.createFromCode(String code) {
    PersonalityModel model = PersonalityModel(code: code);
    model._calculateType();

    return model;
  }

  _calculateType() {
    int eNum = 0;
    int nNum = 0;
    int fNum = 0;
    int pNum = 0;

    for (int i = 0; i < code.length; i++) {
      if (code[i] == Types.E)
        eNum++;
      else if (code[i] == Types.N)
        nNum++;
      else if (code[i] == Types.F)
        fNum++;
      else if (code[i] == Types.P) pNum++;
    }

    this.eValue = eNum;
    this.iValue = 15 - eNum;

    this.nValue = nNum;
    this.sValue = 15 - nNum;

    this.fValue = fNum;
    this.tValue = 15 - fNum;

    this.pValue = pNum;
    this.jValue = 15 - pNum;

    String result = "";

    if (eNum > 7)
      result += Types.E;
    else
      result += Types.I;

    if (nNum > 7)
      result += Types.N;
    else
      result += Types.S;

    if (fNum > 7)
      result += Types.F;
    else
      result += Types.T;

    if (pNum > 7)
      result += Types.P;
    else
      result += Types.J;

    this.type = result;
  }
}

class PResultModel {
  final String type;
  late String title;
  late String favoriteSentence;
  late String desc;
  late String work;
  late String relationship;
  late String hobby;
  late List<String> sugesstions;
  late String imgPath;
  late Color darkColor;
  late Color lightColor;

  late Map<String, dynamic> _loadedJson;

  PResultModel({required this.type});

  loadResult() async {
    this._loadedJson = await _loadJsonFile(this.type);

    this.title = this._loadedJson['title'];
    this.favoriteSentence = this._loadedJson['favorite_sen'];
    this.desc = this._loadedJson['desc'];
    this.work = this._loadedJson['work'];
    this.relationship = this._loadedJson['relationship'];
    this.hobby = this._loadedJson['hobby'];
    this.sugesstions = List<String>.from(this._loadedJson['suggestion']);
    this.darkColor = HexColor.fromHex(this._loadedJson['dark_color']);
    this.lightColor = HexColor.fromHex(this._loadedJson['light_color']);

    this.imgPath = 'assets/icons/mbti/' + this.type + ".svg";

    return this;
  }

  Future<dynamic> _loadJsonFile(String type) async {
    String path = "assets/test_result/";
    String data = await rootBundle.loadString("$path$type.json");
    final jsonResult = jsonDecode(data);

    return jsonResult;
  }
}
