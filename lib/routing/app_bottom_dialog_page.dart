import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AppBottomDialogPage<T> extends Page<T> {
  const AppBottomDialogPage({
    super.key,
    required this.builder,
    required this.settings,
    this.closeProgressThreshold,
    this.containerBuilder,
    this.expanded = false,
    this.bounce = false,
    this.modalBarrierColor,
    this.isDismissible = true,
    this.enableDrag = true,
    this.scrollController,
    this.duration,
    this.secondAnimationController,
    this.animationCurve,
    this.barrierLabel,
  });

  final WidgetBuilder builder;
  final RouteSettings settings;
  final double? closeProgressThreshold;
  final WidgetWithChildBuilder? containerBuilder;
  final bool expanded;
  final bool bounce;
  final Color? modalBarrierColor;
  final bool isDismissible;
  final bool enableDrag;
  final ScrollController? scrollController;
  final Duration? duration;
  final AnimationController? secondAnimationController;
  final Curve? animationCurve;
  final String? barrierLabel;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        isScrollControlled: true,
        builder: builder,
        settings: this,
        // closeProgressThreshold: closeProgressThreshold,
        // containerBuilder: containerBuilder,
        // expanded: expanded,
        // bounce: bounce,
        modalBarrierColor: modalBarrierColor,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        // scrollController: scrollController,
        // duration: duration,
        // secondAnimationController: secondAnimationController,
        // animationCurve: animationCurve,
        barrierLabel: barrierLabel,
      );
}
