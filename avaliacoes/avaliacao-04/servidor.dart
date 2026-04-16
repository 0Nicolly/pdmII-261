import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  final server = await ServerSocket.bind(InternetAddress.anyIPv4, 4040);
  print('Servidor rodando em ${server.address.address}:${server.port}');

  await for (Socket client in server) {
    print('Cliente conectado: ${client.remoteAddress.address}');

    client.listen(
      (data) {
        String mensagem = utf8.decode(data).trim();
        print('Temperatura recebida: $mensagem °C');
      },
      onError: (error) {
        print('Erro: $error');
        client.close();
      },
      onDone: () {
        print('Cliente desconectado');
        client.close();
      },
    );
  }
}