import 'package:api_provider_list_json/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SingleUser extends StatefulWidget {
  const SingleUser({super.key});

  @override
  State<SingleUser> createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.getSingleUserProvider();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final provider = Provider.of<UserProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Single object Api with Provider')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              provider.loading
                  ? SpinKitThreeBounce(
                      size: 35,
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: index.isEven ? Colors.red : Colors.green,
                          ),
                        );
                      },
                    )
                  : Consumer<UserProvider>(
                      builder: (context, value, child) {
                        return Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value.singleUser!.id.toString()),
                                Text(provider.singleUser!.name.toString()),
                                Text(provider.singleUser!.email.toString()),
                                Text(provider.singleUser!.company!.name
                                    .toString()),
                                Text(provider.singleUser!.phone.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
