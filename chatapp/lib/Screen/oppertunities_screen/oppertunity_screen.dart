import 'dart:math';

import 'package:chatapp/Screen/oppertunities_screen/opportunities_list_tile.dart';
import 'package:chatapp/Screen/widgets/custom_app_bar.dart';
import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../side_drawer/side_drawer.dart';
import '../widgets/row_search_bars.dart';

class OppertunityScreen extends StatefulWidget {
  const OppertunityScreen({Key? key}) : super(key: key);

  @override
  State<OppertunityScreen> createState() => _OppertunityScreenState();
}

class _OppertunityScreenState extends State<OppertunityScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      DrawerScreen(),
      AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.6 : 1.0)
          ..rotateZ(isDrawerOpen ? pi / 280 : 0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: 200,
                  color: Color(0xffC60000),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomAppBarWidget(
                          txt: "Opportunities",
                          onPressed: () {
                            if (isDrawerOpen) {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                isDrawerOpen = false;
                              });
                            } else {
                              if (!isDrawerOpen) {
                                setState(() {
                                  xOffset = size.width - 100;
                                  yOffset = size.height / 5;
                                  isDrawerOpen = true;
                                });
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RowSearchBars(
                            icon: Icons.arrow_drop_down,
                            hintText: "Enter Zip Code",
                          ),
                          RowSearchBars(
                            icon: Icons.arrow_drop_down,
                            hintText: "Enter Zip Code",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
                OppertunitiesListTile(
                    txtt1: "Name Here", txtt2: "Subtitles Here"),
              ]),
            ),
          ),
        ),
      ),
    ]);
  }
}
