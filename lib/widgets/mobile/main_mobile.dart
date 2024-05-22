import 'package:flutter/material.dart';
import 'package:gloryportifolio/constants/colors.dart';
import 'package:gloryportifolio/widgets/contact_section.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

// Define a function to navigate to the ContactScreen
void navigateToContactScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  ContactSection()),
  );
}

    return Container(
                margin: const EdgeInsets.symmetric(
              horizontal: 35.0, vertical: 30.0),
                height: screenHeight,
                constraints: const BoxConstraints(minHeight: 560.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //avatar image
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(colors: [
                            CustomColor.scaffoldbg.withOpacity(0.5),
                            CustomColor.scaffoldbg.withOpacity(0.6),
                          ]).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: Image.asset(
                          'assets/flutter1.png',
                          width: screenWidth,
                        ),
                      ),
                    ),

                   const SizedBox(
                      height: 20,
                    ),

                    //intro text
                    const Text(
                      "Hello\nI'm Glory Foya\nAn Excellent Flutter Developer",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                        letterSpacing: 1.0,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                        //  navigateToContactScreen;
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColor.orangePrimary),
                        ),
                        child: const Text(
                          'Get in touch',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    //btn
                  ],
                ),
              );

  }
  // Define a function to navigate to the ContactScreen
// void navigateToContactScreen(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const ContactSection()),
//   );
// }
}