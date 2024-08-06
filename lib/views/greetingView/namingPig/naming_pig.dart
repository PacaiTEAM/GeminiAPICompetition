import 'package:flutter/material.dart';
import 'package:gemini_app/utils/screen_dimensions.dart';
import 'package:typewritertext/typewritertext.dart';

class NamingPig extends StatefulWidget {
  final void Function() updateView;

  const NamingPig({super.key, required this.updateView});

  @override
  State<NamingPig> createState() => _NamingPigState();
}

class _NamingPigState extends State<NamingPig> {
  final _controller = TextEditingController();

  String? get _errorText {
    final text = _controller.value.text;
    if (text.isEmpty) return 'Please enter a name';
    if (text.length < 3) return 'Name must be at least 3 characters long';
    if (text.length > 15) return 'Name must be at most 15 characters long';
    return null;
  }

  void _submit() {
    // print("lemeng is the best");
    // if there is no error text
    if (_errorText == null) {
      // notify the parent widget via the onSubmit callback
      widget.updateView();
    }
  }

  final _text = '';
  @override
  Widget build(BuildContext context) {
    final (width, _) = getScreenDimensionsForSafeArea(context, false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "lib/assets/images/listening-pig.gif",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            height: 100,
            child: TypeWriter.text(
              "Please give me a name:",
              // enabled: widget.enabled,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.035,
                color: Colors.white,
              ),
              duration: const Duration(milliseconds: 75),
            ),
          ),
        ),
        SizedBox(
          width: 500,
          child: TextField(
            controller: _controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter the name',
              hintStyle: const TextStyle(color: Colors.white),
              errorText: _errorText,
              suffixIcon: IconButton(
                onPressed: _controller.text.isNotEmpty ? _submit : null,
                icon: const Icon(Icons.arrow_forward),
              ),
            ),
            textInputAction: TextInputAction.done,
            onChanged: (text) => setState(() => _text),
          ),
        ),
      ],
    );
  }
}
