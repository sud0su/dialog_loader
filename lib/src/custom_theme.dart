import 'package:flutter/material.dart';

class CircleTheme extends StatelessWidget {
  const CircleTheme({
    Key? key,
    required BuildContext context,
    required ValueNotifier<Widget> leftIcon,
    required ValueNotifier<Widget> title,
    required ValueNotifier<Widget> rightIcon,
    required ValueNotifier<double> avatarRadius,
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
        _avatarRadius = avatarRadius,
        super(key: key);

  final BuildContext _context;
  final ValueNotifier<Widget> _leftIcon;
  final ValueNotifier<Widget> _title;
  final ValueNotifier<double> _avatarRadius;
  // ignore: unused_field
  final ValueNotifier<Widget> _rightIcon;

  final Color _backgroundColor;
  final Color _barrierColor;
  final double _elevation;
  final double _borderRadius;

  static const double padding = 20;
  static const double toppadding = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(_context).size.width,
      height: MediaQuery.of(_context).size.height,
      color: _barrierColor,
      child: Center(
        child: Material(
          type: MaterialType.transparency,
          elevation: _elevation,
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 40,
                  maxHeight: MediaQuery.of(context).size.height - 40,
                ),
                padding: EdgeInsets.only(
                  left: padding,
                  top: toppadding,
                  right: padding,
                  bottom: padding,
                ),
                margin: EdgeInsets.only(top: _avatarRadius.value),
                decoration: BoxDecoration(
                  color: _backgroundColor,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _title.value,
                  ],
                ),
              ),
              Positioned(
                left: padding,
                right: padding,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(blurRadius: 0.0, spreadRadius: 0.1)],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: _avatarRadius.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(_avatarRadius.value),
                      ),
                      child: _leftIcon.value,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
