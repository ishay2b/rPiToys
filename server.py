import socket

HOST = 'localhost'
HOST = '192.168.1.20'

PORT = 9876
ADDR = (HOST,PORT)
BUFSIZE = 4096

serv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

serv.bind(ADDR)
serv.listen(5)

print 'listening ...'

try: 
  while True:
    conn, addr = serv.accept()
    print 'client connected ... ', addr
    #myfile = open('testfile.txt', 'w')

    while True:
      data = conn.recv(BUFSIZE)
      if not data: break
      print data
  #    print 'writing file ....'


    conn.close()
    print 'client disconnected'

except KeyboardInterrupt:
  print "KeyboardInterrupt"
  serv.close()