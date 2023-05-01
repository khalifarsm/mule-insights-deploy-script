import os
from http.server import BaseHTTPRequestHandler, HTTPServer

class RequestHandler(BaseHTTPRequestHandler):
    def _send_response(self, message):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(bytes(message, "utf8"))

    def do_POST(self):
        if self.path == "/docker/refresh":
            command = "docker pull khalifarsm/analyser"
            output1 = os.popen(command).read()
            print(output1)
            command = "docker stack deploy -c /root/mule-insights-deploy-script/swarm/docker-compose.yml muleinsights"
            output = os.popen(command).read()
            print(output)
            command = "docker system prune -af"
            output3 = os.popen(command).read()
            print(output3)
            command = "doctl apps create-deployment $APPID"
            output2 = os.popen(command).read()
            print(output2)
            self._send_response(output)
        else:
            self._send_response("Invalid path")

httpd = HTTPServer(("", 8085), RequestHandler)
httpd.serve_forever()
