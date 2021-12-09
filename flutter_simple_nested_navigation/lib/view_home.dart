import 'package:flutter/material.dart';

class ViewHome extends StatelessWidget {
  final String pathSource;
  final Function(String pathName) pathListener;

  const ViewHome({
    Key? key,
    required this.pathSource,
    required this.pathListener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Simple Routing'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Row(
      children: [
        _menuList(),
        _board(),
      ],
    );
  }

  Widget _menuList() {
    return Container(
      width: 250,
      height: double.infinity,
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _navigationHeader(),
          _menuItem(title: 'Button 0', path: 'button_0'),
          _menuItem(title: 'Button 1', path: 'button_1'),
          _menuItem(title: 'Button 2', path: 'button_2'),
        ],
      ),
    );
  }

  Widget _navigationHeader() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.green,
    );
  }

  Widget _menuItem({required String title, required String path}) {
    return InkWell(
      onTap: () => pathListener.call(path),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 50,
        ),
        child: Text(title),
      ),
    );
  }

  Widget _board() {
    String _title;
    Color _backgroundColor;
    switch (pathSource) {
      case 'button_0':
        {
          _title = 'Button 0';
          _backgroundColor = Colors.red;
        }
        break;
      case 'button_1':
        {
          _title = 'Button 1';
          _backgroundColor = Colors.yellow;
        }
        break;
      case 'button_2':
        {
          _title = 'Button 2';
          _backgroundColor = Colors.green;
        }
        break;

      default:
        {
          _title = 'Initial screen';
          _backgroundColor = Colors.amber;
        }
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
          horizontal: 100,
        ),
        child: Card(
          color: _backgroundColor,
          child: Center(
            child: Text(
              _title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
