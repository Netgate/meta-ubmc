CC=arm-poky-linux-gnueabi-gcc

nwsd:	lm76.c
		$(CC) -o lm76 lm76.c -mfloat-abi=hard

clean:
		rm lm76.c

install:
	@install -D lm76 ${DESTDIR}
