import 'package:flutter/material.dart';
import 'package:fodya_app/pages/dashboard.dart';
import 'package:fodya_app/pages/homepage.dart' as home;

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(0.0),
            child: Container(
              color: Theme.of(context).accentColor,
              padding: EdgeInsets.only(
                left: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Fodya',
                    style: Theme.of(context).accentTextTheme.display2,
                  ),
                  Expanded(child: Container()),
                  Text(
                    'John Doe',
                    style: Theme.of(context).accentTextTheme.display1,
                  ),
                  Text(
                    'N0 1333X768',
                    style: Theme.of(context).accentTextTheme.body2,
                  ),
                ],
              ),
            ),
          ),
//          DrawerItem(
//            title: 'Barn Monitor',
//            onTap: () => _goToBarn(context),
//            icon: 'assets/img/barn.png',
//          ),
//          DrawerItem(
//            onTap: () => _comingSoon(context),
//            title: 'Weather Tool',
//            icon: 'assets/img/storm.png',
//          ),
//          DrawerItem(
//            onTap: () => _comingSoon(context),
//            title: 'Market Tool',
//            icon: 'assets/img/statistics.png',
//          ),
//          DrawerItem(
//            onTap: () => _comingSoon(context),
//            title: 'Find a professional',
//            icon: 'assets/img/engineer.png',
//          ),
//          DrawerItem(
//            onTap: () => _comingSoon(context),
//            title: 'Services',
//            icon: 'assets/img/plant.png',
//          ),
//          DrawerItem(
//            onTap: () => _comingSoon(context),
//            title: 'E-shop',
//            icon: 'assets/img/goods.png',
//          ),
//          DrawerItem(
//            onTap: () => _comingSoon(context),
//            title: 'Calendar',
//            icon: 'assets/img/calendar.png',
//          ),
        ],
      ),
    );
  }

  void _goToBarn(context) {
    Navigator.pop(context);
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Dashboard();
        },
      ),
    );
  }

  void _comingSoon(context) {
    Navigator.pop(context);
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Coming Soon!')));
  }
}

class DrawerItem extends StatelessWidget {
  final Function onTap;
  final String title;
  final String icon;

  DrawerItem({this.onTap, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(left: 0.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Image(
                  image: AssetImage(this.icon),
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.display1.apply(
                      fontSizeFactor: 0.8,
                      color: Colors.black,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
