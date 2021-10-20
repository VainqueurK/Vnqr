import 'package:flutter/material.dart';
import 'package:vainqueur_2/config/statics.dart';

class TagCard extends StatefulWidget {
  String tag;
  TagCard({Key? key, this.tag = ""}) : super(key: key);

  @override
  _TagCardState createState() => _TagCardState();
}

class _TagCardState extends State<TagCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: Statics.DEVICE_WIDTH(context) * 0.06,
          height: Statics.DEVICE_HEIGHT(context) * 0.03,
          constraints: const BoxConstraints(
            minWidth: 100,
            minHeight: 30,
          ),
          decoration: const BoxDecoration(
              color: Color(0XFFFF3c3252),
              borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
        Row(
          children: [
            //add icon of the described text here <-----------------------
            FittedBox(
              fit: BoxFit.fill,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.tag,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[200],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
