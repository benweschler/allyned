import 'package:allyned/app_service.dart';
import 'package:allyned/utils/iterable_utils.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ContentCard extends StatefulWidget {
  final Color? altColor;
  final String title;
  final String? subtitle;
  final int cardIndex;
  final String? centerIllustrationPath;
  final String backgroundImagePath;
  final bool shouldAnimateBackground;

  const ContentCard({
    super.key,
    this.title = "",
    this.subtitle,
    this.altColor,
    this.centerIllustrationPath,
    this.shouldAnimateBackground = false,
    required this.backgroundImagePath,
    required this.cardIndex,
  });

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  late Ticker _ticker;

  @override
  void initState() {
    _ticker = Ticker((d) => setState(() {}))..start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var time = DateTime.now().millisecondsSinceEpoch / 2000;
    var scaleX = 1.2 + sin(time) * .05;
    var scaleY = 1.2 + cos(time) * .07;
    var offsetY = 20 + cos(time) * 20;

    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        widget.shouldAnimateBackground
            ? Transform(
                transform: Matrix4.diagonal3Values(scaleX, scaleY, 1),
                child: Transform.translate(
                  offset: Offset(
                    -(scaleX - 1) / 2 * size.width,
                    -(scaleY - 1) / 2 * size.height + offsetY,
                  ),
                  child: Image.asset(
                    widget.backgroundImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Image.asset(widget.backgroundImagePath, fit: BoxFit.cover),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 75.0, bottom: 25.0),
            child: Column(
              children: [
                //Top Image
                if (widget.centerIllustrationPath != null)
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Image.asset(
                        widget.centerIllustrationPath!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                else
                  const Spacer(flex: 3),

                SliderCircles(activePage: widget.cardIndex),

                //Bottom content
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: _buildBottomContent(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBottomContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            height: 1.2,
            fontSize: 30.0,
            fontFamily: 'DMSerifDisplay',
            color: Colors.white,
          ),
        ),
        Text(
          widget.subtitle!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: MaterialButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            color: widget.altColor,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: .8,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            onPressed: () {
              context.read<AppService>().onboarding = true;
              context.go("/home");
            },
          ),
        )
      ],
    );
  }
}

class SliderCircles extends StatelessWidget {
  final int activePage;

  const SliderCircles({Key? key, required this.activePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        3,
        (index) => _buildIndicatorCircle(index == activePage),
      ).separate(const SizedBox(width: 18)).toList(),
    );
  }

  Widget _buildIndicatorCircle(bool active) => Container(
        height: 14,
        width: 14,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              active ? null : Border.all(color: Colors.white.withOpacity(0.4)),
          color: active ? Colors.white : null,
        ),
      );
}
