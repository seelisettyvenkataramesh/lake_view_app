import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Lake View and Sun Rise',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text('Mydukur Krishanapuram')
            ],
          ),
          FavWidget()
        ],
      ),
    );

    Widget buttonSection = SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
          _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Colors.blue, Icons.share, 'SHARE')
        ],
      ),
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(30),
      child: const Text(
              'Seated in the glorious North Cascades, right next'
              ' to Mt. Baker, Picture Lake is aptly named. The short and very'
              ' accessible hike surrounding it is flush with wildflowers, a wide'
              ' variety of trees, and views of Mount Shuksan,'
              ' each adorning the sparkling, photogenic water.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lake View App'),
        ),
        body: ListView(
          children: [
            Image.asset(
              "images/lake.png",
              width: 600,
              height: 250,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: color),
          ),
        ),
      ],
    );
  }
}


class FavWidget extends StatefulWidget {
  @override
  State<FavWidget> createState() => _FavWidgetState ();

}

class _FavWidgetState extends State<FavWidget> {

  bool _isFav = true;
  int _isCount = 777;

void  _toggleFav(){
  setState(() {
    if(_isFav){
      _isCount -= 1;
      _isFav = false;
    }else{
      _isCount += 1;
      _isFav = true;
    }
  });
}








  @override
  Widget build(BuildContext context) {
 return Row(
   mainAxisSize: MainAxisSize.max,
   children: [
     Container(
       child: IconButton(
         alignment: Alignment.centerLeft,
         onPressed: _toggleFav,
         icon: (_isFav
             ? Icon(Icons.star)
             : Icon(Icons.star_border_outlined)),
         color: Colors.purple,
       ),
     ),
     SizedBox(
       child: SizedBox(
         child: Text('$_isCount'),
       ),
     ),
   ],
 );
  }


}


