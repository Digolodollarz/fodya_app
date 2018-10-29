import 'package:flutter/material.dart';
import 'package:fodya_app/model/BarnData.dart';
import 'package:fodya_app/model/profile.dart';

class DashboardState extends State<Dashboard> {
  Profile currentUser = defaultUser;

  DashboardState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Barn Monitoring'),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => print('Mhaiwee'),
            ),
          ],
        ),
        body: BodyWidget());
  }
}

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: getBarnData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return new SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Card(
                        margin: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 8.0,
                        ),
                        color: Colors.green,
                        child: new BarnGraph(snapshot)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 16.0,
                            ),
                            decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              gradient: new LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.1, 0.5, 0.7, 0.9],
                                colors: [
                                  Colors.green[900],
                                  Colors.green[800],
                                  Colors.green[600],
                                  Colors.green[400],
                                ],
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  snapshot.data[0].smoke.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48.0,
                                  ),
                                ),
                                Text(
                                  'Smoke',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 24.0,
                            ),
                            decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              gradient: new LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.1, 0.5, 0.7, 0.9],
                                colors: [
                                  Colors.green[900],
                                  Colors.green[800],
                                  Colors.green[600],
                                  Colors.green[400],
                                ],
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  snapshot.data[0].smoke.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48.0,
                                  ),
                                ),
                                Text(
                                  'Fire',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            margin: EdgeInsets.all(8.0),
                            color: Colors.green,
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              child: new Text(
                                'Message from the barn',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
