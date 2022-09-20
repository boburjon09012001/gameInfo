import 'dart:io';

import 'package:flutter/material.dart';
import 'package:game_info/models/data_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
class GetGameWebView extends StatefulWidget {
  final DataModel dataModel;
  const GetGameWebView({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<GetGameWebView> createState() => _GetGameWebViewState();
}

class _GetGameWebViewState extends State<GetGameWebView> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context, ) {
    return const Scaffold(
        body: SafeArea(
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: "https://www.gamerpower.com",
          ),
        ));
  }
}
