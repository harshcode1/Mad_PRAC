import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Define the Logger mixin
mixin Logger {
  void logDebug(String message) {
    print('DEBUG: $message');
  }

  void logInfo(String message) {
    print('INFO: $message');
  }

  void logWarning(String message) {
    print('WARNING: $message');
  }

  void logError(String message) {
    print('ERROR: $message');
  }
}

// Define the base class Character
class Character {
  String name;
  int level;

  Character(this.name, this.level);
}

// Define the subclass Warrior
class Warrior extends Character with Logger {
  int strength;

  Warrior(String name, int level, this.strength) : super(name, level);

  void attack() {
    logInfo('$name attacks with strength $strength');
  }
}

// Define the subclass Mage
class Mage extends Character with Logger {
  int intelligence;

  Mage(String name, int level, this.intelligence) : super(name, level);

  void castSpell() {
    logInfo('$name casts a spell with intelligence $intelligence');
  }
}

// Define the subclass Rogue
class Rogue extends Character with Logger {
  int agility;

  Rogue(String name, int level, this.agility) : super(name, level);

  void sneak() {
    logInfo('$name sneaks with agility $agility');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
            // Example usage of character classes
            ElevatedButton(
              onPressed: () {
                var warrior = Warrior('Conan', 10, 20);
                warrior.attack();
              },
              child: Text('Attack as Warrior'),
            ),
            ElevatedButton(
              onPressed: () {
                var mage = Mage('Gandalf', 15, 25);
                mage.castSpell();
              },
              child: Text('Cast Spell as Mage'),
            ),
            ElevatedButton(
              onPressed: () {
                var rogue = Rogue('Arya', 12, 30);
                rogue.sneak();
              },
              child: Text('Sneak as Rogue'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
