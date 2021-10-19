import 'package:auto_size_text/auto_size_text.dart';
import 'package:dev_icons/dev_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vainqueur_2/config/statics.dart';

class DesktopHomepage extends StatefulWidget {
  const DesktopHomepage({Key? key}) : super(key: key);

  @override
  _DesktopHomepageState createState() => _DesktopHomepageState();
}

class _DesktopHomepageState extends State<DesktopHomepage>
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

  bool project1Hover = false;
  bool project2Hover = false;
  bool project3Hover = false;
  bool project4Hover = false;

  late double projectHeight;
  late double projectWidth;

  late double project2Height;
  late double project2Width;

  late double project3Height;
  late double project3Width;

  late double project4Height;
  late double project4Width;

  @override
  void initState() {
    super.initState();
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
              child: Column(
                children: [
                  Container(
                    key: splashKey,
                    margin: EdgeInsets.only(
                        top: Statics.DEVICE_HEIGHT(context) * 0.06),
                    padding: EdgeInsets.only(
                      left: Statics.DEVICE_WIDTH(context) * 0.2,
                      right: Statics.DEVICE_WIDTH(context) * 0.2,
                    ),
                    height: Statics.DEVICE_HEIGHT(context) -
                        Statics.DEVICE_HEIGHT(context) * 0.06,
                    width: Statics.DEVICE_WIDTH(context),
                    color: Colors.grey[200],
                    child: Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: Statics.DEVICE_HEIGHT(context) * 0.25,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          Statics.DEVICE_HEIGHT(context) * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        AutoSizeText(
                                          "Hi!",
                                          style: GoogleFonts.getFont(
                                            'Lato',
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFFFF3c3252),
                                          ),
                                          minFontSize: 12,
                                          maxLines: 1,
                                        ),
                                        Center(
                                          child: RotationTransition(
                                            turns: _animation,
                                            child: const FaIcon(
                                              FontAwesomeIcons.handSparkles,
                                              color: Color(0xffffdb2d52),
                                              size: 45,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AutoSizeText(
                                      "I'm Vainqueur Kayombo",
                                      style: GoogleFonts.getFont(
                                        'Lato',
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFFFF3c3252),
                                      ),
                                      minFontSize: 12,
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      height:
                                          Statics.DEVICE_HEIGHT(context) * 0.01,
                                    ),
                                    AutoSizeText(
                                      "Software Developer",
                                      style: GoogleFonts.getFont(
                                        'Lato',
                                        fontSize: 30,
                                        color: Color(0XFFFFdb2d52),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      minFontSize: 12,
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      height: Statics.DEVICE_HEIGHT(context) *
                                          0.075,
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
                                              projectsButton = hover
                                                  ? hoverColor
                                                  : normalColor;
                                            });
                                          },
                                          child: Container(
                                            height:
                                                Statics.DEVICE_HEIGHT(context) *
                                                    0.04,
                                            width:
                                                Statics.DEVICE_WIDTH(context) *
                                                    0.1,
                                            constraints: const BoxConstraints(
                                                minHeight: 50, minWidth: 100),
                                            decoration: BoxDecoration(
                                              color: projectsButton,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(50)),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
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
                                          width: Statics.DEVICE_WIDTH(context) *
                                              0.01,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  //color: Colors.grey[300],
                                  width: Statics.DEVICE_HEIGHT(context) * 0.4,
                                  margin: EdgeInsets.only(
                                    top: Statics.DEVICE_HEIGHT(context) * 0.15,
                                  ),

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
                                      minHeight: 600, minWidth: 600),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius:
                                          Statics.DEVICE_HEIGHT(context) * 0.2,
                                      backgroundImage: const AssetImage(
                                          'assets/blast_off.gif')),
                                ),
                              ),
                            )),
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
                  left: Statics.DEVICE_WIDTH(context) * 0.2,
                  right: Statics.DEVICE_WIDTH(context) * 0.2,
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
                    InkWell(
                      onTap: () => Scrollable.ensureVisible(
                        aboutKey.currentContext!,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      ),
                      onHover: (hover) {
                        setState(() {
                          aboutButton = hover ? hoverColor3 : normalColor2;
                        });
                      },
                      child: _aboutNavButton(),
                    ),
                    SizedBox(
                      width: Statics.DEVICE_WIDTH(context) * 0.02,
                    ),
                    InkWell(
                      onTap: () => Scrollable.ensureVisible(
                        projectKey.currentContext!,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                      ),
                      onHover: (hover) {
                        setState(() {
                          projects2Button = hover ? hoverColor3 : normalColor2;
                        });
                      },
                      child: _projectsNavButton(),
                    ),
                    SizedBox(
                      width: Statics.DEVICE_WIDTH(context) * 0.02,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isContacting = true;
                          });
                        },
                        onHover: (hover) {
                          setState(() {
                            contactButton = hover ? hoverColor : normalColor;
                          });
                        },
                        child: Container(
                          height: Statics.DEVICE_HEIGHT(context) * 0.04,
                          width: Statics.DEVICE_WIDTH(context) * 0.07,
                          constraints: const BoxConstraints(
                              minHeight: 50, minWidth: 100),
                          decoration: BoxDecoration(
                            color: contactButton,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2)
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: AutoSizeText(
                                "Contact Me",
                                style: GoogleFonts.getFont(
                                  'Lato',
                                  fontSize: 18,
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
                    ),
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
                      child: Container(
                        height: 100,
                        width: 100,
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
                          child: FaIcon(
                            FontAwesomeIcons.arrowUp,
                            color: Colors.grey[200],
                            size: 30,
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
    double iconSize = 65;
    Color? iconColors = Color(0XFFFF3c3252);

    return Container(
      padding: EdgeInsets.only(
        top: Statics.DEVICE_HEIGHT(context) * 0.06,
        left: Statics.DEVICE_WIDTH(context) * 0.2,
        right: Statics.DEVICE_WIDTH(context) * 0.2,
      ),
      height: Statics.DEVICE_HEIGHT(context) * .7,
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
              fontSize: 45,
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
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0XFFFFeeeeee),
            ),
            minFontSize: 12,
            maxLines: 2,
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
                  constraints: BoxConstraints(minHeight: 50, minWidth: 100),
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
                          fontSize: 24,
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
          const Expanded(
            child: SizedBox(),
          ),
          AutoSizeText(
            "Languages I use",
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
            height: Statics.DEVICE_HEIGHT(context) * 0.025,
          ),
          Wrap(
            spacing: 20,
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
                    size: iconSize,
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
                    size: iconSize,
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
                    size: iconSize,
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
                    size: iconSize,
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
                        size: 45,
                      ),
                      AutoSizeText(
                        "more",
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 22,
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
        left: Statics.DEVICE_WIDTH(context) * 0.2,
        right: Statics.DEVICE_WIDTH(context) * 0.2,
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
      height: Statics.DEVICE_HEIGHT(context) * 0.2,
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
                width: Statics.DEVICE_WIDTH(context) * 0.01,
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
        ],
      ),
    );
  }

  _project1() {
    return Center(
      child: InkWell(
        onTap: () {},
        onHover: (e) {
          setState(() {
            project1Hover = !project1Hover;
          });
        },
        child: AnimatedContainer(
          height: !project1Hover
              ? Statics.DEVICE_HEIGHT(context) * 0.3
              : (Statics.DEVICE_HEIGHT(context) * 0.3) * 1.1,
          width: !project1Hover
              ? Statics.DEVICE_WIDTH(context) * 0.25
              : (Statics.DEVICE_WIDTH(context) * 0.25) * 1.2,
          duration: const Duration(milliseconds: 300),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0XFFFFdb2d52).withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.only(
                    left: Statics.DEVICE_WIDTH(context) * 0.01,
                  ),
                  child: AutoSizeText(
                    "Fakebook",
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                    ),
                    minFontSize: 12,
                  ),
                ),
                SizedBox(
                  height: Statics.DEVICE_HEIGHT(context) * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _project2() {
    return Center(
      child: InkWell(
        onTap: () {},
        onHover: (e) {
          setState(() {
            project2Hover = !project2Hover;
          });
        },
        child: AnimatedContainer(
          height: !project2Hover
              ? Statics.DEVICE_HEIGHT(context) * 0.3
              : (Statics.DEVICE_HEIGHT(context) * 0.3) * 1.1,
          width: !project2Hover
              ? Statics.DEVICE_WIDTH(context) * 0.25
              : (Statics.DEVICE_WIDTH(context) * 0.25) * 1.2,
          duration: const Duration(milliseconds: 300),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0XFFFFdb2d52).withOpacity(0.4),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.only(
                    left: Statics.DEVICE_WIDTH(context) * 0.01,
                  ),
                  child: AutoSizeText(
                    "Heavy Machinary Lending System",
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                    ),
                    minFontSize: 12,
                  ),
                ),
                SizedBox(
                  height: Statics.DEVICE_HEIGHT(context) * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _project3() {
    return Center(
      child: InkWell(
        onTap: () {},
        onHover: (e) {
          setState(() {
            project3Hover = !project3Hover;
          });
        },
        child: AnimatedContainer(
          height: !project3Hover
              ? Statics.DEVICE_HEIGHT(context) * 0.3
              : (Statics.DEVICE_HEIGHT(context) * 0.3) * 1.1,
          width: !project3Hover
              ? Statics.DEVICE_WIDTH(context) * 0.25
              : (Statics.DEVICE_WIDTH(context) * 0.25) * 1.2,
          duration: const Duration(milliseconds: 300),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0XFFFFdb2d52).withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.only(
                    left: Statics.DEVICE_WIDTH(context) * 0.01,
                  ),
                  child: AutoSizeText(
                    "Web Portfolio",
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                    ),
                    minFontSize: 12,
                  ),
                ),
                SizedBox(
                  height: Statics.DEVICE_HEIGHT(context) * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _project4() {
    return Center(
      child: InkWell(
        onTap: () {},
        onHover: (e) {
          setState(() {
            project4Hover = !project4Hover;
          });
        },
        child: AnimatedContainer(
          height: !project4Hover
              ? Statics.DEVICE_HEIGHT(context) * 0.3
              : (Statics.DEVICE_HEIGHT(context) * 0.3) * 1.1,
          width: !project4Hover
              ? Statics.DEVICE_WIDTH(context) * 0.25
              : (Statics.DEVICE_WIDTH(context) * 0.25) * 1.2,
          duration: const Duration(milliseconds: 300),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0XFFFFdb2d52).withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.only(
                    left: Statics.DEVICE_WIDTH(context) * 0.01,
                  ),
                  child: AutoSizeText(
                    "Video Speed Detector",
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                    ),
                    minFontSize: 12,
                  ),
                ),
                SizedBox(
                  height: Statics.DEVICE_HEIGHT(context) * 0.01,
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
                child: _project1(),
              ),
              Expanded(
                child: _project2(),
              ),
            ],
          ),
        ),
        //simple add another expanded row, to grow the list of projects
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: _project3(),
              ),
              Expanded(
                child: _project4(),
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
