import 'dart:async';

import 'package:hair_salon/features/schedule/bloc/state_provider.dart';

class StateBloc {
  StreamController animationController = StreamController.broadcast();
  final provider = StateProvider();

  Stream get animationStatus => animationController.stream;

  void toggleAnimation () {
    provider.toggleAnimationValue();
    animationController.sink.add(provider.isAnimating);
  }

  void dispose() {
    animationController.close();
  }
}

final stateBloc = StateBloc();