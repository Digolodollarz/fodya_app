import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fodya_app/pages/shop_item_page.dart';
import 'package:fodya_app/theme.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Future<List<ShopItem>> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-shop'),
      ),
      body: _buildContainer(context),
    );
  }

  Container _buildContainer(context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: _getStoreItems(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return _shopItemsGrid(context, snapshot.data);
          } else if (snapshot.hasError) {
            return Text("""
          An error has occured.
          ${snapshot.error.toString()}
          Please try again;
          """);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _shopItemsGrid(context, List<ShopItem> items) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, position) {
        return Card(
          margin: EdgeInsets.all(8.0),
          clipBehavior: Clip.antiAlias,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: InkWell(
            onTap: () => _openItem(items[position]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Image.asset(items[position].imageUrl),
                  Text(
                    items[position].title,
                    style: shopListItemHeader(Theme.of(context).textTheme),
                  ),
                  Text(items[position].title),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: items.length,
    );
  }

  Future<List<ShopItem>> _getStoreItems() async {
    List<ShopItem> _items = List();
    for (var i = 0; i < 7; i++) {
      _items.add(ShopItem(
          i, i.toString(), 'ml', i.toDouble(), 'assets/img/sample.jpg'));
    }

    return _items;
  }

  _openItem(item) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ShopItemPage(item: item);
        },
      ),
    );
  }
}

class ShopItem {
  int id;
  String title;
  String unit;
  double price;
  String imageUrl;

  ShopItem(this.id, this.title, this.unit, this.price, this.imageUrl);
}
