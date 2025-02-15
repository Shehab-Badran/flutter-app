import 'package:flutter/material.dart';
import 'app_color.dart';
import 'homepage.dart';
import 'customer_support_screen.dart';
import 'user_profile_screen.dart';

class BottomAppBarMenu extends StatefulWidget {
  const BottomAppBarMenu({super.key});

  @override
  State<BottomAppBarMenu> createState() => _BottomAppBarMenuState();
}

class _BottomAppBarMenuState extends State<BottomAppBarMenu> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.10,
      color: AppColor.primaryColor,
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home_outlined,
              color: AppColor.bottomAppbarIconColor,
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.person_3_outlined,
              color: AppColor.bottomAppbarIconColor,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UserProfileScreen();
                },
              ));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.message_outlined,
              color: AppColor.bottomAppbarIconColor,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CustomerSupportScreen();
                },
              ));
            },
          ),
         
        ],
      ),
    );
  }
}
