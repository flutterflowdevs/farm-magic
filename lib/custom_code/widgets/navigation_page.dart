// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:farm_magic/index.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({
    super.key,
    this.width,
    this.height,
    required this.selectedLanguageCode,
  });

  final double? width;
  final double? height;
  final String selectedLanguageCode;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  final dynamic languageData = {
    "en": {"home": "Home", "chat": "Message", "profile": "Profile"},
    "hi": {"home": "घर", "chat": "संदेश", "profile": "प्रोफ़ाइल"},
    "pt": {"home": "Lar", "chat": "Mensagem", "profile": "Perfil"},
    "sw": {"home": "Nyumbani", "chat": "Ujumbe", "profile": "Wasifu"}
  };

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    HomePageWidget(),
    ChatPageWidget(),
    ProfilePageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    Color bottomSheet = FlutterFlowTheme.of(context).appBG2;
    Color inactiveColor = FlutterFlowTheme.of(context).tertiary;
    Color activeColor = FlutterFlowTheme.of(context).primaryBackground;
    Color activeIconBackgroundColor = FlutterFlowTheme.of(context).tertiary;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: bottomSheet,
              showLabel: true,
              shadowElevation: 10,
              showTopRadius: true,

              kBottomRadius: 28.0,
              // notchShader: const SweepGradient(
              //   startAngle: 0,
              //   endAngle: pi / 2,
              //   colors: [Colors.red, Colors.green, Colors.orange],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
              notchColor: activeIconBackgroundColor,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: true,
              durationInMilliSeconds: 300,
              elevation: 1,
              bottomBarItems: [
                BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home_outlined,
                      color: inactiveColor,
                      size: 32,
                    ),
                    activeItem: Icon(
                      Icons.home_outlined,
                      color: activeColor,
                    ),
                    itemLabelWidget: text(
                        languageData[widget.selectedLanguageCode]["home"])),
                BottomBarItem(
                    inActiveItem: Icon(
                      Icons.chat_outlined,
                      color: inactiveColor,
                      size: 32,
                    ),
                    activeItem: Icon(
                      Icons.chat_outlined,
                      color: activeColor,
                    ),
                    itemLabelWidget: text(
                        languageData[widget.selectedLanguageCode]["chat"])),
                BottomBarItem(
                    inActiveItem: Icon(
                      Icons.person_outline,
                      color: inactiveColor,
                      size: 32,
                    ),
                    activeItem: Icon(
                      Icons.person_outline,
                      color: activeColor,
                    ),
                    itemLabelWidget: text(
                        languageData[widget.selectedLanguageCode]["profile"])),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }

  Widget text(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xffD0B50B), fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
