import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweet_feed/providers/coredata_provider.dart';
import 'package:tweet_feed/screens/feed_screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _inputControl = TextEditingController();
  final collection = FirebaseFirestore.instance.collection('posts');
  late CoreDataProvider user;
  @override
  Widget build(BuildContext context) {
    user = context.read<CoreDataProvider>();
    return Form(
      key: _formKey,
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _inputControl,
                maxLines: null,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'What are you thinking?'),
              ),
            ),
            ElevatedButton(onPressed: onSave, child: const Icon(Icons.send)),
          ],
        ),
        const FeedScreen()
      ]),
    );
  }

  Future<void> onSave() async {
    var val = _inputControl.text;
    if(val.isNotEmpty && user.user.id != null) {
      await collection.add({
        "userId": user.user.id,
        "text": val,
        "likes" : 0,
        "createDate" : DateTime.now(),
        "updateDate" : DateTime.now(),
      });
    }
  }
}
