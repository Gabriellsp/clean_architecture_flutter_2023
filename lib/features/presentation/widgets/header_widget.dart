import 'package:clean_architecture_flutter_2023/features/presentation/widgets/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 35,
              color: greenColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
