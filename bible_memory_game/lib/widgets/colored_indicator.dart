import 'package:flutter/material.dart';

class ColoredIndicator extends StatefulWidget {
  final bool? success;

  const ColoredIndicator({Key? key, this.success}) : super(key: key);

  @override
  State<ColoredIndicator> createState() => _ColoredIndicatorState();
}

class _ColoredIndicatorState extends State<ColoredIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: widget.success != null
          ? Icon(
              widget.success ?? true ? Icons.check_circle : Icons.cancel,
              color: widget.success ?? true ? Colors.green : Colors.red,
            )
          : Icon(
              Icons.remove_circle_outline,
              color: Colors.grey,
            ),
    );
  }
}
