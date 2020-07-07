import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
} 

class _HomeState extends State<Home> {
  Map data ={};
  
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    Color bg = data['day'] ? Colors.blue: Colors.indigo[800];
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(data['day'] ? 'assets/day.png' : 'assets/night.png' ),
              fit: BoxFit.cover
            )
          ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
        children: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                  'location': result['location'],
                   'flag': result['flag'],
                    'time': result['time'],
                    'day': result['day'],
                };
                print(data);
                });
              },
              icon: Icon(
                Icons.edit_location,
                color: Colors.white
               
              ),
              label: Text(
                'Edit Locatoin',
                style: TextStyle(
                  color: Colors.white
                )),
                
                ),
          SizedBox(height:20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28, 
                    letterSpacing: 2,
                    color: Colors.white
                  ),
                  ),
              ],
          ),        
          SizedBox(height:20),
          Text(
            data['time'],
            style:TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize:66,
              color: Colors.white
            ))

        ],
        
      ),
              )
                    )
      )
    );
  }
}