import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _page1(),
          _page2(context),
        ],
      ),
    );
  }

  _page1() {
    return Stack(
      children: <Widget>[_bgColor(), _bgImg(), _textWidgets()],
    );
  }

  _page2(BuildContext context) {
    return Stack(
      children: <Widget>[_bgColor(), _button(context)],
    );
  }

  Widget _bgColor() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1),
    );
  }

  Widget _bgImg() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/bg.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textWidgets() {
    final textStyle = TextStyle(color: Colors.white, fontSize: 50);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('11º', style: textStyle),
          Text('Friday', style: textStyle),
          Expanded(
            child: Container(),
          ),
          Icon(Icons.keyboard_arrow_down, size: 70, color: Colors.white)
        ],
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Center(
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        shape: StadiumBorder(),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Text(
              'Welcome',
              style: TextStyle(fontSize: 20),
            )),
        onPressed: () {
          Navigator.pushNamed(context, 'menu');
        },
      ),
    );
  }
}
