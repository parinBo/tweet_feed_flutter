import 'package:flutter/material.dart';

class NotiScreen extends StatefulWidget {
  const NotiScreen({super.key});

  @override
  State<NotiScreen> createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notificaion')),
      body: ListView.builder(itemCount: 10, itemBuilder: itemBuilder),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return ListTile(
        title: Text('ถูกใจโพสที่ ${index + 1} ของคุณ'),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.red,
            )));
  }
}
