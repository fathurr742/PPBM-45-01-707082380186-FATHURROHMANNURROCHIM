import 'package:e_commerce/app/helper/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MySettingPage extends StatefulWidget {
  const MySettingPage({super.key});

  @override
  State<MySettingPage> createState() => _MySettingPageState();
}

class _MySettingPageState extends State<MySettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          heigh: 0,
          title: 'Setting',
          bgcolor: Colors.white,
          textcolor: Colors.black,
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            profilImage(),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 20,
              thickness: 1,
            ),
            tileSetting(),
          ],
        ));
  }

  Widget profilImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 50,
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/fathur.png'),
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Fathurrohman \nNurRochim',
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Make a line that have color and its vertical
            Container(
              height: 100,
              width: 1,
              color: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'View \nDetail',
                    style: GoogleFonts.raleway(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Center(
                            child: Icon(
                              MdiIcons.arrowRight,
                              color: Colors.white,
                            ),
                          ))),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget tileSetting() {
    return const Column(
      children: [
        ListTile(
          title: Text('Security'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          title: Text('Notification'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          title: Text('Privacy'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          title: Text('Help'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          title: Text('About'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
