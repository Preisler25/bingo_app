import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static io.Socket _socket = io.io('http://localhost:3000', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });

  static void connectToSocket() {
    _socket = _socket.connect();

    _socket.onConnect((_) {
      print('Connected to the socket server');
    });

    _socket.onDisconnect((_) {
      print('Disconnected from the socket server');
    });
  }

  static void createListener(String event, dynamic Function(dynamic) func) {
    _socket.on(event, func);
  }
}
