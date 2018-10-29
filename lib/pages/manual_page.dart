import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fodya_app/theme.dart';

const String _markdownData = """# Markdown Example
Markdown allows you to easily include formatted text, images, and even formatted Dart code in your app.
## Styling
Style text as _italic_, __bold__, or `inline code`.
- Use bulleted lists
- To better clarify
- Your points
## Links
You can use [hyperlinks](hyperlink) in markdown
## Images
You can include images:
![Flutter logo](https://flutter.io/images/flutter-mark-square-100.png#100x100)
## Markdown widget
This is an example of how to create your own Markdown widget:
    new Markdown(data: 'Hello _world_!');
## Code blocks
Formatted Dart code looks really pretty too:
```
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Markdown(data: markdownData)
    )
  ));
}
```
Enjoy!
""";

class ManualPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Production Manual',
        ),
      ),
      body: ManualPageBody(),
    );
  }
}

class ManualPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Stages of Tobacco products',
                    style:
                        Theme.of(context).accentTextTheme.display1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(child: Criterias())),
        ],
      ),
    );
  }
}

class Criterias extends StatefulWidget {
  ManualState createState() => new ManualState();
}

class ManualItem {
  bool isExpanded;
  final String header;
  final String body;
  final Icon iconpic;

  ManualItem(this.isExpanded, this.header, this.body, this.iconpic);
}

class ManualState extends State<Criterias> {
  List<ManualItem> items = <ManualItem>[
    new ManualItem(
      false,
      'Pre season preparation',
      _markdownData,
      new Icon(Icons.book),
    ),
    new ManualItem(
      false,
      'Seed bed preparation',
      _markdownData,
      new Icon(Icons.book),
    ),
    new ManualItem(
      false,
      'Planting stage',
      _markdownData,
      new Icon(Icons.book),
    ),
    new ManualItem(
      false,
      'So on and on',
      _markdownData,
      new Icon(Icons.book),
    ),
    //give all your items here
  ];

  Widget build(BuildContext context) {
    return new ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          items[index].isExpanded = !items[index].isExpanded;
        });
      },
      children: items.map((ManualItem item) {
        return new ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return new ListTile(
              title: new Text(
                item.header,
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .body2
                    .copyWith(color: Colors.black),
              ),
            );
          },
          isExpanded: item.isExpanded,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: MarkdownBody(data: item.body),
          ),
        );
      }).toList(),
    );
  }
}
