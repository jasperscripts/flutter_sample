import 'package:flutter/material.dart';
import 'package:realty/src/house.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'House Finder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null, // null disables the button
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: HouseList(onHouseTap: (house) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> Scaffold( 
                    appBar: AppBar(title: Text('House Details'),),
                    body: HouseDetail(house),
                  )
                )
              )),
      ),
    );
  }
}

class HouseList extends StatelessWidget {
  final void Function(House) onHouseTap;

  const HouseList({super.key, required this.onHouseTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (var house in houses)
          GestureDetector(
            onTap: () => onHouseTap(house),
            child: 
              Container(
                padding:const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: 
                  Row(mainAxisAlignment: MainAxisAlignment.start, 
                    children: [
                      Expanded(flex: 1, child: 
                        Image.network(house.picture)),
                      Expanded(
                        flex: 2,
                        child: Column(children: [
                          Text(
                            house.name,
                          ),
                          Text(
                            house.category,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text('Price',
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold)),
                              Text(house.price),
                            ]),
                          )),
                    ]
                  ),
              ),
          ),
        // ListTile(
        // leading: Image.network(house.picture), title: Text(house.name)),
      ],
    );
  }
}

class HouseDetail extends StatelessWidget {
  final House house;

  const HouseDetail(this.house);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Image.network(house.picture),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: [
                            Expanded(flex: 2, child: Text(house.name),),
                            Expanded(flex: 1, 
                            child: Text(house.category, 
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),),
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Row(
                            children: [
                              Icon(Icons.star,color: Colors.red[500],),
                              Icon(Icons.star,color: Colors.red[500],),
                              Icon(Icons.star,color: Colors.red[500],),
                              Icon(Icons.star,color: Colors.red[500],),
                              Icon(Icons.star,color: Colors.red[500],),
                            ]
                        ),
                      ),
                      Text(house.description, textAlign: TextAlign.justify,),
                    ]
                  ) 
                ),
                Expanded(flex: 1, child: 
                Column(
                  children: [
                    Text("Price", textAlign: TextAlign.center,),
                    Text(house.price, textAlign: TextAlign.center,),
                  ],
                )
                ),
              ]
            )
        ]);
  }
}
