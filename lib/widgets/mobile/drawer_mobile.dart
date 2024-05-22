import 'package:flutter/material.dart';
import 'package:gloryportifolio/constants/colors.dart';
import 'package:gloryportifolio/constants/nav_titles.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
          backgroundColor: CustomColor.scaffoldbg,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,top: 20, left: 20),
                  child: IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                   icon: const Icon(
                    Icons.close,
                    color: CustomColor.whiteSecondary,
                   ),                 
                   ),
                ),
              ),
              for (int i = 0; i < navIcons.length; i++)
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  leading: Icon(navIcons[i]),
                  title: Text(navTitles[i]),
                  titleTextStyle: const TextStyle(
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.0
                  ),
                  onTap: (){
                    onNavItemTap(i);
                  },
                ),
            ],
          ),
        );
  }
}