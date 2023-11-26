import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweet_feed/models/post_model.dart';
import 'package:tweet_feed/providers/coredata_provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final collection = FirebaseFirestore.instance.collection('posts');
  List<int> likeSelectedIndexs = [];
  late CoreDataProvider user;

  @override
  Widget build(BuildContext context) {
    user = context.read<CoreDataProvider>();
    return StreamBuilder(
        stream: collection.where("userId", isEqualTo: user.user.id).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Container(child: const Text('error'),);
          }
          if(snapshot.hasData) {
            snapshot.data!.docs.forEach((element) {
              var post  = PostModel.fromJson(element.data());
              post.setId = element.reference.id;
              print('test :: ${element.data()} ${post.userId}'); 
              });
            return  Expanded(child: ListView(children: snapshot.data!.docs.map((e) => const Text('test')).toList()));
          }

          return Container();

        });
  }

  // widgetData() {
  //   return Expanded(
  //       child: ListView.builder(itemCount: 20, itemBuilder: itemBuilder));
  // }

  // Widget? itemBuilder(BuildContext context, int index) {
  //   return Column(
  //     children: [
  //       Card(
  //         elevation: 6,
  //         child: ListTile(
  //           title: const Text('username'),
  //           subtitle: const SizedBox(
  //             height: 30,
  //             child: Text(
  //                 'Ehtas thepaszta is a not the papikada in the progjklskdm, resasfd has tje more news in the dsascxz dasa a yimson'),
  //           ),
  //           trailing: Column(
  //             children: [
  //               InkWell(
  //                 child: Icon(
  //                   Icons.favorite,
  //                   color:
  //                       likeSelectedIndexs.where((e) => e == index).isNotEmpty
  //                           ? Colors.pink
  //                           : null,
  //                 ),
  //                 onTap: () {
  //                   if (likeSelectedIndexs.where((e) => e == index).isEmpty) {
  //                     likeSelectedIndexs.add(index);
  //                   } else {
  //                     likeSelectedIndexs.remove(index);
  //                   }
  //                   setState(() {});
  //                 },
  //               ),
  //               const Text('21 Likes')
  //             ],
  //           ),
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 4,
  //       )
  //     ],
  //   );
  // }

}
