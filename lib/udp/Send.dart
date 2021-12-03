import 'dart:io';

import 'package:udp/udp.dart';


main() async {

  // creates a UDP instance and binds it to the first available network
  // interface on port 65000.
  var sender = await UDP.bind(Endpoint.any(port: Port(7777)));

  // send a simple string to a broadcast endpoint on port 65001.
  var dataLength = await sender.send(
      "Hello World!".codeUnits, Endpoint.multicast(InternetAddress("192.168.188.255"), port: Port(6666)));

  stdout.write("${dataLength} bytes sent.");
  // close the UDP instances and their sockets.
  sender.close();

}