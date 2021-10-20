import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vainqueur_2/components/tag_component.dart';
import 'package:vainqueur_2/config/statics.dart';
import 'package:vainqueur_2/models/project.dart';
import 'package:vainqueur_2/routing/router.dart';

class MobileProjectsPage extends StatefulWidget {
  late Project project;
  MobileProjectsPage({Key? key, required this.project}) : super(key: key);

  @override
  _MobileProjectsPageState createState() => _MobileProjectsPageState();
}

class _MobileProjectsPageState extends State<MobileProjectsPage> {
  Color? returnButton = Colors.grey[300];
  Color? gitIconTextColor = Color(0xffffdb2d52);

  Color? normalColor = Colors.grey[200];
  Color? normalColor2 = Color(0XFFFF3c3252);
  Color? hoverColor = const Color(0xffffdb2d52);

  double iconSize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Statics.DEVICE_HEIGHT(context),
        color: Colors.grey[200],
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: Statics.DEVICE_HEIGHT(context) * 0.01,
                      left: Statics.DEVICE_WIDTH(context) * 0.1,
                      right: Statics.DEVICE_WIDTH(context) * 0.1,
                    ),
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Statics.DEVICE_HEIGHT(context) * 0.1,
                        ),
                        Container(
                          constraints: BoxConstraints(maxHeight: 600),
                          child: Image(
                            image: AssetImage(
                              widget.project.img,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Statics.DEVICE_HEIGHT(context) * 0.025,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                              runSpacing: 20,
                              spacing: 20,
                              children: widget.project.tags.tags
                                  .map((e) => TagCard(tag: e))
                                  .toList()),
                        ),
                        SizedBox(
                          height: Statics.DEVICE_HEIGHT(context) * 0.05,
                        ),
                        AutoSizeText(
                          widget.project.title,
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffffdb2d52),
                          ),
                          minFontSize: 12,
                        ),
                        SizedBox(
                          height: Statics.DEVICE_HEIGHT(context) * 0.05,
                        ),
                        AutoSizeText(
                          widget.project.desc,
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFFFF3c3252),
                          ),
                          minFontSize: 12,
                          maxLines: 15,
                        ),
                        SizedBox(
                          height: Statics.DEVICE_HEIGHT(context) * 0.05,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => launch(widget.project.github),
                                onHover: (hover) {
                                  setState(() {
                                    gitIconTextColor =
                                        hover ? normalColor2 : hoverColor;
                                  });
                                },
                                child: Row(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: FaIcon(
                                        FontAwesomeIcons.github,
                                        color: gitIconTextColor,
                                        size: iconSize,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          Statics.DEVICE_WIDTH(context) * 0.005,
                                    ),
                                    AutoSizeText(
                                      "GitHub",
                                      style: GoogleFonts.getFont(
                                        'Lato',
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: gitIconTextColor,
                                      ),
                                      minFontSize: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Statics.DEVICE_HEIGHT(context) * 0.05,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Material(
              elevation: 15,
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 10,
                ),
                padding: EdgeInsets.only(
                  left: Statics.DEVICE_WIDTH(context) * 0.1,
                  right: Statics.DEVICE_WIDTH(context) * 0.1,
                ),
                height: Statics.DEVICE_HEIGHT(context) * 0.05,
                width: Statics.DEVICE_WIDTH(context),
                decoration: const BoxDecoration(
                  color: Color(0XFFFF3c3252),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        MyRouter.router.pop(context);
                      },
                      onHover: (hover) {
                        setState(() {
                          returnButton = hover ? hoverColor : normalColor;
                        });
                      },
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            size: 20,
                            color: returnButton,
                          ),
                          SizedBox(
                            width: Statics.DEVICE_WIDTH(context) * 0.01,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 25,
                              color: returnButton,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
