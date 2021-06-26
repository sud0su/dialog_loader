import 'package:flutter/material.dart';

import 'custom_theme.dart';
import 'default_theme.dart';

enum LoaderTheme { dialogDefault, dialogCircle }

class DialogLoader {
  final ValueNotifier<Widget> _title = ValueNotifier<Widget>(Container());
  final ValueNotifier<Widget> _leftIcon = ValueNotifier<Widget>(Container());

  final ValueNotifier<Widget> _rightIcon = ValueNotifier<Widget>(Container());
  final ValueNotifier<bool> _closeOnClick = ValueNotifier<bool>(false);

  bool _dialogIsOpen = false;
  late BuildContext _context;

  DialogLoader({required context}) {
    this._context = context;
  }

  void update({
    Widget? title,
    Widget? leftIcon,
    Widget? rightIcon,
    bool closeOnClick: false,
    bool autoClose: true,
  }) {
    _title.value = title ?? Container();
    _leftIcon.value = leftIcon ?? Container();
    _rightIcon.value = rightIcon ?? Container();
    _closeOnClick.value = closeOnClick;
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
    Widget? title,
    Widget? leftIcon,
    Widget? rightIcon,
    bool? closeOnClick,
    Color backgroundColor: Colors.white,
    Color barrierColor: Colors.black26,
    bool barrierDismissible: false,
    double elevation: 5.0,
    double borderRadius: 5.0,
  }) {
    _dialogIsOpen = true;
    _title.value = title ?? Container();
    _closeOnClick.value = closeOnClick ?? false;
    _rightIcon.value = rightIcon ?? Container();
    _leftIcon.value = leftIcon ?? Container();

    return showGeneralDialog(
      context: _context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Wrap(
          children: [
            AnimatedBuilder(
              animation: Listenable.merge(
                [_title, _leftIcon, _rightIcon, _closeOnClick],
              ),
              builder: (BuildContext context, _) {
                return GestureDetector(
                  onTap: () => _closeOnClick.value ? close() : null,
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
