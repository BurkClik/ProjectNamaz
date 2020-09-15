import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaz_project_x/components/default_button.dart';
import 'package:namaz_project_x/constant.dart';
import 'package:namaz_project_x/screens/demo_home.dart';
import 'package:namaz_project_x/screens/prayer_time/prayer_time.dart';
import 'package:namaz_project_x/size_config.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

/// TODO:
///   [] GPS kullanarak konum al yavru.
///   [] İl seçince ilin ilçeleri gelecek.
///   [] Pickerların tasarımı yapılacak.

class ChooseLocationBody extends StatefulWidget {
  @override
  _ChooseLocationBodyState createState() => _ChooseLocationBodyState();
}

class _ChooseLocationBodyState extends State<ChooseLocationBody> {
  var selectedIl = "Ankara";
  var selectedIlce = "EMolu";

  var cities = {
    'Adana': ['Ankara', 'Mankara'],
    'Adıyaman': ['Molu', 'Dolu'],
    'Afyon': ['DMolu', 'Dolu'],
    'Amasya': ['SMolu', 'Dolu'],
    'Ankara': ['EMolu', 'Dolu']
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "İl ve İlçenizi Seçiniz",
              style: GoogleFonts.muli(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Lütfen haftada bir internete bağlanıp uygulamaya giriniz. \nVerilerimiz haftalık olarak yenilenmektedir.",
              textAlign: TextAlign.center,
              style: GoogleFonts.muli(),
            ),
            Spacer(flex: 3),
            Container(
              width: getProportionateScreenWidth(200),
              height: getProportionateScreenHeight(50),
              child: RaisedButton.icon(
                color: Colors.white,
                elevation: 8,
                icon: Icon(Icons.arrow_downward),
                label: Text(selectedIl),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: kPrimaryColor, width: 2.0),
                ),
                onPressed: () => showMaterialScrollPicker(
                  context: context,
                  title: "İli Seçin",
                  headerColor: kPrimaryColor,
                  buttonTextColor: kPrimaryColor,
                  showDivider: false,
                  items: cities.keys.toList(),
                  selectedItem: selectedIl,
                  onChanged: (value) => setState(
                    () {
                      selectedIl = value;
                      selectedIlce = cities[value].first;
                    },
                  ),
                  onCancelled: () => print("Scroll Picker cancelled"),
                  onConfirmed: () => print("Scroll Picker confirmed"),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(32),
            ),
            Container(
              width: getProportionateScreenWidth(200),
              height: getProportionateScreenHeight(50),
              child: RaisedButton.icon(
                color: Colors.white,
                elevation: 8,
                icon: Icon(Icons.arrow_downward),
                label: Text(selectedIlce),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: kPrimaryColor, width: 2.0),
                ),
                onPressed: () => showMaterialScrollPicker(
                  context: context,
                  title: "İlçeyi Seçin",
                  headerColor: kPrimaryColor,
                  buttonTextColor: kPrimaryColor,
                  showDivider: false,
                  items: cities[selectedIl],
                  selectedItem: selectedIlce,
                  onChanged: (value) => setState(() => selectedIlce = value),
                  onCancelled: () => print("Scroll Picker cancelled"),
                  onConfirmed: () => print("Scroll Picker confirmed"),
                ),
              ),
            ),
            Spacer(flex: 3),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: DefaultButton(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DemoHome(),
                    ),
                  );
                },
                text: 'Devamkee',
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
