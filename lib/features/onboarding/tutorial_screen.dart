import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24, vertical: Sizes.size36),
          child: AnimatedCrossFade(
            firstChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v80,
                Text(
                  "Watch cool videos!",
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v20,
                Text(
                  "Videos are personalized for you based on what you watch, like, and share.",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v80,
                Text(
                  "Follow the rules!",
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v20,
                Text(
                  "take care of one another",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            crossFadeState: _showingPage == Page.first
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 300),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          height: 120,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 16),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _showingPage == Page.first ? 0 : 1,
              child: CupertinoButton(
                  color: Theme.of(context).primaryColor,
                  child: Text("Enter the app!",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {}),
            ),
          ),
        ),
      ),
    );
  }
}
