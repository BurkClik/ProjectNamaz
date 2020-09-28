import 'package:namaz_project_x/models/vakit.dart';
import 'dart:convert' as json;

Vakit parseVakit(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  Vakit vakit = Vakit.fromJson(parsed);
  return vakit;
}