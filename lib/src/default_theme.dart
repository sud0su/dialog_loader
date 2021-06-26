import 'package:flutter/material.dart';

class DefaultTheme extends StatelessWidget {
  const DefaultTheme({
    Key? key,
    required BuildContext context,
    required ValueNotifier<Widget> leftIcon,
    required ValueNotifier<Widget> title,
    required ValueNotifier<Widget> rightIcon,
    required Color backgroundColor,
    required Color barrierColor,
    required double elevation,
    required double borderRadius,
  })   : _context = context,
        _leftIcon = leftIcon,
        _title = title,
        _rightIcon = rightIcon,
        _backgroundColor = backgroundColor,
        _barrierColor = barrierColor,
        _elevation = elevation,
        _borderRadius = borderRadius,
        super(key: key);

  final BuildContext _context;
  final ValueNotifier<Widget> _leftIcon;
  final ValueNotifier<Widget> _title;
  final ValueNotifier<Widget> _rightIcon;

  final Color _backgroundColor;
  final Color _barrierColor;
  final double _elevation;
  final double _borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(_context).size.width,
      height: MediaQuery.of(_context).size.height,
      color: _barrierColor,
      child: Center(
        child: Material(
          elevation: _elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(_borderRadius),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_borderRadius),
              color: _backgroundColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _leftIcon.value,
                    SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                      child: _title.value,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    _rightIcon.value,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
