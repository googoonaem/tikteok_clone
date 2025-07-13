import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.length > 8 && _password.length < 20;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid() || !_isPasswordRegExp()) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BirthdayScreen(),
        ));
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  bool _isPasswordRegExp() {
    final regExp = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^]).+$');
    return regExp.hasMatch(_password);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Gaps.h60,
              Gaps.h48,
              Text("Sign up"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v20,
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                autocorrect: false,
                decoration: InputDecoration(
                    suffix: _password.isEmpty
                        ? Gaps.h1
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: _onClearTap,
                                child: FaIcon(
                                  FontAwesomeIcons.solidCircleXmark,
                                  color: Colors.grey.shade400,
                                  size: Sizes.size20,
                                ),
                              ),
                              Gaps.h10,
                              GestureDetector(
                                onTap: _toggleObscureText,
                                child: FaIcon(
                                  _obscureText
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  color: Colors.grey.shade400,
                                  size: Sizes.size20,
                                ),
                              ),
                            ],
                          ),
                    hintText: "Password",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.grey.shade400,
                    )),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              Text(
                "Your password must have:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size20,
                ),
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _password.isEmpty
                        ? Colors.grey
                        : _isPasswordValid()
                            ? Colors.green
                            : Colors.red,
                    size: Sizes.size16,
                  ),
                  Gaps.h7,
                  Text(
                    "8 to 20 Characters",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _password.isEmpty
                        ? Colors.grey
                        : _isPasswordRegExp()
                            ? Colors.green
                            : Colors.red,
                    size: Sizes.size16,
                  ),
                  Gaps.h7,
                  Text(
                    "Letters, numbers, and special characters",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
              Gaps.v40,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isPasswordValid(),
                  text: "Next",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
