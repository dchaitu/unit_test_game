import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/freezed_models/bee/bee.dart';

class BeeWidget extends ConsumerStatefulWidget {
  final Bee bee;
  final bool isMoving;
  final Duration moveDuration;
  final double? size;

  const BeeWidget({
    super.key, 
    required this.bee,
    this.isMoving = false,
    this.moveDuration = const Duration(milliseconds: 500),
    this.size,
  });

  @override
  ConsumerState<BeeWidget> createState() => _BeeWidgetState();
}

class _BeeWidgetState extends ConsumerState<BeeWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  bool _isMoving = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.moveDuration,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() => _isMoving = false);
        }
      });
    
    _positionAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 0.0), // Move right by default
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }


  @override
  void didUpdateWidget(covariant BeeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMoving && !_isMoving) {
      _isMoving = true;
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate size to be 85% of the provided size or default to 8% of screen width
    final double size = (widget.size ?? MediaQuery.of(context).size.shortestSide * 0.08) * 0.85;

    Widget beeWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.bee.currHealth.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          width: size,
          height: size,
          child: Image.asset(
            Bee.imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );

    // If not moving, just return the basic widget
    if (!_isMoving) {
      return beeWidget;
    }

    // If moving, wrap in an animated position
    return AnimatedBuilder(
      animation: _positionAnimation,
      builder: (context, child) {
        return FractionalTranslation(
          translation: _positionAnimation.value,
          child: child,
        );
      },
      child: beeWidget,
    );
  }
}
