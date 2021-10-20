import 'package:auto_size_text/auto_size_text.dart';
import 'package:dev_icons/dev_icons.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vainqueur_2/config/statics.dart';
import 'package:vainqueur_2/models/project.dart';
import 'package:vainqueur_2/models/tags.dart';
import 'package:vainqueur_2/routing/router.dart';
import 'package:vainqueur_2/routing/routes.dart';

class MobileHomepage extends StatefulWidget {
  const MobileHomepage({Key? key}) : super(key: key);

  @override
  _MobileHomepageState createState() => _MobileHomepageState();
}

class _MobileHomepageState extends State<MobileHomepage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _waveController;
  late final Animation<double> _animation = CurvedAnimation(
    parent: _waveController,
    curve: const Interval(0.01, 1.0, curve: Curves.elasticOut),
  );

  Color? gitIconTextColor = Colors.grey[300];
  Color? linkedInIconTextColor = Colors.grey[300];
  Color? contactButton = Color(0xffffdb2d52);
  Color? projectsButton = Color(0xffffdb2d52);
  Color? resumeButton = Colors.grey[300];
  Color? aboutButton = Colors.grey[300];
  Color? scrollButton = Color(0xffffdb2d52);
  Color? projects2Button = Colors.grey[300];

  Color? normalColor = Color(0xffffdb2d52);
  Color? normalColor2 = Colors.grey[200];

  Color? hoverColor = const Color(0xffff80192f);
  Color? hoverColor2 = Colors.grey[400];
  Color? hoverColor3 = Color(0xffffdb2d52);

  final projectKey = GlobalKey();
  final aboutKey = GlobalKey();
  final splashKey = GlobalKey();

  bool isContacting = false;

  bool fakebookHover = false;
  bool lenderHover = false;
  bool portfolioHover = false;
  bool detectorHover = false;

  late double projectHeight;
  late double projectWidth;

  late double lenderHeight;
  late double lenderWidth;

  late double portfolioHeight;
  late double portfolioWidth;

  late double detectorHeight;
  late double detectorWidth;

  bool _showBackToTopButton = false;

  late ScrollController _scrollController;

  Project fakebook = Project(
    'assets/fakebook1.jpg',
    "Fakebook",
    "Fakebook is a social media application that was written using java and is compatible with android versions 5 and above. The app offers an integrated messaging system where users can communicate with their friends and anybody that they have connected with on the app. The app also has a modern and slick orange colour scheme and allows for a variety of customization options of your personal profile. The app uses Firebase in order to store user details along with messages by that user.",
    "https://github.com/VainqueurK/Fakebook_re",
    Tags([
      "Java",
      "JavaFX",
      "Firebase",
      "Android",
    ]),
  );

  Project lender = Project(
    'assets/ML_login.png',
    "Heavy Machinery Rental System",
    "This machinery rental management tool will allow for companies who need a specific machine to easily check for its availability, price, specifications and make a rental for a specific time period.",
    "https://github.com/VainqueurK/Machinary_Lender_System",
    Tags([
      "Java",
      "JavaFX",
      "JavaxMail",
    ]),
  );

  Project portfolio = Project(
    'assets/WebPortfolio.png',
    "Web Portfolio",
    "Personal web portfolio",
    "https://github.com/VainqueurK/PersonalWebsite",
    Tags([
      "Flutter",
      "Dart",
    ]),
  );

  Project detector = Project(
    'assets/output.png',
    "Vehicle Speed Detection",
    "Final year project, a computer vision and machine learning project to try to estimate the speed of oncoming vehicles from a single video without any information on the environment or camera angles and perspective. Using Visual Studio Code as the text editor/IDE.",
    "https://github.com/VainqueurK/VideoSpeedEstimator",
    Tags([
      "Python",
      "PyQt5",
      "YOLOv4",
      "OpenCV",
    ]),
  );

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 600) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });

    _waveController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Statics.DEVICE_HEIGHT(context),
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    key: splashKey,
                    margin: EdgeInsets.only(
                        top: Statics.DEVICE_HEIGHT(context) * 0.06),
                    padding: EdgeInsets.only(
                      left: Statics.DEVICE_WIDTH(context) * 0.1,
                      right: Statics.DEVICE_WIDTH(context) * 0.1,
                    ),
                    height: Statics.DEVICE_HEIGHT(context) -
                        Statics.DEVICE_HEIGHT(context) * 0.06,
                    width: Statics.DEVICE_WIDTH(context),
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: Statics.DEVICE_HEIGHT(context) * 0.15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  AutoSizeText(
                                    "Hi!",
                                    style: GoogleFonts.getFont(
                                      'Lato',
                                      fontSize: 55,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFFFF3c3252),
                                    ),
                                    minFontSize: 10,
                                    maxLines: 1,
                                  ),
                                  Center(
                                    child: RotationTransition(
                                      turns: _animation,
                                      child: const FaIcon(
                                        FontAwesomeIcons.handSparkles,
                                        color: Color(0xffffdb2d52),
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AutoSizeText(
                                "I'm Vainqueur Kayombo",
                                style: GoogleFonts.getFont(
                                  'Lato',
                                  fontSize: 65,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFFF3c3252),
                                ),
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: Statics.DEVICE_HEIGHT(context) * 0.01,
                              ),
                              AutoSizeText(
                                "Software Developer",
                                style: GoogleFonts.getFont(
                                  'Lato',
                                  fontSize: 35,
                                  color: Color(0XFFFFdb2d52),
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: Statics.DEVICE_HEIGHT(context) * 0.075,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () => Scrollable.ensureVisible(
                                      projectKey.currentContext!,
                                      duration: Duration(seconds: 2),
                                      curve: Curves.easeInOut,
                                    ),
                                    onHover: (hover) {
                                      setState(() {
                                        projectsButton =
                                            hover ? hoverColor : normalColor;
                                      });
                                    },
                                    child: Container(
                                      height:
                                          Statics.DEVICE_HEIGHT(context) * 0.04,
                                      width:
                                          Statics.DEVICE_WIDTH(context) * 0.1,
                                      constraints: const BoxConstraints(
                                          minHeight: 35, minWidth: 175),
                                      decoration: BoxDecoration(
                                        color: projectsButton,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: AutoSizeText(
                                            "My Projects",
                                            style: GoogleFonts.getFont(
                                              'Lato',
                                              fontSize: 24,
                                              color: Colors.grey[200],
                                              fontWeight: FontWeight.bold,
                                            ),
                                            minFontSize: 12,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Statics.DEVICE_WIDTH(context) * 0.01,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Statics.DEVICE_HEIGHT(context) * 0.075,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  color: Colors.grey,
                                  spreadRadius: 2)
                            ],
                          ),
                          constraints: const BoxConstraints(
                              minHeight: 100, minWidth: 100),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: Statics.DEVICE_HEIGHT(context) * 0.14,
                              backgroundImage:
                                  const AssetImage('assets/blast_off.gif')),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    key: aboutKey,
                    child: _aboutScreen(),
                  ),
                  Card(
                    key: projectKey,
                    child: _projectScreen(),
                  ),
                  _footerSection(),
                ],
              ),
            ),
            Material(
              elevation: 15,
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                ),
                padding: EdgeInsets.only(
                  left: Statics.DEVICE_WIDTH(context) * 0.1,
                  right: Statics.DEVICE_WIDTH(context) * 0.1,
                ),
                height: Statics.DEVICE_HEIGHT(context) * 0.07,
                width: Statics.DEVICE_WIDTH(context),
                decoration: const BoxDecoration(
                  color: Color(0XFFFF3c3252),
                ),
                child: Row(
                  children: [
                    _title(),
                    const FaIcon(
                      FontAwesomeIcons.rocket,
                      color: Color(0xffffdb2d52),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    //ADD THE MENU BUTTON HERE
                    SizedBox(
                      width: Statics.DEVICE_WIDTH(context) * 0.01,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () => Scrollable.ensureVisible(
                        splashKey.currentContext!,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      ),
                      onHover: (hover) {
                        setState(() {
                          scrollButton = hover ? hoverColor : normalColor;
                        });
                      },
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: _showBackToTopButton ? 1 : 0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 700),
                          height: _showBackToTopButton ? 70 : 0,
                          width: _showBackToTopButton ? 70 : 0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: scrollButton,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2)
                            ],
                          ),
                          child: Center(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: _showBackToTopButton ? 1 : 0,
                              child: FaIcon(
                                FontAwesomeIcons.arrowUp,
                                color: Colors.grey[200],
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Statics.DEVICE_WIDTH(context) * 0.075,
                    ),
                  ],
                ),
                SizedBox(
                  height: Statics.DEVICE_HEIGHT(context) * 0.05,
                ),
              ],
            ),
            Visibility(
              visible: (isContacting),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isContacting = false;
                      });
                    },
                    child: Container(
                      height: Statics.DEVICE_HEIGHT(context),
                      width: Statics.DEVICE_WIDTH(context),
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: Colors.black.withOpacity(0.6),
                              spreadRadius: 2)
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Statics.DEVICE_HEIGHT(context) * 0.05,
                        vertical: Statics.DEVICE_WIDTH(context) * 0.04,
                      ),
                      height: Statics.DEVICE_HEIGHT(context) * 0.6,
                      width: Statics.DEVICE_WIDTH(context) * 0.5,
                      child: Center(
                        child: AutoSizeText(
                          "Work In Progress...",
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontSize: 45,
                            color: normalColor,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 12,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _aboutScreen() {
    double iconSize = 25;
    Color? iconColors = Color(0XFFFF3c3252);

    return Container(
      padding: EdgeInsets.only(
        top: Statics.DEVICE_HEIGHT(context) * 0.06,
        left: Statics.DEVICE_WIDTH(context) * 0.1,
        right: Statics.DEVICE_WIDTH(context) * 0.1,
      ),
      height: Statics.DEVICE_HEIGHT(context) * 0.9,
      width: Statics.DEVICE_WIDTH(context),
      color: Color(0XFFFFdb2d52), //Color(0XFFFF3c3252), //Color(0XFFFFeeeeee),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Statics.DEVICE_HEIGHT(context) * 0.025,
          ),
          AutoSizeText(
            "About",
            style: GoogleFonts.getFont(
              'Lato',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color(0XFFFFeeeeee),
            ),
            minFontSize: 12,
            maxLines: 2,
          ),
          SizedBox(
            height: Statics.DEVICE_HEIGHT(context) * 0.025,
          ),
          AutoSizeText(
            "Computer Science graduate from University of Limerick \nand tech enthusiast!",
            style: GoogleFonts.getFont(
              'Lato',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0XFFFFeeeeee),
            ),
            minFontSize: 8,
            maxLines: 5,
          ),
          SizedBox(
            height: Statics.DEVICE_HEIGHT(context) * 0.05,
          ),
          Row(
            children: [
              InkWell(
                onTap: () => launch(
                    'https://drive.google.com/uc?export=download&id=1M5Cem_wC5oQd7MoiR78lpbgTq7aB-YeN'),
                onHover: (hover) {
                  setState(() {
                    resumeButton = hover ? hoverColor2 : normalColor2;
                  });
                },
                child: Container(
                  height: Statics.DEVICE_HEIGHT(context) * 0.04,
                  width: Statics.DEVICE_WIDTH(context) * 0.1,
                  constraints:
                      const BoxConstraints(minHeight: 35, minWidth: 175),
                  decoration: BoxDecoration(
                    color: resumeButton,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: AutoSizeText(
                        "My Resume",
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 22,
                          color: Color(0XFFFF3c3252),
                          fontWeight: FontWeight.bold,
                        ),
                        minFontSize: 12,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 50,
                maxHeight: 250,
              ),
            ),
          ),
          AutoSizeText(
            "Languages I use",
            style: GoogleFonts.getFont(
              'Lato',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0XFFFFeeeeee),
            ),
            minFontSize: 12,
            //maxLines: 1,
          ),
          SizedBox(
            height: Statics.DEVICE_HEIGHT(context) * 0.025,
          ),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.start,
            children: [
              Container(
                height: iconSize + 50,
                width: iconSize + 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2)
                  ],
                ),
                child: Center(
                  child: Icon(
                    DevIcons.javaPlainWordmark,
                    size: iconSize + 30,
                    color: iconColors,
                  ),
                ),
              ),
              Container(
                height: iconSize + 50,
                width: iconSize + 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2)
                  ],
                ),
                child: Center(
                  child: Icon(
                    DevIcons.pythonPlainWordmark,
                    size: iconSize + 30,
                    color: iconColors,
                  ),
                ),
              ),
              Container(
                height: iconSize + 50,
                width: iconSize + 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2)
                  ],
                ),
                child: Center(
                  child: Icon(
                    DevIcons.dartPlainWordmark,
                    size: iconSize + 30,
                    color: iconColors,
                  ),
                ),
              ),
              Container(
                height: iconSize + 50,
                width: iconSize + 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2)
                  ],
                ),
                child: Center(
                  child: Icon(
                    DevIcons.luaPlainWordmark,
                    size: iconSize + 30,
                    color: iconColors,
                  ),
                ),
              ),
              Container(
                height: iconSize + 50,
                width: iconSize + 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2)
                  ],
                ),
                child: Center(
                  child: Column(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      FaIcon(
                        FontAwesomeIcons.plus,
                        color: iconColors,
                        size: iconSize,
                      ),
                      AutoSizeText(
                        "more",
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: iconColors,
                        ),
                        minFontSize: 12,
                        maxLines: 1,
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Statics.DEVICE_HEIGHT(context) * 0.1,
          ),
        ],
      ),
    );
  }

  _projectScreen() {
    return Container(
      padding: EdgeInsets.only(
        top: Statics.DEVICE_HEIGHT(context) * 0.06,
        left: Statics.DEVICE_WIDTH(context) * 0.1,
        right: Statics.DEVICE_WIDTH(context) * 0.1,
      ),
      height: Statics.DEVICE_HEIGHT(context),
      width: Statics.DEVICE_WIDTH(context),
      color: Color(0XFFFFeeeeee),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Statics.DEVICE_HEIGHT(context) * 0.025,
          ),
          Expanded(
            flex: 1,
            child: AutoSizeText(
              "My Projects",
              style: GoogleFonts.getFont(
                'Lato',
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color(0XFFFFdb2d52),
              ),
              minFontSize: 12,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: Statics.DEVICE_HEIGHT(context) * 0.025,
          ),
          Expanded(
            flex: 8,
            child: _projectList(),
          ),
          SizedBox(
            height: Statics.DEVICE_HEIGHT(context) * 0.1,
          ),
        ],
      ),
    );
  }

  _footerSection() {
    double iconSize = 65;

    return Container(
      padding: EdgeInsets.only(
        top: Statics.DEVICE_HEIGHT(context) * 0.02,
        left: Statics.DEVICE_WIDTH(context) * 0.2,
        right: Statics.DEVICE_WIDTH(context) * 0.2,
      ),
      //height: Statics.DEVICE_HEIGHT(context) * 0.2,
      width: Statics.DEVICE_WIDTH(context),
      color: Color(0XFFFF3c3252), //Color(0XFFFFeeeeee),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Find me on",
            style: GoogleFonts.getFont(
              'Lato',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0XFFFFeeeeee),
            ),
            minFontSize: 12,
            //maxLines: 1,
          ),
          SizedBox(
            height: Statics.DEVICE_HEIGHT(context) * 0.05,
          ),
          Row(
            children: [
              InkWell(
                onTap: () => launch('https://github.com/VainqueurK'),
                onHover: (hover) {
                  setState(() {
                    gitIconTextColor = hover ? hoverColor3 : normalColor2;
                  });
                },
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: FaIcon(
                    FontAwesomeIcons.github,
                    color: gitIconTextColor,
                    size: iconSize,
                  ),
                ),
              ),
              SizedBox(
                width: Statics.DEVICE_WIDTH(context) * 0.01 + 20,
              ),
              InkWell(
                onTap: () => launch('https://www.linkedin.com/in/vainqueur/'),
                onHover: (hover) {
                  setState(() {
                    linkedInIconTextColor = hover ? hoverColor3 : normalColor2;
                  });
                },
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: linkedInIconTextColor,
                    size: iconSize,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Statics.DEVICE_HEIGHT(context) * 0.05,
          ),
        ],
      ),
    );
  }

  _fakebook() {
    return Center(
      child: InkWell(
        onTap: () async {
          MyRouter().setProject(
              fakebook); //the project being passed to the router (can be any object)

          MyRouter.router.navigateTo(context, MyRoutes.projectsRoute,
              transition: TransitionType.cupertino,
              transitionDuration: const Duration(seconds: 1));
        },
        onHover: (e) {
          setState(() {
            fakebookHover = !fakebookHover;
          });
        },
        child: SizedBox(
          height: Statics.DEVICE_HEIGHT(context) * 0.3,
          width: Statics.DEVICE_WIDTH(context) * 0.35,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Statics.DEVICE_WIDTH(context) * 0.01,
                      ),
                      child: AutoSizeText(
                        "Learn More.",
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFFF3c3252),
                        ),
                        minFontSize: 12,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: Statics.DEVICE_HEIGHT(context) * 0.01,
                    ),
                  ],
                ),
                Center(
                  child: AutoSizeText(
                    "Fakebook",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFFF3c3252),
                    ),
                    minFontSize: 12,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _lender() {
    return Center(
      child: InkWell(
        onTap: () async {
          MyRouter().setProject(
              lender); //the project being passed to the router (can be any object)

          MyRouter.router.navigateTo(context, MyRoutes.projectsRoute,
              transition: TransitionType.cupertino,
              transitionDuration: const Duration(seconds: 1));
        },
        onHover: (e) {
          setState(() {
            lenderHover = !lenderHover;
          });
        },
        child: SizedBox(
          height: Statics.DEVICE_HEIGHT(context) * 0.3,
          width: Statics.DEVICE_WIDTH(context) * 0.35,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Statics.DEVICE_WIDTH(context) * 0.01,
                      ),
                      child: AutoSizeText(
                        "Learn More.",
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFFF3c3252),
                        ),
                        minFontSize: 12,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: Statics.DEVICE_HEIGHT(context) * 0.01,
                    ),
                  ],
                ),
                Center(
                  child: AutoSizeText(
                    "Machine\nLender",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFFF3c3252),
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _portfolio() {
    return Center(
      child: InkWell(
        onTap: () async {
          MyRouter().setProject(
              portfolio); //the project being passed to the router (can be any object)

          MyRouter.router.navigateTo(context, MyRoutes.projectsRoute,
              transition: TransitionType.cupertino,
              transitionDuration: const Duration(seconds: 1));
        },
        onHover: (e) {
          setState(() {
            portfolioHover = !portfolioHover;
          });
        },
        child: SizedBox(
          height: Statics.DEVICE_HEIGHT(context) * 0.3,
          width: Statics.DEVICE_WIDTH(context) * 0.35,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Statics.DEVICE_WIDTH(context) * 0.01,
                      ),
                      child: AutoSizeText(
                        "Learn More.",
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFFF3c3252),
                        ),
                        minFontSize: 12,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: Statics.DEVICE_HEIGHT(context) * 0.01,
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      "Portfolio Website",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Lato',
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFFF3c3252),
                      ),
                      minFontSize: 12,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _detector() {
    return Center(
      child: InkWell(
        onTap: () async {
          MyRouter().setProject(
              detector); //the project being passed to the router (can be any object)

          MyRouter.router.navigateTo(context, MyRoutes.projectsRoute,
              transition: TransitionType.cupertino,
              transitionDuration: const Duration(seconds: 1));
        },
        onHover: (e) {
          setState(() {
            detectorHover = !detectorHover;
          });
        },
        child: SizedBox(
          height: Statics.DEVICE_HEIGHT(context) * 0.3,
          width: Statics.DEVICE_WIDTH(context) * 0.35,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Statics.DEVICE_WIDTH(context) * 0.01,
                      ),
                      child: AutoSizeText(
                        "Learn More.",
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFFF3c3252),
                        ),
                        minFontSize: 12,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: Statics.DEVICE_HEIGHT(context) * 0.01,
                    ),
                  ],
                ),
                Center(
                  child: AutoSizeText(
                    "Speed Estimator",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFFF3c3252),
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _projectList() {
    return Column(
      children: [
        //simple add another expanded row, to grow the list of projects
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: _fakebook(),
              ),
              Expanded(
                child: _lender(),
              ),
            ],
          ),
        ),
        //simple add another expanded row, to grow the list of projects
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: _portfolio(),
              ),
              Expanded(
                child: _detector(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _title() {
    return Container(
      child: AutoSizeText(
        "Vnqr",
        style: GoogleFonts.getFont('Lato',
            fontSize: 36, color: Colors.grey[200], fontWeight: FontWeight.bold),
        minFontSize: 12,
      ),
    );
  }

  _projectsNavButton() {
    return Row(
      children: [
        // FaIcon(
        //   FontAwesomeIcons.file,
        //   color: Colors.grey[200],
        // ),
        Container(
          margin: EdgeInsets.only(
            left: Statics.DEVICE_WIDTH(context) * 0.005,
          ),
          child: AutoSizeText(
            "Projects",
            style: GoogleFonts.getFont(
              'Lato',
              fontSize: 20,
              color: projects2Button,
            ),
            minFontSize: 12,
          ),
        )
      ],
    );
  }

  _aboutNavButton() {
    return Row(
      children: [
        // FaIcon(
        //   FontAwesomeIcons.userAlt,
        //   color: Colors.grey[200],
        // ),
        Container(
          margin: EdgeInsets.only(
            left: Statics.DEVICE_WIDTH(context) * 0.005,
          ),
          child: AutoSizeText(
            "About",
            style: GoogleFonts.getFont(
              'Lato',
              fontSize: 20,
              color: aboutButton,
            ),
            minFontSize: 12,
          ),
        )
      ],
    );
  }
}
