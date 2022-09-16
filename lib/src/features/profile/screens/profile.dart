import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[200],
          // image: DecorationImage(
          //     image: AssetImage('assets/images/profileBg2.jpg'), fit: BoxFit.cover
          // )
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/login.png'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 90.0,
              color: Colors.grey[800],
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.black45,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Cheeku',
              style: TextStyle(
                color: Colors.white60,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Birth Date',
              style: TextStyle(
                color: Colors.black45,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '06/11/21',
              style: TextStyle(
                color: Colors.white60,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Age',
              style: TextStyle(
                color: Colors.black45,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '10 Months',
              style: TextStyle(
                color: Colors.white60,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 10.0),
            // Row(
            //   children: <Widget>[
            //     Icon(
            //       Icons.baby,
            //       color: Colors.grey[400],
            //     ),
            //     Text(
            //       'jeevansneha@gmail.com',
            //       style: TextStyle(
            //         color: Colors.grey[400],
            //         fontSize: 18.0,
            //         letterSpacing: 1.0,
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
