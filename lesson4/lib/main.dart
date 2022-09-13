import 'package:flutter/material.dart';
import 'package:lesson4/src/page/prodcut_page.dart';
import 'package:lesson4/src/viewmodel/cart_viewmodel.dart';
import 'package:lesson4/src/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

import 'src/repo/product_repo.dart';
import 'src/viewmodel/counter_viewmodel.dart';
import 'src/viewmodel/setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CounterViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => SettingController(),
          ),
          Provider(create: (context) => PorductRepo()),
          ChangeNotifierProvider(
            create: (context) => CartViewModel(),
          )
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Locale("ar"),
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.light(
                primary: Colors.red,
                secondary: Colors.blue,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              useMaterial3: true,
            ),
            themeMode: context.watch<SettingController>().isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: CounterPage(),
          );
        }));
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text("counter page")),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnoterPage()));
              },
              child: Text("other page")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductPage()));
              },
              child: Text("product page")),
          Text(counter.counter.toString()),
          TextButton.icon(
              onPressed: counter.inc,
              icon: Icon(Icons.add),
              label: Text("inc")),
          TextButton.icon(
              onPressed: counter.dec,
              icon: Icon(Icons.remove),
              label: Text("dec"))
        ],
      ),
    );
  }
}

class AnoterPage extends StatefulWidget {
  const AnoterPage({super.key});

  @override
  State<AnoterPage> createState() => _AnoterPageState();
}

class _AnoterPageState extends State<AnoterPage> {
  late int cunnterValueWhenPageOpen;
  @override
  void initState() {
    cunnterValueWhenPageOpen = context.read<CounterViewModel>().counter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("other page ${cunnterValueWhenPageOpen}"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<SettingController>().toggleTheme();
              },
              child: Text("change theme")),
          Text(
              "the current counter is ${context.watch<CounterViewModel>().counter}"),
          TextButton(
              onPressed: () {
                context.read<CounterViewModel>().inc();
              },
              child: Text("incuremetn"))
        ],
      ),
    );
  }
}
