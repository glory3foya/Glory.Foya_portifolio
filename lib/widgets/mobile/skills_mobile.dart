import 'package:flutter/material.dart';
import 'package:gloryportifolio/constants/colors.dart';
import 'package:gloryportifolio/constants/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return  ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      child: Column(
                    children: [
                      //platform 
                      for(int i=0; i<platformItems.length; i++)
                      Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: CustomColor.bglight2,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                          leading: Image.asset(
                            platformItems[i]['img'],
                          width: 26.0
                          ),
                          title: Text(platformItems[i]['title']),
                        ),
                      ),
                      const SizedBox(height: 50.0),
      
                       //skills 
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        alignment: WrapAlignment.center,
                        children: [
                                  for (int i = 0; i < skillItems.length; i++)
      
                          Chip(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      backgroundColor: CustomColor.bglight2,
                                      label: Text(skillItems[i]['title']),
                                      avatar: Image.asset(skillItems[i]['img']),
                                      shape: const StadiumBorder(), // Make it circular
                                      clipBehavior:
                                          Clip.antiAlias, // Ensure smooth edges
                                    ),
                        ],
                      )
                    ],
                   ),
    );
  }
}