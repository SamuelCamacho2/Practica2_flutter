
import 'package:flutter/material.dart';
import 'package:practica2/counter.dart';
import 'package:practica2/image_slider.dart';

void main() {
  runApp(const FirstScreen());
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FirstScreen();
  }
}

class _FirstScreen extends State<FirstScreen> {
  bool _isFavorited = true;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 187, 222, 251),
          leading: Row(children: [
            const SizedBox(
              width: 5.0,
            ),
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ]),
          // actions: [
          //   IconButton(
          //     icon: const Icon(
          //       Icons.check_box_outlined,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {},
          //   ),
          //   const SizedBox(
          //     width: 20.0,
          //   )
          // ],
          actions: [
            PopupMenuButton(
              icon: const CircleAvatar(
                backgroundImage: AssetImage('images/usuario.png')
              ),
              onSelected: (value) {
                
              },
              itemBuilder: ( BuildContext context) => [
                const PopupMenuItem(child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Informacion'),
                )),
                const PopupMenuItem(child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Reservaciones'),
                )),
                const PopupMenuItem(child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Configuraciones'),
                )),
                const PopupMenuItem(child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Salir'),
                )),
              ]
              )
          ],
          
        ),
        
        backgroundColor: Colors.white,

        body: ListView(
          padding: const EdgeInsets.only(top: 5.0),
          children: <Widget>[
            const Column(
              children: <Widget>[CarouselWithIndicatorDemo()],
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 187, 222, 251),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  )),
              height: 700.0,
              width: 500.0,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text('Amomoxtli',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text('\$2,800 MX por noche'),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const CounterDesign(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        'Amomoxtli nació de un deseo de corazón y la casa original es la prueba. '
                        'Damos la bienvenida a nuestros huéspedes como en casa, '
                        'la casa es el punto de encuentro y un lugar ideal para tomar una copa'
                        'y disfrutar de este hotel en Tepoztlán.',
                        style: TextStyle(letterSpacing: 2.0, fontSize: 15.0),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: <Widget>[
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: const BorderSide(color: Colors.amber),
                            ),
                            height: 70.0,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 187, 222, 251),
                                elevation: 0.0,
                              ),
                              icon: Icon(
                                _isFavorited
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color: Colors.black,
                              ),
                              label: const Text('Favorito', style: TextStyle(color: Colors.black),),
                              onPressed: _toggleFavorite,
                            ),
                          ),
                          const SizedBox(
                            width: 180.0,
                          ),
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 70.0,
                            minWidth: 260.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                primary: Colors.black,
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Rentar',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                      ),
                      const CommentBox()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Text(
          'Deja un comentario',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10,),
        Container(
          height: 100.0,
          child: const TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Escribe tu comentario aqui',
              border:  OutlineInputBorder()
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(onPressed:() {
          
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(1.0, 30.0))
        ), 
        child:const Text('Publicar'))
      ],
    );
  }
}