//
//  NetworkController.swift
//  TextTransfer
//
//  Created by conner on 7/21/20.
//  Copyright © 2020 conner. All rights reserved.
//
import Starscream

class NetworkController {
    let timeout = 10.0
    
    func sendTextToServer(_ text: String, _ receiverInfo: ReceiverInfo) {
        guard let host = receiverInfo.ip, let port = receiverInfo.port else { return }
        var request = URLRequest(url: URL(string: "\(host):\(port)")!)
        request.timeoutInterval = timeout
        let socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
        socket.write(string: text)
    }
}

extension NetworkController: WebSocketDelegate {
    func didReceive(event: WebSocketEvent, client: WebSocket) {}
}
