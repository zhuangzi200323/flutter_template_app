import 'package:udp/udp.dart';


main() async {

  // creates a new UDP instance and binds it to the local address and the port
  // 65002.
  var receiver = await UDP.bind(Endpoint.any(port: Port(6666)));

  // receiving\listening
  await receiver.asStream(timeout: Duration(seconds: 20)).listen((datagram) {
    var str = String.fromCharCodes(datagram!.data);
    print(str);
  });

  // close the UDP instances and their sockets.
  receiver.close();
}