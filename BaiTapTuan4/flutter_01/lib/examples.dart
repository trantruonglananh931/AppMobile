import 'package:flutter/material.dart';
import 'baitap2.dart';
class CardExample extends StatelessWidget {
  const CardExample({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card Ex'),
        ),
        body: Center(
          child: Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('This is a card'),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleAvatarExample extends StatelessWidget {
  const CircleAvatarExample({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CircleAvatar Ex'),
        ),
        body: Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('http://picsum.photos/200/200'),
          ),
        ),
      ),
    );
  }
}


class BorderExample extends StatelessWidget {
  const BorderExample({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CircleAvatar Ex'),
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 3,
              )
            ),
            child: const Center(
              child: Text('Border ex'),
            ),
          ),
        ),
      ),
    );
  }
}

class EdgeInsertsExample extends StatelessWidget {
  const EdgeInsertsExample({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EdgeInserts Ex'),
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.all(16.0),
            color: Colors.red,
            child: Text('Padding Text',
              style: TextStyle(color: Colors.blue),
            ),

          ),
        ),
      ),
    );
  }
}


class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() => _BottomNavigationBarExampleState();
}


class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  // Danh sách các widget để hiển thị tương ứng với từng tab
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const CardExample(),
    const CircleAvatar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Cập nhật chỉ số tab hiện tại
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Navigation Example'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex), // Hiển thị nội dung tương ứng với tab
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, // Đánh dấu tab hiện tại
          onTap: _onItemTapped,  // Xử lý sự kiện khi nhấn vào tab
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}