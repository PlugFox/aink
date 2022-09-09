import 'package:flutter/material.dart';

import '../../../common/constant/assets.gen.dart';

/// {@template promt_widget}
/// PromtWidget widget
/// {@endtemplate}
class PromtWidget extends StatefulWidget {
  /// {@macro promt_widget}
  const PromtWidget({
    this.duration = const Duration(milliseconds: 650),
    super.key,
  });

  /// The duration of the animation.
  final Duration duration;

  @override
  State<PromtWidget> createState() => _PromtWidgetState();
}

/// State for widget PromtWidget
class _PromtWidgetState extends State<PromtWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _inputController = TextEditingController();

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: 0,
      duration: widget.duration,
    );
    forward();
  }

  @override
  void didUpdateWidget(PromtWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != _animationController.duration) {
      _animationController.duration = widget.duration;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    _inputController.dispose();
    super.dispose();
  }
  /* #endregion */

  @visibleForTesting
  Future<void> forward() async {
    if (_animationController.isCompleted) return;
    try {
      await _animationController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @visibleForTesting
  Future<void> reverse() async {
    if (_animationController.isDismissed) return;
    try {
      await _animationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @visibleForTesting
  Future<void> repeat() async {
    try {
      await _animationController.repeat().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: FadeTransition(
          opacity: _animationController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: Center(
                  child: SizedBox(
                    width: 1240,
                    height: 48,
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 8,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: Center(
                                child: TextField(
                                  enabled: true,
                                  maxLength: 256,
                                  maxLines: 1,
                                  minLines: 1,
                                  controller: _inputController,
                                  focusNode: _focusNode,
                                  //cursorWidth: 1,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    //labelText: 'Promt',
                                    //helperText: 'Helper text',
                                    hintText: 'Type your promt here',
                                    counterText: '',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const VerticalDivider(
                            width: 1,
                          ),
                          SizedBox.square(
                            dimension: 48,
                            child: ValueListenableBuilder<TextEditingValue>(
                              valueListenable: _inputController,
                              builder: (context, value, child) => IconButton(
                                splashRadius: 36,
                                onPressed: value.text.length < 3
                                    ? null
                                    : () {
                                        _focusNode.unfocus();
                                        _inputController.clear();
                                      },
                                icon: const Icon(
                                  Icons.send,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const Alignment(0, -.25),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox.square(
                      dimension: 512,
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: <Widget>[
                            /* const Positioned.fill(
                              child: Center(
                                child: Icon(
                                  Icons.image,
                                  size: 128,
                                  color: Colors.grey,
                                ),
                              ),
                            ), */
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  Assets.image.sunflower512x512.path,
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      stops: const <double>[
                                        0,
                                        0.6,
                                        1,
                                      ],
                                      colors: <Color>[
                                        Colors.black.withOpacity(0.85),
                                        Colors.black.withOpacity(0.75),
                                        Colors.black.withOpacity(0),
                                      ],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 64,
                                      child: Text(
                                        _kPlaceholderText,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.white70),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              height: 40,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: <Color>[
                                      Colors.black.withOpacity(0.5),
                                      Colors.black.withOpacity(0.8),
                                    ],
                                    stops: const [0.0, 1.0],
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    const Divider(
                                      height: 1,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {},
                                            iconSize: 24,
                                            splashRadius: 18,
                                            padding: EdgeInsets.zero,
                                            color: Colors.white,
                                            icon: const Icon(
                                              Icons.repeat,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            iconSize: 24,
                                            splashRadius: 18,
                                            padding: EdgeInsets.zero,
                                            color: Colors.white,
                                            icon: const Icon(
                                              Icons.open_with,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            iconSize: 24,
                                            splashRadius: 18,
                                            padding: EdgeInsets.zero,
                                            color: Colors.white,
                                            icon: const Icon(
                                              Icons.share,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            iconSize: 24,
                                            splashRadius: 18,
                                            padding: EdgeInsets.zero,
                                            color: Colors.white,
                                            icon: const Icon(
                                              Icons.save,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            iconSize: 24,
                                            splashRadius: 18,
                                            padding: EdgeInsets.zero,
                                            color: Colors.white,
                                            icon: const Icon(
                                              Icons.favorite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

const String _kPlaceholderText = '''
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
''';
