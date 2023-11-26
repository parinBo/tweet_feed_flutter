import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweet_feed/models/user_model.dart';
import 'package:tweet_feed/providers/coredata_provider.dart';

class EndDrawerScreen extends StatefulWidget {
  const EndDrawerScreen({super.key});

  @override
  State<EndDrawerScreen> createState() => _EndDrawerScreenState();
}

class _EndDrawerScreenState extends State<EndDrawerScreen> {
  final _inputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final collection = FirebaseFirestore.instance.collection('users');
  late CoreDataProvider currentUser;
  @override
  Widget build(BuildContext context) {
    currentUser = context.watch<CoreDataProvider>();
    return Form(
      key: _formKey,
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('current User: ${currentUser?.user?.username??''}'),
                    Row(
                      children: [
                        const Text('username: '),
                        Expanded(
                            child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            controller: _inputController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        )),
                        IconButton(
                            onPressed: onAddUser,
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ],
                )),
            Expanded(child: listUser())
          ],
        ),
      ),
    );
  }

  listUser() {
    return StreamBuilder(
      stream: collection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return ListView(
              children: snapshot.data!.docs
                  .map((e) => ListTile(
                        title: Text(e["username"]),
                        onTap: () async {
                          var data = UserModel.fromJson(e.data());
                          data.id = e.reference.id;
                          currentUser.setUser(data);
                        },
                      ))
                  .toList());
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }

  Future<void> onAddUser() async {
    String val = _inputController.text;
    UserModel user = UserModel(username: val);
    if (val.isNotEmpty) {
      await collection
          .add({"username": user.username, "createDate": DateTime.now()});
    }
  }
}
