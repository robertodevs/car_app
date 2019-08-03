import 'package:car_app/car_card.dart';
import 'package:car_app/color_button.dart';
import 'package:car_app/radio_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<RadioModel> filterOptions = new List<RadioModel>();

  List<ColorModel> colorOptions = new List<ColorModel>();

  @override
  void initState() {
    super.initState();
    filterOptions.add(new RadioModel(true, 'Hatchback', 'Hatchback', 'assets/car1'));
    filterOptions.add(new RadioModel(false, 'Sedan', 'Sedan', 'assets/car2'));
    filterOptions.add(new RadioModel(false, 'SUV', 'SUV', 'assets/car3'));
    filterOptions.add(new RadioModel(false, 'Sports', 'Sports', 'assets/car4'));

    // Initializing color
    colorOptions.add(new ColorModel(true, Color(0xff2e73eb) , 'assets/color1.png'));
    colorOptions.add(new ColorModel(false, Color(0xffd5d6d8) , 'assets/color2.png'));
    colorOptions.add(new ColorModel(false, Color(0xffe02020) , 'assets/color3.png'));
    colorOptions.add(new ColorModel(false, Color(0xffffffff) , 'assets/color4.png'));
    colorOptions.add(new ColorModel(false, Color(0xfffa6400) , 'assets/color5.png'));
    colorOptions.add(new ColorModel(false, Colors.black , 'assets/color6.png'));

  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: Stack(
        children: <Widget>[
          new Container(
              width: 375,
              height: 812,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text("Car Dekho",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xffffffff),
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0,

                          )
                      ),
                      SizedBox(width: 100,),

                      // Avatar profile
                      new Container(
                          width: 32,
                          height: 32,
                          decoration: new BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/image.png')),
                            boxShadow: [BoxShadow(
                                color: Color(0x28000000),
                                offset: Offset(0,2),
                                blurRadius: 7,
                                spreadRadius: 0

                            ) ],

                          )
                      )
                    ],
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(31),
                  gradient: LinearGradient(colors: [
                    Color(0xff3c80f7),
                    Color(0xff1058d1) ],
                      stops: [
                        0,
                        1
                      ]
                  )
              )
          ),
          Positioned(
            top: 100,
            child: new Container(
                width: 375,
                height: 729,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new Container(
                          width: 343,
                          height: 44,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  enabledBorder: InputBorder.none,
                                  labelText: 'get your car details here',
                                  labelStyle: TextStyle(
                                    fontFamily: 'AlegreyaSansSC',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,

                                  ),
                                  suffix: FlatButton(
                                      onPressed: () {},
                                      child: Icon(Icons.filter_list)
                                  )
                              ),
                            ),
                          ),
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(
                                color: Color(0x16000000),
                                offset: Offset(0,2),
                                blurRadius: 4,
                                spreadRadius: 0

                            ) ],

                          )
                      ),
                    ),

                    SizedBox(height: 20,),
                    // Options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: filterOptions.map((document){
                        return new InkWell(
                          onTap: (){
                            setState(() {
                              filterOptions.forEach((element) => element.isSelected = false);
                              document.isSelected = true;
                            });
                          },
                          child: new RadioItem(document)
                        );

                      }).toList()
                    ),

                    // Color Options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: colorOptions.map((document){
                          return new InkWell(
                              onTap: (){
                                setState(() {
                                  colorOptions.forEach((element) => element.isSelected = false);
                                  document.isSelected = true;
                                });
                              },
                              child: new ColorItem(document)
                          );

                        }).toList()
                    ),

                    SizedBox(height: 10,),


                    Flexible(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[

                          CarCard('Maruti Swift', 'Rs.4.99 - 8.85 Lakh*', 'assets/carlist1.png', 'assets/background_right.png', true,),
                          CarCard('Maruti Swift', 'Rs.4.99 - 8.85 Lakh*', 'assets/carlist2.png', 'assets/background_left.png', false,),
                          CarCard('Maruti Swift', 'Rs.4.99 - 8.85 Lakh*', 'assets/carlist3.png', 'assets/background_right.png', true, ),
                          CarCard('Maruti Swift', 'Rs.4.99 - 8.85 Lakh*', 'assets/carlist4.png', 'assets/background_left.png', false,)




                        ],
                      ),
                    )


                  ],
                ),
                decoration: new BoxDecoration(
                    color: Color(0xffeff5ff),
                    borderRadius: BorderRadius.circular(32)
                )
            ),
          )

        ],
      ),
      floatingActionButton: new Container(
          width: 52,
          height: 52,
          child: Center(
            child: Image.asset('assets/phone.png'),
          ),
          decoration: new BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(9.846153846153847)
          )
      ),
    );
  }
}
