TARGETS = \
	brick-data.ttl \


all: ${TARGETS}

clean:
	touch ${TARGETS}
	rm    ${TARGETS}

mrproper: clean
	touch dummy~
	rm        *~


brick-data.ttl: brick-data
	./brick-data brick-data.ttl

