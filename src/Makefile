TARGETS = \
	results.json \



all: ${TARGETS}

clean:
	touch ${TARGETS}
	rm    ${TARGETS}

mrproper: clean
	touch dummy~ queries/dummy~
	rm        *~ queries/*~



brick-data.ttl: brick-data
	./brick-data brick-data.ttl

buildings:
	mkdir buildings

buildings/gth.ttl: inject-ou44 brick-data.ttl
	./inject-ou44 ../../gth-brick/src/gth.ttl buildings/gth.ttl complexity_gth.txt

buildings/ou44.ttl: inject-ou44 brick-data.ttl
	./inject-ou44 ../../ou44-brick/src/sdu_ou44_brick.unpopulated.ttl buildings/ou44.ttl complexity_ou44.txt

results.json: execute-test buildings/gth.ttl buildings/ou44.ttl queries/*
	./execute-test

