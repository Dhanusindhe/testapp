import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:moengage_flutter/moengage_flutter.dart';
import 'package:testapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  try {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  } catch (err) {
    debugPrint(err.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;
  final MoEngageFlutter _moengagePlugin =
      MoEngageFlutter("H0LK4MS1ETIM4ODCRME7R6HE");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    debugPrint('$tag initState() : start ');
    _moengagePlugin.configureLogs(LogLevel.VERBOSE);
    _moengagePlugin.initialise();
    // _moengagePlugin.setUniqueId("005");
    // _moengagePlugin.registerForPushNotification();
    _moengagePlugin.showInApp();
    _moengagePlugin.showNudge();
    debugPrint('$tag initState() : end ');
  }

  void _incrementCounter() async {
    // String? token = await FirebaseMessaging.instance.getToken();
    // print("fcm $token");
    _moengagePlugin.setUserName("Dhanu");
    _moengagePlugin.setFirstName("Test User");
    // _moengagePlugin.setLastName("Yashwanth");
    _moengagePlugin.setEmail("test1@gmail.com");
    _moengagePlugin.setPhoneNumber("1111111111");
    // _moengagePlugin.setUserAttribute("int-attr", 0);
    // _moengagePlugin.setUserAttribute("bool-attr", true);
    // _moengagePlugin.setUserAttribute("string-attr", "Some Value");
    // _moengagePlugin.setUserAttribute("double-attr", 10.0);
    // _moengagePlugin.setUserAttribute("int-arr-attr", [100, 200, 300]);
    // _moengagePlugin.setUserAttribute('product', {
    //   'item-id': 123,
    //   'item-type': 'books',
    //   'item-cost': {'amount': 100, 'currency': 'USD'}
    // });
    // _moengagePlugin.setUserAttribute('products', [
    //   {
    //     'item-id': 123,
    //     'item-cost': {'amount': 100, 'currency': 'USD'}
    //   },
    //   {
    //     'item-id': 323,
    //     'item-cost': {'amount': 90, 'currency': 'USD'}
    //   }
    // ]);

    // var properties = MoEProperties();
    // properties
    //     .addAttribute("attrString", "String Value")
    //     .addAttribute("attrInt", 123)
    //     .addAttribute("attrBool", true)
    //     .addAttribute("attrDouble", 12.32)
    //     .addAttribute("attrLocation", new MoEGeoLocation(12.1, 77.18))
    //     .addAttribute("attrArray", ["item1", "item2", "item3"]).addAttribute(
    //         'product', {
    //   'item-id': 123,
    //   'item-type': 'books',
    //   'item-cost': {'amount': 100, 'currency': 'USD'}
    // }).addAttribute('products', [
    //   {
    //     'item-id': 123,
    //     'item-cost': {'amount': 100, 'currency': 'USD'}
    //   },
    //   {
    //     'item-id': 323,
    //     'item-cost': {'amount': 90, 'currency': 'USD'}
    //   }
    // ]).addISODateTime("attrDate", "2019-12-02T08:26:21.170Z");
    // final MoEngageFlutter _moengagePlugin = MoEngageFlutter("H0LK4MS1ETIM4ODCRME7R6HE");
    // _moengagePlugin.initialise();
    // _moengagePlugin.trackEvent('Flutter Event', properties);
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
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () async {
                  _moengagePlugin.identifyUser("Test User 9003");
                  // var temp = await _moengagePlugin.getUserIdentities();
                  // print(temp.toString());
                },
                child: Container(
                  width: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text("User 1"),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var properties = MoEProperties();
                properties
                    .addAttribute("Type", "Anonymous event");
                    // .addAttribute("Amount", 123)
                    // .addAttribute("Time", 12.32);
                _moengagePlugin.trackEvent("Anonymous", properties);
              },
              child: Container(
                width: 100,
                color: Colors.red,
                child: Center(
                  child: Text("Event triger"),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: InkWell(
            //     onTap: () {
            //       _moengagePlugin.setUniqueId("009");
            //     },
            //     child: Container(
            //       width: 100,
            //       color: Colors.green,
            //       child: Center(
            //         child: Text("User 3"),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  _moengagePlugin.logout();
                },
                child: Container(
                  width: 100,
                  color: Colors.amber,
                  child: Center(
                    child: Text("Logut"),
                  ),
                ),
              ),
            )
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
