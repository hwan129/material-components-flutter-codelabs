import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<bool> _filterSelections = [
    false,
    false,
    false
  ]; // No Kids Zone, Pet-Friendly, Free breakfast
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  final DateFormat _dateFormat = DateFormat('yyyy.MM.dd (E)');
  bool _isExpanded = false; // expanded 상태

  void _showDialog() {
    String filters = '';
    if (_filterSelections[0]) filters += 'No Kids Zone\n';
    if (_filterSelections[1]) filters += 'Pet-Friendly\n';
    if (_filterSelections[2]) filters += 'Free breakfast\n';

    String checkIn = _checkInDate != null
        ? _dateFormat.format(_checkInDate!)
        : 'Not selected';
    String checkOut = _checkOutDate != null
        ? _dateFormat.format(_checkOutDate!)
        : 'Not selected';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Please check\nyour choice :)',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.filter_list_outlined,
                    color: Colors.blue[300],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('$filters'),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.blue[300],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'IN\t\t\t$checkIn',
                  ),
                ],
              )
            ],
          ),
          actions: [
            TextButton(
              child: Text('CANCEL'),
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isCheckIn
          ? (_checkInDate ?? DateTime.now())
          : (_checkOutDate ?? DateTime.now()),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = picked;
        } else {
          _checkOutDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search'),
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ExpansionPanelList(
                    elevation: 1,
                    expandedHeaderPadding: EdgeInsets.all(0),
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                              title: Center(
                            child: Text('select filters'),
                          ));
                        },
                        body: Column(
                          children: [
                            CheckboxListTile(
                              title: Text('No Kids Zone'),
                              value: _filterSelections[0],
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {
                                setState(() {
                                  _filterSelections[0] = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text('Pet-Friendly'),
                              value: _filterSelections[1],
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {
                                setState(() {
                                  _filterSelections[1] = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text('Free breakfast'),
                              value: _filterSelections[2],
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {
                                setState(() {
                                  _filterSelections[2] = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        isExpanded: _isExpanded,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                          children: [
                            Text(
                              'Check-in:',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold), // 원하는 스타일 설정
                            ),
                            Text(
                              _checkInDate != null
                                  ? _dateFormat.format(_checkInDate!)
                                  : 'Not selected',
                              style: TextStyle(fontSize: 14), // 원하는 스타일 설정
                            ),
                          ],
                        ),
                        trailing: TextButton(
                          onPressed: () => _selectDate(context, true),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Text(
                            'Select Date',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: _showDialog,
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                ),
              ),
            )
          ],
        ));
  }
}
