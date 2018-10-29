class Budget {
  String title;
  Crop crop;
  List<BudgetItem> items;

  Budget(){
    this.items = List();
  }
}

class BudgetItem {
  String name;
  List<Input> inputs;

  BudgetItem(){
    this.inputs = List();
  }
}

class Chemical implements Input {
  String name;
  double price;
}

class Fertilizer implements Input {
  String name;
}

enum CropStage {
  Preparation,
  Planting,
  Seeding,
}

class Crop {}

class Input {}

getSampleBudget() {
  var sampleBudget = Budget();

  var chemical = Chemical();
  chemical.name = 'Diphenylhydramine';
  chemical.price = 45.0;

  var fertilizer = Fertilizer();
  fertilizer.name = 'Compound D';

  var item1 = BudgetItem();
  item1.name = 'Lorem ipsum';
  item1.inputs.add(fertilizer);
  item1.inputs.add(chemical);

  var item2 = BudgetItem();
  item2.name = 'Dolor Sit';
  item2.inputs.add(fertilizer);
  item2.inputs.add(chemical);

  sampleBudget.title = 'New Budget';
  sampleBudget.items.add(item1);
  sampleBudget.items.add(item2);

  return sampleBudget;
}
