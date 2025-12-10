import 'package:flutter/material.dart';

class ChoiSwitchListTile extends StatefulWidget {

  const ChoiSwitchListTile({super.key});

  @override
  State<ChoiSwitchListTile> createState() => _ChoiSwitchListTileState();
}

class _ChoiSwitchListTileState extends State<ChoiSwitchListTile> {
  bool _value = false;
  bool _value2 = false;
  bool _value3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                 SwitchListTile(
                   thumbColor: WidgetStateProperty.all(Colors.orange),
                   tileColor: Colors.red,
                activeThumbColor: Colors.blue,
                activeTrackColor: Colors.red,
                title: Text('플러터'),
                subtitle: Text('크로스 플랫폼'),
                value: _value, onChanged: (bool value){
              setState(() {
                _value = value;
              });
            }),
          SwitchListTile(
              tileColor: Colors.orange,
            secondary: _value2 ? Icon(Icons.light_mode_rounded) : Icon(Icons.light_mode_outlined),
              activeThumbColor: Colors.green,
              activeTrackColor: Colors.yellow,
              title: Text('불을 킬건가요'),
              subtitle: Text('불을 킬거면 누르세요'),
              value: _value2,
              onChanged: (bool value){
            setState(() {
              Icon(Icons.light_mode);
              _value2 = value;
            });
          }),
        SwitchListTile(
          activeThumbImage: AssetImage('assets/img/pudding_icon.png'),
            tileColor: Colors.yellow,
            activeThumbColor: Colors.pink,
            activeTrackColor: Colors.deepPurple,
            title: Text('파블로'),
            subtitle: Text('대마고 동아리'),
            value: _value3, onChanged: (bool value) {
          setState(() {
            _value3 = value;
          });
        }),
        ],
      ),
    );
  }
}
