import nmap
import socket
import deco as deco64

if __name__ == "__main__":
    nmScan = nmap.PortScanner()
    print("Loading.....")
    scanip = nmScan.scan(arguments='-sP 192.168.0.155/24')
    localip = socket.gethostbyname(socket.gethostname())
    # 192.168.0.155
    document = "./reporte.txt"
    with open(document, 'w', errors="ignore") as f:
        f.write("IP: " + localip)
        f.write("IP SCAN NMAP")
        f.write(str(scanip))
    print("Coding to B64 ................")
    deco64.save_file('reporte.b64', deco64.encode_file('reporte.txt'))
    print("Done")
