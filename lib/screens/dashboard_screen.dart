import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skadgate_innovations/screens/crypto_screen.dart';
import 'package:skadgate_innovations/screens/home_screen.dart';
import 'package:skadgate_innovations/styles.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: dashboardPrimaryColor));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: dashboardPrimaryColor,
          child: Column(
            children: [
              Container(
                height: 170,
                child: Stack(
                  children: [
                    Positioned(
                      right: -10,
                      child: Image.asset(
                        'images/dashboard_top_header.png',
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.menu, color: Colors.white),
                                Icon(Icons.notifications,
                                    color: dashboardSecondaryColor),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundColor:
                                      Color(0XFF707070).withOpacity(0.27),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage('images/face_icon.png'),
                                  ),
                                ),
                                SizedBox(width: 10),
                                RichText(
                                  text: TextSpan(
                                    text: 'Christopher  ',
                                    style: textStyle.copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Ntuk\n',
                                        style: textStyle.copyWith(
                                            color: dashboardSecondaryColor),
                                      ),
                                      TextSpan(
                                        text: 'Welcome back @devchris',
                                        style: textStyle.copyWith(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        decoration: BoxDecoration(
                          color: dashboardPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 30,
                              left: 50,
                              child: Transform.rotate(
                                angle: 20,
                                child: Container(
                                  height: 48,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color:
                                          Color(0XFF707070).withOpacity(0.11),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                            Positioned(
                              child: CustomPaint(
                                painter: FirstDashboardSemiCirclePainter(),
                              ),
                            ),
                            Positioned(
                              top: 60,
                              right: 60,
                              child: CustomPaint(
                                painter: CirclePainter(
                                  radius: 20,
                                  color: Color(0XFF707070).withOpacity(0.11),
                                ),
                              ),
                            ),
                            CustomPaint(
                              painter: SecondDashboardSemiCirclePainter(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'USD ACCOUNT',
                                    style: dashboardTextStyle1.copyWith(
                                      color: Colors.white.withOpacity(0.4),
                                      letterSpacing: 10,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios_outlined,
                                        color: dashboardSecondaryColor,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '\u{0024}5,123',
                                            style: dashboardTextStyle1.copyWith(
                                                color: Colors.white,
                                                fontSize: 54),
                                          ),
                                          Text(
                                            'Available Balance',
                                            style: dashboardTextStyle1.copyWith(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: dashboardSecondaryColor,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.3,
                        color: dashboardAccentColor.withOpacity(0.4),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'RECENT ACTIVITY',
                              style: dashboardTextStyle1.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: dashboardAccentColor.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              'SEE MORE',
                              style: dashboardTextStyle1.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: dashboardAccentColor.withOpacity(0.89),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.3,
                        color: dashboardAccentColor.withOpacity(0.4),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return RecentActivityListTile(
                              recentActivityModel:
                                  _recentActivityModelList[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: bottomNavBarItemList,
        selectedItemColor: dashboardPrimaryColor,
        selectedLabelStyle: dashboardTextStyle1.copyWith(
            color: dashboardPrimaryColor, fontSize: 16),
        unselectedLabelStyle:
            dashboardTextStyle1.copyWith(color: dashboardPrimaryColor),
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: dashboardPrimaryColor,
        child: Image.asset('images/paper_plane_icon.png'),
      ),
    );
  }
}

List<BottomNavigationBarItem> bottomNavBarItemList = [
  BottomNavigationBarItem(
    label: 'Home',
    icon: Icon(Icons.home, color: dashboardPrimaryColor),
  ),
  BottomNavigationBarItem(
    label: 'Check Rate',
    icon: Image.asset('images/check_rate_icon.png'),
  ),
  BottomNavigationBarItem(
    label: 'Fund Account',
    icon: Image.asset('images/fund_account_icon.png'),
  ),
  BottomNavigationBarItem(
    label: 'Cards',
    icon: Image.asset('images/cards_icon.png'),
  ),
];

class RecentActivityListTile extends StatelessWidget {
  final RecentActivityModel recentActivityModel;
  RecentActivityListTile({@required this.recentActivityModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        recentActivityModel.title,
        style: dashboardTextStyle1.copyWith(fontSize: 12),
      ),
      subtitle: Text(
        recentActivityModel.subtitle,
        style: dashboardTextStyle2.copyWith(fontSize: 16),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            recentActivityModel.currency,
            style: dashboardTextStyle2.copyWith(
                color: recentActivityModel.color,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            recentActivityModel.amount,
            style: dashboardTextStyle2.copyWith(
              color: recentActivityModel.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

List<RecentActivityModel> _recentActivityModelList = [
  RecentActivityModel(
    currency: 'NGN',
    amount: '124,000.44',
    title: 'Tuesday, March 31st, 2020',
    subtitle: ' Transfer to Naira Account',
  ),
  RecentActivityModel(
    currency: 'EUR',
    amount: '900.00',
    color: dashboardAccentColor,
    title: 'Wednesday, July 31st, 2020',
    subtitle: ' West Minchester Bank...',
  ),
  RecentActivityModel(
    currency: 'EUR',
    amount: '400.00',
    subtitle: ' Purchase on Ebay...',
    title: 'Tuesday, August 31st, 2020',
  ),
  RecentActivityModel(
    amount: '5.44',
    currency: 'USD',
    subtitle: ' Netflix Subscription',
    title: 'Tuesday, November 31st, 2020',
  ),
  RecentActivityModel(
    currency: 'EUR',
    amount: '1,200.00',
    color: dashboardAccentColor,
    subtitle: ' University of Calgary...',
    title: 'Wednesday, December 31st, 2020',
  ),
];

class RecentActivityModel {
  final Color color;
  final String title;
  final String amount;
  final String currency;
  final String subtitle;

  RecentActivityModel({
    @required this.title,
    @required this.amount,
    @required this.currency,
    @required this.subtitle,
    this.color = const Color(0XFFFEB816),
  });
}

class FirstDashboardSemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = Color(0XFF707070).withOpacity(0.11);

    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, 0),
      radius: 70,
    );
    canvas.drawArc(
      rect,
      0.27,
      2.6,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SecondDashboardSemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = Color(0XFF707070).withOpacity(0.11);

    Rect rect = Rect.fromCircle(
      center: Offset(size.width - 30, size.height - 10),
      radius: 40,
    );
    canvas.drawArc(
      rect,
      3.1,
      2.18,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
