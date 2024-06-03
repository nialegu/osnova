import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/platform_addicted/progress_indicator.dart';
import '../bloc/signup_bloc.dart';

class AnimatedLoginProgressIcon extends StatefulWidget {
  const AnimatedLoginProgressIcon({super.key});

  @override
  State<AnimatedLoginProgressIcon> createState() =>
      _AnimatedLoginProgressIconState();
}

class _AnimatedLoginProgressIconState extends State<AnimatedLoginProgressIcon> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, anim) => RotationTransition(
                  turns: child.key == const ValueKey('icon1')
                      ? Tween<double>(begin: 0.85, end: 1).animate(anim)
                      : Tween<double>(begin: 1, end: 0.75).animate(anim),
                  child: ScaleTransition(scale: anim, child: child),
                ),
            child: Builder(builder: (context) {
              switch (state) {
                case SignupLoadingState:
                  return progressIndicator;
                case SignupSuccessState:
                  return const Icon(
                    Icons.done,
                    key: ValueKey('icon1'),
                    color: Colors.green,
                    size: 50,
                  );
                case SignupFailedState:
                case SignupErrorState:
                  return const Icon(
                    Icons.error,
                    key: ValueKey('icon1'),
                  );
                default:
                  return progressIndicator;
              }
            }));
      },
    );
  }
}

