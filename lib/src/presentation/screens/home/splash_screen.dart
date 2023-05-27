import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/src/extensions/color_extensions.dart';

import '../../../../gen/assets.gen.dart';
import '../../design_system/all.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({
    super.key,
    required this.child,
    required this.display,
  });

  final Widget child;
  final bool display;

  final _animationDuration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      initialValue: 0,
      duration: _animationDuration,
    );

    final shouldRender = useRef(true);

    animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 3));
        shouldRender.value = false;
      }
    });

    if (display == false) {
      animationController.forward();
    }

    final color = Theme.of(context).primaryColor;

    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ),
      builder: (context, child) {
        return Stack(
          fit: StackFit.expand,
          children: [
            this.child,
            if (shouldRender.value)
              Positioned.fill(
                child: Opacity(
                  opacity: (animationController.value * -1) + 1,
                  child: child,
                ),
              ),
          ],
        );
      },
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: SvgPicture.asset(
          Assets.icons.pokeball,
          width: 100,
          height: 100,
          colorFilter: ColorFilter.mode(
            color.contrasting,
            BlendMode.srcIn,
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// @riverpod
// class SplashScreenController extends _$SplashScreenController {
//   @override
//   SplashScreenControllerState build() {
//     return SplashScreenControllerState(
//       shouldDisplay: true,
//       shouldRender: true,
//       fadeOutDuration: const Duration(seconds: 5),
//     );
//   }

//   Future<void> hide() async {
//     state.shouldDisplay = false;

//     ref.notifyListeners();

//     await Future.delayed(state.fadeOutDuration);

//     state.shouldRender = false;

//     ref.notifyListeners();
//   }
// }

// class SplashScreenControllerState {
//   bool shouldDisplay;
//   bool shouldRender;
//   Duration fadeOutDuration;

//   SplashScreenControllerState({
//     required this.shouldDisplay,
//     required this.shouldRender,
//     required this.fadeOutDuration,
//   });
// }
