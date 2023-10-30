import 'package:flutter/material.dart';
import 'package:folio_front/common/app_colors.dart';

class ExplainPage extends StatefulWidget {
  const ExplainPage({super.key});

  @override
  State<ExplainPage> createState() => _ExplainPageState();
}

class _ExplainPageState extends State<ExplainPage> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;

  bool _isHovering = false;
  bool _isHoveringBox1 = false;
  bool _isHoveringBox2 = false;
  bool _isHoveringBox3 = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 550));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation : _controller,
      builder: (BuildContext context, Widget? child) {
      return LayoutBuilder(
        builder: (context, constraints) {
          double containerWidth = constraints.maxWidth * 0.2;
          return Scaffold(
            backgroundColor :
            ColorTween(begin: AppColors.backgroundColor, end: Colors.black87)
                .evaluate(_controller),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.1,
                    width: constraints.maxWidth,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MouseRegion(
                        onEnter: (_) => {
                          _isHoveringBox1
                              ? {}  // 이미 호버링 상태이므로 아무것도 하지 않음
                              : {
                            _controller.reverse(),  // 마우스가 들어갈 때 역방향으로 애니메이션
                            _isHoveringBox1 = true  // _isHovering을 true로 설정하여 호버링 상태로 변경
                          }
                        },
                        onExit: (_) => {
                          _isHoveringBox1
                              ? {
                            _controller.forward(),  // 마우스가 나갈 때 정방향으로 애니메이션
                            _isHoveringBox1 = false  // _isHovering을 false로 설정하여 일반 상태로 변경
                          }
                              : {}  // 이미 일반 상태이므로 아무것도 하지 않음
                        },
                        child: SizedBox(
                          height: 500,
                          width: containerWidth,
                          child: Column(
                            children: [
                              Text(
                                "쉽다",
                                style: TextStyle(
                                  fontSize: 100,
                                  color:  _isHoveringBox1
                                      ? AppColors.mainColor
                                      : AppColors.backgroundColor,
                                ),
                              ),
                              Text(
                                "Folio를 이용해서",
                                style: TextStyle(
                                  fontSize: 30,
                                  color:  _isHoveringBox1
                                      ? AppColors.mainColor
                                      : AppColors.backgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MouseRegion(
                          onEnter: (_) => {
                            _isHoveringBox2
                                ? {}  // 이미 호버링 상태이므로 아무것도 하지 않음
                                : {
                              _controller.reverse(),  // 마우스가 들어갈 때 역방향으로 애니메이션
                              _isHoveringBox2 = true  // _isHovering을 true로 설정하여 호버링 상태로 변경
                            }
                          },
                          onExit: (_) => {
                            _isHoveringBox2
                                ? {
                              _controller.forward(),  // 마우스가 나갈 때 정방향으로 애니메이션
                              _isHoveringBox2 = false  // _isHovering을 false로 설정하여 일반 상태로 변경
                            }
                                : {}  // 이미 일반 상태이므로 아무것도 하지 않음
                          },
                        child: SizedBox(
                          height: 500,
                          width: containerWidth,
                          child: Column(
                            children: [
                              Text(
                                "빠르다",
                                style: TextStyle(
                                  fontSize: 100,
                                  color:  _isHoveringBox2
                                      ? AppColors.mainColor
                                      : AppColors.backgroundColor,
                                ),
                              ),
                              Text(
                                "포트폴리오를 만들어보자",
                                style: TextStyle(
                                  fontSize: 30,
                                  color:  _isHoveringBox2
                                      ? AppColors.mainColor
                                      : AppColors.backgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MouseRegion(
                          onEnter: (_) => {
                            _isHoveringBox3
                                ? {}  // 이미 호버링 상태이므로 아무것도 하지 않음
                                : {
                              _controller.reverse(),  // 마우스가 들어갈 때 역방향으로 애니메이션
                              _isHoveringBox3 = true  // _isHovering을 true로 설정하여 호버링 상태로 변경
                            }
                          },
                          onExit: (_) => {
                            _isHoveringBox3
                                ? {
                              _controller.forward(),  // 마우스가 나갈 때 정방향으로 애니메이션
                              _isHoveringBox3 = false  // _isHovering을 false로 설정하여 일반 상태로 변경
                            }
                                : {}  // 이미 일반 상태이므로 아무것도 하지 않음
                          },
                        child: SizedBox(
                          height: 500,
                          width: containerWidth,
                          child: Column(
                            children: [
                              Text(
                                "간편하다",
                                style: TextStyle(
                                  fontSize: 100,
                                  color:  _isHoveringBox3
                                      ? AppColors.mainColor
                                      : AppColors.backgroundColor,
                                ),
                              ),
                              Text(
                                "포트폴리오를 만들어보자",
                                style: TextStyle(
                                  fontSize: 30,
                                  color:  _isHoveringBox3
                                      ? AppColors.mainColor
                                      : AppColors.backgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 1,
                    width: constraints.maxWidth,
                  ),
                ],
              ),
            ),
          );
        },
       );
      }
    );
  }
}
