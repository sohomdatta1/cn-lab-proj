CC=clang

all: sniffer

logger.o: logger.c
	$(CC) -Wall -c logger.c

process_packet.o: process_packet.c
	$(CC) -Wall -c process_packet.c

sniffer: main.c logger.o process_packet.o
	$(CC) main.c logger.o process_packet.o -ggdb -o sniffer
	sudo chown root sniffer
	sudo chmod +s sniffer

clean:
	rm -f *.o sniffer