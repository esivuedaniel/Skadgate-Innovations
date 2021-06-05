import 'package:flutter/material.dart';
import 'package:skadgate_innovations/screens/home_screen.dart';

import '../styles.dart';

class CryptoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: kPrimaryColor,
        ),
        title: Text(
          'Crypto Currency',
          style: textStyle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0XFF00C2FF)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'WITHDRAW FUNDS',
                    style: textStyle,
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 112,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/rectangle.png'),
                      ),
                    ),
                  ),
                  LayoutBuilder(
                    builder: (_, constraints) {
                      return CustomPaint(
                        size: Size(constraints.maxWidth, 112),
                        painter: SemiCirclePainter(),
                      );
                    },
                  ),
                  Positioned(
                    right: 40,
                    top: 25,
                    child: CustomPaint(
                      painter: CirclePainter(
                        radius: 20,
                        color: Colors.white.withOpacity(0.11),
                      ),
                    ),
                  ),
                  LayoutBuilder(builder: (_, constraints) {
                    return CustomPaint(
                      size: Size(constraints.maxWidth, 112),
                      painter: LinePainter(),
                    );
                  }),
                  Positioned(
                    top: 45,
                    left: 10,
                    child: Image.asset('images/bitcoin_icon2.png'),
                  ),
                  Positioned(
                    top: 40,
                    left: 50,
                    child: Text(
                      '1.00322BTC',
                      style: textStyle.copyWith(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 40,
                    child: Text(
                      'BITCOIN WALLET BALANCE',
                      style: textStyle.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 42,
                    child: Text(
                      'BTC/USD',
                      style: textStyle.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    right: 20,
                    child: Text(
                      '\u{0024} 39,445.18',
                      style: textStyle.copyWith(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedContainer(
                    title: 'Send',
                    color: Color(0XFFFFEAE9),
                    child: Image.asset(
                      'images/send_icon.png',
                    ),
                  ),
                  RoundedContainer(
                    title: 'Receive',
                    child: Image.asset(
                      'images/receive_icon.png',
                    ),
                  ),
                  RoundedContainer(
                    title: 'Buy/Sell',
                    color: Color(0XFFEDE4FF),
                    child: Image.asset(
                      'images/buy_and_sell_icon.png',
                    ),
                  ),
                  RoundedContainer(
                    title: 'Fund',
                    color: Color(0XFFE3FFEF),
                    child: Image.asset(
                      'images/fund_icon.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Recent Activity',
                style: textStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('images/empty_transaction_icon.png'),
                      Text(
                        'No Transaction yet.',
                        style: textStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Initiate transaction to view record.',
                        style: textStyle.copyWith(
                          fontWeight: FontWeight.w400,
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
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final String title;

  RoundedContainer({
    this.color,
    @required this.title,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
        SizedBox(height: 5),
        Text(title, style: textStyle),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = Colors.white.withOpacity(0.25);

    canvas.drawLine(Offset(size.width - 110, 0),
        Offset(size.width - 110, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = Colors.white.withOpacity(0.21);
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, -25),
      radius: 55,
    );
    canvas.drawArc(
      rect,
      1,
      7,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
