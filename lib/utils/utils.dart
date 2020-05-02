import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

String currency(double value) {

  NumberFormat nf = new NumberFormat("#,###", "pt_BR");
  
  return "R\$ " + nf.format(value);
}

Future<List<dynamic>> parseJsonFromAssets(String assetsPath) async {
  List<dynamic> list = await rootBundle.loadString(assetsPath)
    .then((jsonStr) => jsonDecode(jsonStr));

    return Future.value(list);
}