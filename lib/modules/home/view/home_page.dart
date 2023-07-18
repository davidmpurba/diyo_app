import 'package:diyo/gen/assets.gen.dart';
import 'package:diyo/utils/font.dart';
import 'package:diyo/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Assets.images.logo.image(width: 100, height: 100),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.red,
        ),
      ),
      drawer: const NavBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 500,
                    height: 350,
                    child: GridView.count(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 3,
                      children: const [
                        TableWidget(
                          text: 'Table 1',
                          color: Colors.white,
                          borderColor: Colors.red,
                        ),
                        TableWidget(text: 'Table 2', color: Colors.red),
                        TableWidget(text: 'Table 3', color: Colors.red),
                        TableWidget(text: 'Table 4', color: Colors.red),
                        TableWidget(text: 'Table 5', color: Colors.blue),
                        TableWidget(text: 'Table 6', color: Colors.yellow),
                      ],
                    ),
                  ),
                  Container(
                    width: 500,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LegendWidget(
                          text: 'Available',
                          color: Colors.white,
                          borderColor: Colors.red,
                        ),
                        SizedBox(height: 10),
                        LegendWidget(
                          text: 'Seated',
                          color: Colors.red,
                        ),
                        SizedBox(height: 10),
                        LegendWidget(
                          text: 'Ordered',
                          color: Colors.yellow,
                        ),
                        SizedBox(height: 10),
                        LegendWidget(
                          text: 'Billing',
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LegendWidget extends StatelessWidget {
  const LegendWidget({
    super.key,
    required this.text,
    required this.color,
    this.borderColor = Colors.transparent,
  });

  final String text;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: borderColor, width: 2),
            ),
          ),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.text,
    required this.color,
    this.borderColor = Colors.transparent,
  });

  final String text;
  final Color color;
  final Color borderColor;

  Color textColor(Color color) {
    if (color == Colors.white) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: body1(color: textColor(color)),
      ),
    );
  }
}
