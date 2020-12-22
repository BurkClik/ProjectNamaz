import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaz_project_x/screens/choose_location/choose_location_body.dart';
import 'package:namaz_project_x/services/location.dart';
import 'package:geolocator/geolocator.dart';

class ChooseLocation extends StatefulWidget {
  static String routeName = "/choose_location";

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  LocationPermission permissionControl;

  void getLocation() async {
    Location location = new Location();
    await location.getLocation();

    LocationPermission permission = await checkPermission();
    permissionControl = permission;
    print(permissionControl);
    print(location.adArea);
    print(location.subArea);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lütfen lokasyon seçiniz',
          style: GoogleFonts.muli(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              getLocation();
            },
          ),
        ],
      ),
      body: ChooseLocationBody(),
    );
  }
}
