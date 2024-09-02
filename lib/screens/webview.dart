import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({ super.key });

  @override
  State<WebviewScreenState> createState() => WebviewScreenState();
}

class WebviewScreenState extends State<WebviewScreen> {
  late final WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Website'),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
      bottomNavigationBar: NavigationBar(controller: _controller),
    );
  }
}

class NavigationBar extends StatelessWidget {
  final WebViewController controller;

  const NavigationBar({ super.key, required this.controller });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          NavigationButton(
            icon: Icons.chevron_right,
            onPressed: () => _goBack(),
            controller: controller,
          ),
          NavigationButton(
            icon: Icons.chevron_right,
            onPressed: () => _goForward(),
            controller: controller,
          )
        ],
      )
    );
  }

  Future<void> _goBack() async {
    if (await controller.canGoBack()) {
      await controller.goBack();
    }
  }

  Future<void> _goForward() async {
    if (await controller.canGoForward()) {
      await controller.goForward();
    }
  }
}

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final WebViewController controller;

  const NavigationButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: () => onPressed(),
    );
  }
}