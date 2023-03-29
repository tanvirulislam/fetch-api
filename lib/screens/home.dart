import 'package:api_provider_list_json/providers/user_provider.dart';
import 'package:api_provider_list_json/screens/single_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    final provider = Provider.of<UserProvider>(context, listen: false);
    // Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('List Api with Provider')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: provider.getUser(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return SpinKitThreeBounce(
                      size: 35,
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: index.isEven ? Colors.red : Colors.green,
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.users.length,
                      itemBuilder: (BuildContext context, int index) {
                        var user = provider.users[index];
                        return Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.id.toString()),
                                Text(user.name.toString()),
                                Text(user.email.toString()),
                                Text(user.address!.city.toString()),
                                Text(user.phone.toString()),
                                Text(user.company!.name.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            PageTransition(
              child: SingleUser(),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
