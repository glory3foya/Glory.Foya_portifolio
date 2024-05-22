import 'package:flutter/material.dart';
import 'package:gloryportifolio/constants/colors.dart';
import 'package:gloryportifolio/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key, 
    required this.project,
  });
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      //ensures that the content is clipped with anti-aliasing, which helps to smooth the edges of the clipped content for a more visually appealing appearance.
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: CustomColor.bglight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            project.image,
            height: 140,
            width: 260,
            //ensuring the image fits over
            fit: BoxFit.cover,
          ),
          //title
          Padding(
            padding: const EdgeInsets.fromLTRB(12,15,12,12),
            child: Text(
             project.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          //subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12,0,12,12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                fontSize: 13.0,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const Spacer(),
          //footer of the card
          Container(
            color: CustomColor.bglight1,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
               const Text('Available on: ',
                style: TextStyle(
                  color:CustomColor.orangeSecondary,
                  fontSize: 10,
                ),
                ),
              const  Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: InkWell(
                    onTap: (){
                     js.context.callMethod("open",[project.gitHubLink]);
                    },
                    child: Image.asset(
                      'assets/project/link.png' ,
                    width: 19,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
