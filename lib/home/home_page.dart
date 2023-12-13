import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mao_namassa/home/home_page2.dart';

class HomePage extends StatelessWidget {
  const HomePage ({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Teste Câmera HRV',
            style: TextStyle(fontFamily: 'Montserrat'),
            ),
          backgroundColor: Colors.orange[700],
          actions: [
            IconButton(
              onPressed:(){} , 
              icon: Icon(Icons.add_link_outlined)
              )
          ],
        ),
        drawer: Drawer(
          child: Center( child: Text('Menu Aberto')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraScreen()),
                );
                  // Ação a ser executada quando o botão for pressionado
                  print('Botão pressionado!');
                },
                child: Text('Iniciar Câmera'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        settings: RouteSettings(name: 'home_page2'),
                        builder: (context) => HomePage2()
                        ),
                    );
                  },
                  child: Text('Page 2 via page')),
                    ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage2.routeName);
               },
                  child: Text('Page 2 via Named'))
            ],
          ),
        ),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> { 
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Obtenha a lista de câmeras disponíveis
    availableCameras().then((cameras) {
      // Use a primeira câmera disponível
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
        enableAudio: false,
      );

      // Inicialize o controlador da câmera
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Abrir Câmera')),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Se o controlador da câmera foi inicializado, exiba a visualização da câmera
            return CameraPreview(_controller);
          } else {
            // Caso contrário, exiba um indicador de carregamento
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Aguarde a inicialização do controlador da câmera
          await _initializeControllerFuture;

          // Faça algo ao pressionar o botão de captura
          XFile picture = await _controller.takePicture();

          // Você pode lidar com a imagem (picture) como necessário
          print('Caminho da imagem: ${picture.path}');
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}