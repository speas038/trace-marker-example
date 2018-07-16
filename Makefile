CFLAGS += -DENABLE_TRACING

# Uncomming the following if you would like to bypass the write function in
# your C library. This only works on x86_64.

#CFLAGS += -DUSE_DIRECT_WRITE

all: trace-marker-example

trace-marker-example: trace-marker-example.c libtest-library.so
	$(CC) -o $@ trace-marker-example.c libtest-library.so

libtest-library.so: test-library.c trace-marker.c
	$(CC) -shared $(CFLAGS) -o libtest-library.so test-library.c trace-marker.c

clean:
	@rm -fr *.o trace-marker-example libtest-library.so
