import 'package:flutter/material.dart';
import 'package:gloryportifolio/constants/colors.dart';
import 'package:gloryportifolio/constants/links.dart';
import 'package:gloryportifolio/constants/size.dart';
import 'package:gloryportifolio/widgets/contact_section.dart';
import 'package:gloryportifolio/widgets/desktop/skills_desktop.dart';
import 'package:gloryportifolio/widgets/footer.dart';
import 'package:gloryportifolio/widgets/mobile/drawer_mobile.dart';
import 'package:gloryportifolio/widgets/desktop/header_desktop.dart';
import 'package:gloryportifolio/widgets/mobile/header_mobile.dart';
import 'package:gloryportifolio/widgets/desktop/main_desktop.dart';
import 'package:gloryportifolio/widgets/mobile/main_mobile.dart';
import 'package:gloryportifolio/widgets/mobile/skills_mobile.dart';
import 'package:gloryportifolio/widgets/project_section.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldbg,
        //specify a drawer that appears on the right side of the screen, to open it should have scaffold key declared 1st as variable
        endDrawer: constraints.maxWidth >= kMinDesktopWIdth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
                //call function
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarKeys.first),
              //main
              if (constraints.maxWidth >= kMinDesktopWIdth)
                HeaderDesktop(onNavMenuTab: (int navIndex) {
                  //call funtion
                  scrollToSection(navIndex);
                })
              else
                HeaderMobile(
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  onLogoTap: () {},
                ),

              //conditional for responsive main desktop (mobile & desktop)
              if (constraints.maxWidth >= kMedDesktopWIdth)
                //function of MainDesktop (intro)
                 MainDesktop(scrollToContactSection: scrollToContactSection)
              else
                const MainMobile(),

              //SKILLS
              Container(
                key: navbarKeys[1],
                //styling the container
                color: CustomColor.bglight1,
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title of the section
                    const Text(
                      'What I can DO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                        fontSize: 24,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 50),

                    if (constraints.maxWidth >= kMedDesktopWIdth)
                      //platforms and skills for desktop
                      const SkillsDEsktop()
                    else
                      //platforms and skill for  mobile
                      const SkillsMobile(),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              //PROJECT
              ProjectSection(key: navbarKeys[2]),
              const SizedBox(height: 30),

              //CONTACT
              ContactSection(key: navbarKeys[3]),

              //FOOTER
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

//function to navigate to respective window
  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      //open a blog page
      js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // Function to scroll to the ContactSection
  void scrollToContactSection() {
    final key = navbarKeys[3];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

}
