import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Page'),
      ),
      body: RecordListScreen(),
    );
  }
}

class Record {
  final String date;
  final String userInput;
  final double salesAmount;
  final double lossAmount;
  final double feeAmount;

  Record({
    required this.date,
    required this.userInput,
    required this.salesAmount,
    required this.lossAmount,
    required this.feeAmount,
  });
}

class RecordListScreen extends StatefulWidget {
  @override
  _RecordListScreenState createState() => _RecordListScreenState();
}

class _RecordListScreenState extends State<RecordListScreen> {
  List<Record> records = [];
  bool showAll = false;

  @override
  void initState() {
    super.initState();
    _fetchRecords();
  }

  // Mock function to simulate fetching records (this should be replaced by actual API call)
  void _fetchRecords() {
    // Simulating fetching data
    List<Record> newRecords = List.generate(
      15,
      (index) => Record(
        date: '2025-03-${index + 1}',
        userInput: 'User input $index',
        salesAmount: (index + 1) * 100.0,
        lossAmount: (index + 1) * 20.0,
        feeAmount: (index + 1) * 5.0,
      ),
    );

    setState(() {
      records = newRecords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Record List')),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              _fetchRecords(); // Call API to get new data on reaching the bottom
            }
            return false;
          },
          child: ListView.builder(
            itemCount: showAll ? records.length : 10,
            itemBuilder: (context, index) {
              final record = records[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    // First Column
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date: ${record.date}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('User Input: ${record.userInput}',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    // Second Column
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sales: \$${record.salesAmount}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('Loss: \$${record.lossAmount}',
                              style: TextStyle(fontSize: 12)),
                          SizedBox(height: 8),
                          Text('Fee: \$${record.feeAmount}',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: records.length > 10 && !showAll
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // setState(() {
                  //   showAll = true; // Show all records when button is pressed
                  // });
                },
                child: Text('Show All'),
              ),
            )
          : null,
    );
  }
}
