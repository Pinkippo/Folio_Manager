import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/login_controller.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> with SingleTickerProviderStateMixin{

  String jwtToken = '';

  late final AnimationController _controller;

  final CurveTween _curve = CurveTween(curve: Curves.easeInOutCubic);
  final double _rotateX = .75;
  final double _rotateZ = .5;
  final double _elevation = 100.0;

  bool _isHovering = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 550));
    getToken();
    // 인터렉션 에니메이션
    _controller.forward();
    super.initState();
  }

  getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    jwtToken = prefs.getString('jwt') ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor:
          ColorTween(begin: AppColors.backgroundColor, end: AppColors.mainColor)
              .evaluate(_controller),
          body: Stack(
            children : [
              Center(
              child: MouseRegion(
                onEnter: (_) => {
                  _isHovering
                      ? {}  // 이미 호버링 상태이므로 아무것도 하지 않음
                      : {
                    _controller.reverse(),  // 마우스가 들어갈 때 역방향으로 애니메이션
                    _isHovering = true  // _isHovering을 true로 설정하여 호버링 상태로 변경
                  }
                },
                onExit: (_) => {
                  _isHovering
                      ? {
                    _controller.forward(),  // 마우스가 나갈 때 정방향으로 애니메이션
                    _isHovering = false  // _isHovering을 false로 설정하여 일반 상태로 변경
                  }
                      : {}  // 이미 일반 상태이므로 아무것도 하지 않음
                },
                child: GestureDetector(
                  onTap: () {
                    if(jwtToken == '') {
                      Get.snackbar(
                          '로그인 필요',
                          '로그인 후 이용해주세요.',
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      );
                      Get.toNamed('/login');
                    } else {
                      Get.toNamed('/create');
                    }
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Transform.translate(
                        offset: Offset(
                            0,
                            Tween(begin: .0, end: _elevation * 0.75)
                                .chain(_curve)
                                .evaluate(_controller)),
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..rotateX(Tween(begin: .0, end: _rotateX)
                                .chain(_curve)
                                .evaluate(_controller))
                            ..rotateZ(Tween(begin: .0, end: _rotateZ)
                                .chain(_curve)
                                .evaluate(_controller)),
                          child: Container(
                            width: Get.width * 0.15,
                            height: Get.height * 0.45,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  color: (ColorTween(
                                      begin: Colors.red.withOpacity(0.55),
                                      end: Colors.white.withOpacity(0.35))
                                      .evaluate(_controller))!,
                                  spreadRadius: 6,
                                  blurRadius: 35,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            0,
                            Tween(begin: .0, end: _elevation * -0.25)
                                .chain(_curve)
                                .evaluate(_controller)),
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..rotateX(Tween(begin: .0, end: _rotateX)
                                .chain(_curve)
                                .evaluate(_controller))
                            ..rotateZ(Tween(begin: .0, end: _rotateZ)
                                .chain(_curve)
                                .evaluate(_controller)),
                          child: Container(
                            width: Get.width * 0.15,
                            height: Get.height * 0.45,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            0,
                            Tween(begin: .0, end: _elevation * -1.25)
                                .chain(_curve)
                                .evaluate(_controller)),
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..rotateX(Tween(begin: .0, end: _rotateX)
                                .chain(_curve)
                                .evaluate(_controller))
                            ..rotateZ(Tween(begin: .0, end: _rotateZ)
                                .chain(_curve)
                                .evaluate(_controller)),
                          child: Container(
                            width: Get.width * 0.15,
                            height: Get.height * 0.45,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: AppColors.backgroundColor,
                                width: 4.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            0,
                            Tween(begin: .0, end: -2.25 * _elevation)
                                .chain(_curve)
                                .evaluate(_controller)),
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..rotateX(Tween(begin: .0, end: _rotateX)
                                .chain(_curve)
                                .evaluate(_controller))
                            ..rotateZ(Tween(begin: .0, end: _rotateZ)
                                .chain(_curve)
                                .evaluate(_controller)),
                          child: Container(
                            padding: const EdgeInsets.all(24.0),
                            width: Get.width * 0.15,
                            height: Get.height * 0.45,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: (ColorTween(
                                    begin: Colors.transparent,
                                    end: Colors.redAccent)
                                    .evaluate(_controller))!,
                                width: 4,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '나만의 포트폴리오 제작하기',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: (ColorTween(
                                        begin: Colors.black,
                                        end: Colors.white)
                                        .evaluate(_controller))!,
                                  ),
                                ),
                                const SizedBox(height: 6.0),
                                Text(
                                  'Folio',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                    color: (ColorTween(
                                        begin: Colors.black,
                                        end: Colors.white)
                                        .evaluate(_controller))!,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Container(
                                  width: Get.width * 0.15,
                                  height: 1,
                                  color: AppColors.mainColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             ),
            ]
          ),
        );
      },
    );
  }
}
