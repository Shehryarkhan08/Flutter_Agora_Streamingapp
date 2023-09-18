import 'package:flutter/material.dart';
import 'package:streaming_app/appid.dart';
import 'package:agora_uikit/agora_uikit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Streaming App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AgoraClient client = AgoraClient(
      agoraConnectionData:
          AgoraConnectionData(appId: appId, channelName: "test"),
      enabledPermission: [Permission.camera, Permission.microphone]);

  @override
  void initState() {
    super.initState();
    client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(client: client)
          ],
        ));
  }
}
