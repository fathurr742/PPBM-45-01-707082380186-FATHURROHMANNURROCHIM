import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actionbar;
  final TabBar? tabBar;
  final double heigh;
  final Color? bgcolor;
  final Color? textcolor;

  const CustomAppBar(
      {super.key,
      this.title,
      this.bgcolor,
      this.textcolor,
      this.actionbar,
      this.tabBar,
      required this.heigh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: bgcolor ?? Colors.transparent,
        title: Text(
          title!,
          style: GoogleFonts.abrilFatface(
              color: textcolor ?? Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: actionbar,
        bottom: tabBar,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + heigh);
}
