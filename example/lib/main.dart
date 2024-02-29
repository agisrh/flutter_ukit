import 'package:flutter/material.dart';
import 'screen/animation_screen.dart';
import 'screen/dropdown_screen.dart';
import 'screen/picker_screen.dart';
import 'screen/checkbox_screen.dart';
import 'screen/radio_button_screen.dart';
import 'screen/button_screen.dart';
import 'screen/container_screen.dart';
import 'screen/dialog_screen.dart';
import 'screen/form_screen.dart';
import 'screen/shimmer_screen.dart';
import 'screen/typography_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Kit',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UKit'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Flutter UKit',
              ),
              accountEmail: Text(
                'version 0.0.2',
              ),
              currentAccountPicture: CircleAvatar(
                child: FlutterLogo(size: 42.0),
              ),
            ),
            ExpansionTile(
              title: const Text("Contents"),
              leading: const Icon(Icons.content_copy),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text('Typography'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TypographyScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Container'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContainerScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Shimmer'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ShimmerScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Animation'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AnimationScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: const Text("Components"),
              leading: const Icon(Icons.widgets),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text('Button'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ButtonScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Dialog'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DialogScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: const Text("Forms"),
              leading: const Icon(Icons.layers_outlined),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text('Form Control'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FormScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Dropdown'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DropdownScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Checkbox'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CheckboxScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Radio Button'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RadioButtonScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Picker'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PickerScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Flutter UKit is a large compilation of reusable and easy-to-use UI components, templates, styles, resources and other useful digital assets that can be used to create user interface designs.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                children: const [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.blue),
                    children: [
                      Text(
                        'FEATURE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'STATUS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  // TableRow(children: [
                  //   Column(children: [Text('Javatpoint')]),
                  //   Column(children: [Text('Flutter')]),
                  //   Column(children: [Text('5*')]),
                  // ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
