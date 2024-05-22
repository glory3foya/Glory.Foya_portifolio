import 'package:flutter/material.dart';
import 'package:gloryportifolio/constants/colors.dart';


class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key, required this.scrollToContactSection});
   final VoidCallback scrollToContactSection;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
   

// // Define a function to navigate to the ContactScreen
//     void navigateToContactScreen(BuildContext context) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ContactSection()),
//       );
//     }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.2,
      //constraints are usful when user minimizes the browser inorder to avoid overflow issue
      constraints: const BoxConstraints(minHeight: 360.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //intro message
              const Text(
                "Hello\nI'm Glory Foya\nAn Excellent Flutter Developer",
                style: TextStyle(
                  fontSize: 30.0,
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
                width: 200,
                child: ElevatedButton(
                  onPressed: scrollToContactSection,
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
            ],
          ),
          Image.asset(
            'assets/flutter1.png',
            width: screenWidth / 2,
          ),
        ],
      ),
    );
  }
}
