import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final String? text;
  const ProgressIndicatorWidget({this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            backgroundColor: Colors.orange,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text ?? "Configurando sua conta, por favor aguarde ...",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
