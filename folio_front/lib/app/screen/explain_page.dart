import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExplainPage extends StatelessWidget {
  const ExplainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * 0.3;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.01,
                  width: constraints.maxWidth,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // 255,227,155
                      color: const Color.fromRGBO(255, 227, 155, 1),
                      height: 500,
                      width: containerWidth,
                    ),
                    Container(
                      color: const Color.fromRGBO(255, 227, 155, 1),
                      height: 500,
                      width: containerWidth,
                    ),
                    Container(
                      color: const Color.fromRGBO(255, 227, 155, 1),
                      height: 500,
                      width: containerWidth,
                    ),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                  width: constraints.maxWidth,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      constraints.maxWidth * 0.025,
                      constraints.maxHeight * 0.0,
                      constraints.maxWidth * 0.025,
                      constraints.maxWidth * 0.025
                  ),
                  child: Container(
                    color: const Color.fromRGBO(255, 227, 155, 1),
                    height: 500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
