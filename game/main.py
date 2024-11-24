import socket
from pythonosc.udp_client import SimpleUDPClient

ip = "127.0.0.1"
port = 57120

client = SimpleUDPClient(ip, port)  # Create client

client.send_message("/s_new", "sine")   # Send float message
# client.send_message("/some/address", [1, 2., "hello"])  # Send message with int, float and string

# UDP_IP = "127.0.0.1"
# UDP_PORT = 57120
# MESSAGE = b"/n_go, 1002, 1, -1, -1, 0"

# print("UDP target IP: %s" % UDP_IP)
# print("UDP target port: %s" % UDP_PORT)
# print("message: %s" % MESSAGE)

# sock = socket.socket(socket.AF_INET, # Internet
#                      socket.SOCK_DGRAM) # UDP
# sock.sendto(MESSAGE, (UDP_IP, UDP_PORT))


# import turtle as t
# from random import random

# for i in range(100):
#     steps = int(random() * 100)
#     angle = int(random() * 360)
#     t.right(angle)
#     t.fd(steps)