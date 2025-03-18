import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _items = List.generate(
        10,
        (index) => Container(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text('Title $index'),
                subtitle: Text('Body $index'),
              ),
            ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Sales'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: ExpansionPanelList(
          materialGapSize: 2,
          children: _items
              .map((e) => ExpansionPanelRadio(
                    value: e,
                    headerBuilder: (context, isExpanded) => ListTile(
                      title: Text('Title'),
                    ),
                    body: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
