import 'package:flutter/material.dart';
import 'package:fodya_app/pages/shop_page.dart';
import 'package:fodya_app/theme.dart';

class ShopItemPage extends StatelessWidget {
  final ShopItem item;

  const ShopItemPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-shop'),
      ),
      body: ShopItemDetail(item: this.item),
    );
  }
}

class ShopItemDetail extends StatefulWidget {
  final ShopItem item;

  const ShopItemDetail({Key key, this.item}) : super(key: key);

  @override
  _ShopItemDetailState createState() => _ShopItemDetailState(item);
}

class _ShopItemDetailState extends State<ShopItemDetail> {
  final ShopItem item;

  _ShopItemDetailState(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          Image.asset(item.imageUrl),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      item.title,
                      style: shopListItemHeader(Theme.of(context).textTheme),
                    ),
                    Text(
                      """${item.price} ${item.unit}""",
                      style: shopListItemHeader(Theme.of(context).textTheme),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
