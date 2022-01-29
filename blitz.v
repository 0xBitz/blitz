import net
import os
import time

pub fn clear(){
	$if windows{
		os.system('cls')
	} $else {
		os.system('clear')
	}
}

pub fn port_probe(ip string){
	clear()
	print(' [ Scanning The Ip Of -> ${ip} For All The 65,535 Ports \n')
	time.sleep(5 * time.second)
	for port := 0; port < 65535; port++ {
		mut conn := net.dial_tcp('${ip}:${port}') or {
			print(' [ The Ip -> ${ip} Has The Port -> ${port} Closed ] \n')
			continue
		}
		print(' [ The Ip -> ${ip} Has The Port -> ${port} Open ] \n')
		conn.close() or { return }
	}
}

pub fn main(){
	clear()
	print("▄▄▄▄· ▄▄▌  ▪  ▄▄▄▄▄·▄▄▄▄• \n")
	print("▐█ ▀█▪██•  ██ •██  ▪▀·.█▌ \n")
	print("▐█▀▀█▄██▪  ▐█· ▐█.▪▄█▀▀▀• \n")
	print("██▄▪▐█▐█▌▐▌▐█▌ ▐█▌·█▌▪▄█▀ \n")
	print("·▀▀▀▀ .▀▀▀ ▀▀▀ ▀▀▀ ·▀▀▀ • \n")
	print("[ Blitz Port Scanner ] -> [ Github -> https://github.com/hackeroni1337/ ] \n")
	ip := os.input('[ Enter Your Ip To Scan ] -> ')
	port_probe(ip)
}
