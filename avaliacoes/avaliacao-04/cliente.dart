import 'dart:io';
import 'dart:async';
import 'dart:math';

Future<void> main() async {
  final socket = await Socket.connect('127.0.0.1', 4040);
  print('Conectado ao servidor');

  final random = Random();

  Timer.periodic(Duration(seconds: 10), (timer) {
    double temperatura = 20 + random.nextDouble() * 15; 
    String mensagem = temperatura.toStringAsFixed(2);

    socket.write(mensagem);
    print('Enviado: $mensagem °C');
  });

  socket.done.then((_) {
    print('Conexão encerrada');
    socket.close();
  });
}