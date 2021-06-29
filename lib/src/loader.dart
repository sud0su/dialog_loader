import 'package:flutter/material.dart';

import 'custom_theme.dart';
import 'default_theme.dart';

enum LoaderTheme { dialogDefault, dialogCircle }

class DialogLoader {
  final ValueNotifier<Widget> _title = ValueNotifier<Widget>(SizedBox());
  final ValueNotifier<Widget> _leftIcon = ValueNotifier<Widget>(SizedBox());
  final ValueNotifier<Widget> _rightIcon = ValueNotifier<Widget>(SizedBox());
  final ValueNotifier<bool> _barrierDismissible = ValueNotifier<bool>(false);
  final ValueNotifier<double> _avatarRadius = ValueNotifier<double>(25.0);

  bool _dialogIsOpen = false;
  late BuildContext _context;

  DialogLoader({required context}) {
    this._context = context;
  }

  void update({
    Widget? title,
    Widget? leftIcon,
    Widget? rightIcon,
    bool barrierDismissible: false,
    bool autoClose: true,
    double? avatarRadius,
  }) {
    _title.value = title ?? SizedBox();
    _leftIcon.value = leftIcon ?? SizedBox();
    _rightIcon.value = rightIcon ?? SizedBox();
    _avatarRadius.value = avatarRadius ?? 25.0;
    _barrierDismissible.value = barrierDismissible;
    if (autoClose) _closeAfterUpdate();
  }

  void _closeAfterUpdate() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (_dialogIsOpen) {
        Navigator.pop(_context);
        _dialogIsOpen = false;
      }
    });
  }

  void close() {
    if (_dialogIsOpen) {
      Navigator.pop(_context);
      _dialogIsOpen = false;
    }
  }

  show({
    LoaderTheme theme: LoaderTheme.dialogDefault,
    Widget title: const SizedBox(),
    Widget leftIcon: const SizedBox(),
    Widget rightIcon: const SizedBox(),
    Color backgroundColor: Colors.white,
    Color barrierColor: Colors.black26,
    bool barrierDismissible: false,
    double elevation: 5.0,
    double borderRadius: 5.0,
    double avatarRadius: 25.0,
  }) {
    _dialogIsOpen = true;
    _title.value = title;
    _barrierDismissible.value = barrierDismissible;
    _rightIcon.value = rightIcon;
    _leftIcon.value = leftIcon;
    _avatarRadius.value = avatarRadius;

    return showGeneralDialog(
      context: _context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Wrap(
          children: [
            AnimatedBuilder(
              animation: Listenable.merge(
                [
                  _title,
                  _leftIcon,
                  _rightIcon,
                  _barrierDismissible,
                  _avatarRadius,
                ],
              ),
              builder: (BuildContext context, _) {
                return GestureDetector(
                  onTap: () => _barrierDismissible.value ? close() : null,
                  child: theme == LoaderTheme.dialogDefault
                      ? DefaultTheme(
                          context: _context,
                          leftIcon: _leftIcon,
                          title: _title,
                          rightIcon: _rightIcon,
                          barrierColor: barrierColor,
                          elevation: elevation,
                          borderRadius: borderRadius,
                          backgroundColor: backgroundColor,
                        )
                      : CircleTheme(
                          context: _context,
                          leftIcon: _leftIcon,
                          title: _title,
                          avatarRadius: _avatarRadius,
                          rightIcon: _rightIcon,
                          barrierColor: barrierColor,
                          elevation: elevation,
                          borderRadius: borderRadius,
                          backgroundColor: backgroundColor,
                        ),
                );
              },
            ),
          ],
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(_context).modalBarrierDismissLabel,
      barrierColor: barrierColor,
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}
