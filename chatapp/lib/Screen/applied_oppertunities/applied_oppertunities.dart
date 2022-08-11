import 'package:chatapp/Screen/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

import 'applied_oppertunities_list_tile.dart';

class AppliedOppertunities extends StatelessWidget {
  const AppliedOppertunities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarWidget(
              txt: "home",
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  AppliedOppertunitiesListTileWidget(
                    txtt1: "Lawem Bunen",
                    txtt2: "Discover Little Known Secrets Of Life",
                    // Icons1: Icons.person,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppliedOppertunitiesListTileWidget(
                    txtt1: "Lawem Bunen",
                    txtt2: "Discover Little Known Secrets Of Life",
                    // Icons1: Icons.person,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppliedOppertunitiesListTileWidget(
                    txtt1: "Lawem Bunen",
                    txtt2: "Discover Little Known Secrets Of Life",
                    // Icons1: Icons.person,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppliedOppertunitiesListTileWidget(
                    txtt1: "Lawem Bunen",
                    txtt2: "Discover Little Known Secrets Of Life",
                    // Icons1: Icons.person,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppliedOppertunitiesListTileWidget(
                    txtt1: "Lawem Bunen",
                    txtt2: "Discover Little Known Secrets Of Life",
                    // Icons1: Icons.person,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppliedOppertunitiesListTileWidget(
                    txtt1: "Lawem Bunen",
                    txtt2: "Discover Little Known Secrets Of Life",
                    // Icons1: Icons.person,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // AppliedOppertunitiesListTileWidget(
                  //   txtt1: "Lawem Bunen",
                  //   txtt2: "Discover Little Known Secrets Of Life",
                  //   // Icons1: Icons.person,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
