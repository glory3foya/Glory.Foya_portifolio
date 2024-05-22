import 'package:flutter/material.dart';
import 'package:gloryportifolio/constants/colors.dart';
import 'package:gloryportifolio/utils/project_utils.dart';
import 'package:gloryportifolio/widgets/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    return  Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: screenWidth,
                child: Column(
                  children: [
                    //work project title
                   const Text(
                      'Work Projects',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                        fontSize: 24,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    //work project card
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 900,
                      ),
                      child: Wrap(
                         spacing: 40,
                        runSpacing: 40,
                        children: [
                          for (int i = 0; i < workProjectUtils.length; i++)
                            ProjectCardWidget(project: workProjectUtils[i]),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),

                    //hobby
                    const Text(
                      'Hobby Shows',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                        fontSize: 24,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    //Hobby shows i love warcong
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 900,
                      ),
                      child: Wrap(
                        spacing: 40,
                        runSpacing: 40,
                        children: [
                          for (int i = 0; i < hobbyProjectUtils.length; i++)
                            ProjectCardWidget(project: hobbyProjectUtils[i]),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}