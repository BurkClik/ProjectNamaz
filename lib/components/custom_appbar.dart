import 'package:flutter/material.dart';
import 'package:namaz_project_x/components/appbar_content.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'ANKARA',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 2.0,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            print("Herkese Salam");
          },
        ),
      ],
      iconTheme: IconThemeData(color: Colors.white),
      pinned: true,
      floating: true,
      snap: false,
      expandedHeight: 240.0,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/anakara.jpg",
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.softLight,
              color: Colors.black45,
            ),
          ),
          FlexibleSpaceBar(
            background: MyFlexiableAppBar(),
          ),
        ],
      ),
    );
  }
}
