import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fodya_app/model/budget.dart';

class BudgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budgets'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).accentColor.withOpacity(0.1)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: RaisedButton(
                    onPressed: () => print(getSampleBudget().items.length),
                    child: Text(
                      'Enter Hectrage',
                      style: Theme.of(context).accentTextTheme.button,
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MarkdownBody(data: _sample_budget),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BudgetBody extends StatelessWidget {
  final Budget budget;

  BudgetBody(this.budget);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Markdown(data: _sample_budget),
//      child: ListView.builder(
//        itemBuilder: (context, position) {
//          return Card(
//            child: Row(
//              children: <Widget>[
//                Text(budget.items[position].name),
//              ],
//            ),
//          );
//        },
//        itemCount: budget.items.length,
//      ),
    );
  }
}

const String _sample_budget = """
# __Chemicals__
Style text as _italic_, __bold__, or `inline code` for whatever reason.
- budget item 1
- budget item 2
- budget item 3
- budget item 4
- budget item 5
- budget item 6

# Seeding
You can also add the list items as numbered if you want.
1. lorem ipsum dolor
2. Sit amet is thi shhf thsikehfas
3. Thdah dhidhf dsjihds
4. THins snfh hgit snhohaf
5. THen slhfina dhfalhne dhdoin dfadfafdge
6. ahtt ah  __htisn fahtooaihf__ fadfat


# Fertlizers
Just to ad more data until it kind of looks like the renders you sent :-)
* Flah Hfkahidnf l asdhflad
* Flah Hfkahidnf l asdhflad
* Flah Hfkahidnf l asdhflad
* Flah Hfkahidnf l asdhflad
* Flah Hfkahidnf l asdhflad
* Flah Hfkahidnf l asdhflad
""";
