import 'package:flutter/material.dart';

class AnimationProvider with ChangeNotifier {
  final AnimationController? _animationController;

  AnimationProvider(this._animationController) {
    _animationController?.addListener(_onAnimationControllerChanged);
  }

  void _onAnimationControllerChanged() {
    notifyListeners();
  }

  double get value => _animationController?.value ?? 0;

  Future<void> forward() async => await _animationController?.forward();
  Future<void> reverse() async => await _animationController?.reverse();

  @override
  void dispose() {
    _animationController?.removeListener(_onAnimationControllerChanged);
    super.dispose();
  }
}
