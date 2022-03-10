import 'package:bible_memory_game/utils/themes.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextEditingController? textEditingController;
  const CustomTextField({Key? key, this.labelText, this.textEditingController}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextFormField(
              controller: widget.textEditingController,
              cursorColor: MainTheme.lightTextColor,
              maxLines: 2,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.all(8),
                focusColor: MainTheme.backgroundBackdropColor,
                filled: true,
                label: Text(
                  widget.labelText ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                  ),
                ),
                fillColor: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
