import 'package:flutter/material.dart';
import 'package:localization_example/models/sample.dart';
import 'package:localization_example/models/student.dart';
import 'package:localization_example/views/settings_view.dart';

//import 'sample_item.dart';
import 'sample_item_details_view.dart';

List<Student> sampleItem=const [
  Student('s1', 'John','IX'),
  Student('s2', 'Json', 'X'),
  Student('s3', 'Maria','XI'),
];


/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    Key? key,
    this.items =const [
      SampleItem(1), SampleItem(2), SampleItem(3),

    ]
  }) : super(key: key);

  static const routeName = '/';

  final List<Student> students;
  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          final student = students[index];

          return ListTile(
              title: Text('Student ID: ${student.id}'),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                  arguments: student.name,
                );
              });
        },
      ),
    );
  }
}