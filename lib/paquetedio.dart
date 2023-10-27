import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dio _dio = Dio(); // Instancia de Dio para realizar solicitudes HTTP.

  String _responseData = ""; // Almacenar los datos de la respuesta.

  // Función para realizar la solicitud HTTP GET a mastermky.com.
  void fetchData() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/');
      setState(() {
        _responseData = response.data.toString();
      });
    } catch (e) {
      setState(() {
        _responseData = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo de Dio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Realizar Solicitud HTTP '),
            ),
            SizedBox(height: 20),
            Text('Respuesta de la solicitud:'),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _responseData,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
