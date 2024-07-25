import 'package:flutter/material.dart';
import 'package:gemini_app/utils/screen_dimensions.dart';
import 'package:typewritertext/typewritertext.dart';

class NamingPig extends StatelessWidget {
  final void Function() updateView;

  const NamingPig({super.key, required this.updateView});

  @override
  Widget build(BuildContext context) {
    final (width, _) = getScreenDimensionsForSafeArea(context, false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "lib/assets/images/dancing-pig.gif",
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
            controller: TextEditingController(),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter a name...',
              hintStyle: const TextStyle(color: Colors.white),
              suffixIcon: IconButton(
                onPressed: updateView,
                icon: const Icon(Icons.arrow_forward),
              ),
            ),
            textInputAction: TextInputAction.done,
          ),
        ),
      ],
    );
  }
}
