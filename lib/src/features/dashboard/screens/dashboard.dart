import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sales/src/features/common/services.dart';

import '../models/bill_details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<BillDetails>? bills;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    bills = await Services().getBills();
    if(bills != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
        child: ListView.builder(
          itemCount: bills?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                dense: false,
                title: Text(bills![index].billToName),
                leading: Icon(FontAwesomeIcons.fileLines, size: 40),
                subtitle: Text('Bill amount: ' + bills![index].billNo),
                trailing: Icon(Icons.preview),
                tileColor: Colors.teal[300],
                onTap: () {
                  debugPrint('clicked');
                },
                onLongPress: () {},
              ),
            );
          },
        ),
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      );
  }
}
