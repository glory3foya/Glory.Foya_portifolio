import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gloryportifolio/constants/colors.dart';
import 'package:gloryportifolio/constants/nav_titles.dart';
import 'package:gloryportifolio/styles/style.dart';
import 'package:gloryportifolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMenuTab});
  final Function(int) onNavMenuTab;

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 60,
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical:20 ),
              decoration: kHeaderDecoration,
              child: Row(
                children: [
                  SiteLogo(onTap: (){

                  },),

                  //Spacer() without specifying the flex property, it will take up all available space along the main axis of its parent Row
                 const Spacer(),
                  for(int i =0; i<navTitles.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {
                        onNavMenuTab(i);
                      },
                      child: Text(navTitles[i],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.whitePrimary,
                      ),),                  
                    ),
                  ),
                ],
              ),
            );
  }
}