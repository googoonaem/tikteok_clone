import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key, required this.text, required this.icon, required this.event});

  final String text;
  final FaIcon icon;
  final Function(BuildContext) event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => event(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.all(
            Sizes.size14,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400,
              width: Sizes.size1,
            ),
            color: Colors.white,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
