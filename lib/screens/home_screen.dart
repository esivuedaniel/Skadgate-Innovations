import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:skadgate_innovations/styles.dart';
import 'package:skadgate_innovations/screens/crypto_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0XFF00C2FF).withOpacity(0.32),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0XFF00C2FF),
                    child: Text(
                      'SA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  'Skadgate Innovations',
                  style: textStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '99201122334 - Providus Bank',
                  style: textStyle,
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Icon(
                    Icons.notifications_none,
                    color: kPrimaryColor,
                  ),
                ),
                visualDensity: VisualDensity(horizontal: -4),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16.0,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFD9F6FF),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            left: 65,
                            child: CustomPaint(
                              painter: ArcPainter(),
                            ),
                          ),
                          Positioned(
                            right: 50,
                            bottom: 50,
                            child: CustomPaint(
                              painter: CirclePainter(),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Available Balance',
                                  style: textStyle.copyWith(fontSize: 16),
                                ),
                                Text(
                                  NumberFormat.currency(name: '\u{20A6}')
                                      .format(657000.01),
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add a Business Account',
                            style: textStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF0D3E53),
                            ),
                          ),
                          Icon(
                            Icons.add_circle_outline,
                            color: Color(0XFF00C2FF),
                          )
                        ],
                      ),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: (deviceWidth / 2 / 250),
                      children: gridViewModelList
                          .map(
                            (gridViewModel) => GridViewCard(
                              icon: gridViewModel.icon,
                              color: gridViewModel.color,
                              title: gridViewModel.title,
                              subTitle: gridViewModel.subTitle,
                              onTap: gridViewModel.title
                                      .toLowerCase()
                                      .contains('crypto')
                                  ? () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => CryptoScreen()))
                                  : null,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(
          color: kPrimaryColor.withOpacity(0.25),
        ),
        unselectedLabelStyle: TextStyle(color: Colors.red),
        selectedIconTheme: IconThemeData(color: Color(0XFF354A82)),
        onTap: (currentIndex) => setState(() => _selectedIndex = currentIndex),
      ),
    );
  }
}

List<BottomNavigationBarItem> bottomNavBarItems = [
  BottomNavigationBarItem(
    label: 'Home',
    icon: Image.asset('images/home_icon.png'),
  ),
  BottomNavigationBarItem(
    label: 'Send Money',
    icon: Transform.rotate(angle: 18, child: Icon(Icons.send)),
  ),
  BottomNavigationBarItem(
    label: 'Cards',
    icon: Image.asset('images/card_icon.png'),
  ),
  BottomNavigationBarItem(
    label: 'More',
    icon: Icon(Icons.pending),
  ),
];

class GridViewCard extends StatelessWidget {
  final Widget icon;
  final Color color;
  final String title;
  final Function onTap;
  final String subTitle;

  GridViewCard({
    this.onTap,
    @required this.icon,
    @required this.title,
    @required this.subTitle,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                title,
                style: textStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Text(
              subTitle,
              style: textStyle.copyWith(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}

class GridViewModel {
  Widget icon;
  Color color;
  String title;
  String subTitle;

  GridViewModel({
    this.color,
    @required this.icon,
    @required this.title,
    @required this.subTitle,
  });
}

List<GridViewModel> gridViewModelList = [
  GridViewModel(
    color: Color(0XFFFFEAE9),
    title: 'Fund \ntransfer',
    icon: Image.asset('images/bitcoin_icon.png'),
    subTitle: 'Send funds to any bank account.',
  ),
  GridViewModel(
    title: 'Digital \nInvoicing',
    icon: Image.asset('images/note_icon.png'),
    subTitle: 'Send funds to any bank account.',
  ),
  GridViewModel(
    color: Color(0XFFEDE4FF),
    title: 'Crypto \nCurrency',
    icon: Image.asset('images/bitcoin_icon.png'),
    subTitle: 'Send funds to any bank account.',
  ),
  GridViewModel(
    color: Color(0XFFE3FFEF),
    icon: Image.asset(
      'images/note_icon.png',
      color: Color(0XFFB4F5BE),
    ),
    title: 'Account \nStatement',
    subTitle: 'Send funds to any bank account.',
  ),
];

class CirclePainter extends CustomPainter {
  final Color color;
  final double radius;

  CirclePainter({this.radius = 30, this.color = const Color(0XFF87E3FF)});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color.withOpacity(0.59);

    canvas.drawCircle(Offset(size.width, size.height), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double xAxis = size.width;
    double yAxis = size.height;

    var paint = Paint()
      ..strokeWidth = 18
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = Color(0XFF87E3FF).withOpacity(0.31);

    canvas.drawArc(
        Rect.fromCircle(center: Offset(xAxis * 0.3, yAxis * 0.5), radius: 40),
        5.7,
        3.2,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
