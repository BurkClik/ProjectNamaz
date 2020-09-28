import 'package:flutter_test/flutter_test.dart';
import 'package:namaz_project_x/json_parsing.dart';

void main() {
  test("parses times.json", () {
    const jsonString = """{"il":"Ankara", "ilce":"Etlik", "vakitler":[{"09.10.2020":{"imsak":"06:20"}}]}""";
    expect(parseVakit(jsonString).il, "Ankara");
  });
}