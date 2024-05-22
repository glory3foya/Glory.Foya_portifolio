import 'package:flutter/material.dart';
import 'package:gloryportifolio/constants/colors.dart';
import 'package:gloryportifolio/constants/skill_items.dart';

class SkillsDEsktop extends StatelessWidget {
  const SkillsDEsktop({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //platforms
                        //ConstrainedBox for avoiding overflow of containers
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 450,
                          ),
                          //wrap widget bcz of 4 containers
                          child: Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: [
                              for (int i = 0; i < platformItems.length; i++)
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: CustomColor.bglight2,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10.0),
                                    leading: Image.asset(
                                      platformItems[i]["img"],
                                      width: 26,
                                    ),
                                    title: Text(platformItems[i]["title"]),
                                  ),
                                )
                            ],
                          ),
                        ),
                       const SizedBox(width: 50),

                        //skills
                        Flexible(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 500,
                            ),
                            child: Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
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
                            ),
                          ),
                        )
                      ],
                    );
  }
}