import 'package:flutter/material.dart';

class DMWTabButton extends StatefulWidget {
  @override
  _DMWTabButtonState createState() => _DMWTabButtonState();
}

class _DMWTabButtonState extends State<DMWTabButton>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffC60000),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  //  borderRadius: BorderRadius.circular(
                  // 15.0,
                ),
                labelColor: Color(0xffC60000),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Days',
                  ),
                  Tab(
                    text: 'Weeks',
                  ),
                  Tab(
                    text: 'Months',
                  ),
                  Tab(
                    text: 'All',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
