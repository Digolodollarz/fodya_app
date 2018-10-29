import 'package:flutter/material.dart';
import 'package:fodya_app/theme.dart';

class BarnMonitor extends StatefulWidget {
  @override
  _BarnMonitorState createState() => _BarnMonitorState();
}

class _BarnMonitorState extends State<BarnMonitor> {
  double production;
  double humidity;
  double temperature;
  bool fire;
  bool door;
  bool fan;

  void init() {
    setState(() {
      production = 45.0;
      humidity = 67.0;
      temperature = 55.2;
      fire = false;
      door = false;
      fan = false;
    });
  }

  _BarnMonitorState() {
    production = 45.0;
    humidity = 67.0;
    temperature = 55.2;
    fire = false;
    door = false;
    fan = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barn Monitor'),
      ),
      body: Container(
        color: Theme.of(context).accentColor.withOpacity(0.90),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                'Overal Production',
                style: Theme.of(context).accentTextTheme.display1,
              ),
            ),
            Text(
              production.ceil().toString(),
              style:
                  primaryTextTheme(Theme.of(context).accentTextTheme).display2,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      top: BorderSide(color: Colors.white54),
                      bottom: BorderSide(color: Colors.white54))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Humidity',
                      style: primaryTextTheme(Theme.of(context).accentTextTheme)
                          .body2,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      humidity > 50 ? 'High' : 'Low',
                      style: primaryTextTheme(Theme.of(context).accentTextTheme)
                          .body2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      top: BorderSide(color: Colors.white54),
                      bottom: BorderSide(color: Colors.white54))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Temperature',
                      style: primaryTextTheme(Theme.of(context).accentTextTheme)
                          .body2,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      temperature.toString(),
                      style: primaryTextTheme(Theme.of(context).accentTextTheme)
                          .body2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      top: BorderSide(color: Colors.white54),
                      bottom: BorderSide(color: Colors.white54))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Fire',
                      style: primaryTextTheme(Theme.of(context).accentTextTheme)
                          .body2,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      fire ? 'Warn' : 'Normal',
                      style: primaryTextTheme(Theme.of(context).accentTextTheme)
                          .body2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      top: BorderSide(color: Colors.white54),
                      bottom: BorderSide(color: Colors.white54))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Door Status',
                      style: primaryTextTheme(Theme.of(context).accentTextTheme)
                          .body2,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      door ? 'Open' : 'Closed',
                      style: primaryTextTheme(Theme.of(context).accentTextTheme)
                          .body2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      top: BorderSide(color: Colors.white54),
                      bottom: BorderSide(color: Colors.white54))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Fan statues',
                      style: primaryTextTheme(Theme.of(context).accentTextTheme)
                          .body2,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      fan ? 'Running' : 'Stopped',
                      style: primaryTextTheme(Theme.of(context).accentTextTheme)
                          .body2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
