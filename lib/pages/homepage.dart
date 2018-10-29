import 'package:flutter/material.dart';
import 'package:fodya_app/model/profile.dart';
import 'package:fodya_app/pages/barn_monitor.dart';
import 'package:fodya_app/pages/budget_page.dart';
import 'package:fodya_app/pages/dashboard.dart';
import 'package:fodya_app/pages/login.dart';
import 'package:fodya_app/pages/manual_page.dart';
import 'package:fodya_app/pages/shop_page.dart';
import 'package:fodya_app/widgets/drawer.dart';

class HomepageState extends State<Homepage> {
  Profile currentUser = defaultUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application yeFodya'),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: _goToLogin,
          ),
          new IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => print('Mhaiwee'),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildDashboardItem(
                    icon: Icons.library_books,
                    text: 'Production Manual',
                    action: _goToManual,
                  ),
                  buildDashboardItem(
                    icon: Icons.attach_money,
                    text: 'Budge',
                    action: _goToBudget,
                  ),
                  buildDashboardItem(
                    icon: Icons.library_books,
                    text: 'Barn Monitor',
                    action: _goToBarn,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildDashboardItem(
                    icon: Icons.live_help,
                    text: 'Queries',
                    action: _goToBarn,
                  ),
                  buildDashboardItem(
                    icon: Icons.settings,
                    text: 'Service',
                    action: _goToBarn,
                  ),
                  buildDashboardItem(
                    icon: Icons.wb_sunny,
                    text: 'Weather',
                    action: _goToBarn,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildDashboardItem(
                    icon: Icons.local_grocery_store,
                    text: 'E-Shop',
                    action: _goToShop,
                  ),
                  buildDashboardItem(
                    icon: Icons.shopping_basket,
                    text: 'Markets',
                    action: _goToBarn,
                  ),
                  buildDashboardItem(
                      icon: Icons.account_balance,
                      text: 'Banking',
                      action: _goToBarn),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildDashboardItem(
                    icon: Icons.book,
                    text: 'Planners',
                    action: _goToBarn,
                  ),
                  buildDashboardItem(
                    icon: Icons.people_outline,
                    text: 'Get a proffessional',
                    action: _goToBarn,
                  ),
                  buildDashboardItem(
                    icon: Icons.people,
                    text: 'Forum',
                    action: _goToBarn,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDashboardItem({IconData icon, String text, action}) {
    if (text != null)
      return Container(
        child: Expanded(
          child: Container(
            constraints: BoxConstraints.expand(height: 100.0),
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: action,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(icon),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body1.copyWith(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    else
      return Expanded(
        child: Container(),
      );
  }

  void _goToBarn() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return BarnMonitor();
        },
      ),
    );
  }

  void _goToManual() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return ManualPage();
        },
      ),
    );
  }

  void _goToShop() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return ShopPage();
        },
      ),
    );
  }

  void _goToBudget() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return BudgetPage();
        },
      ),
    );
  }

  void _goToLogin() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return LoginForm();
        },
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  HomepageState createState() => HomepageState();
}

class HomeListItem extends StatelessWidget {
  final String text;

  HomeListItem(this.text);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}
