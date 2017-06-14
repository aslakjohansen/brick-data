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

buildings/gth.ttl: inject-ou44 brick-data.ttl buildings
	./inject-ou44 ../../GroundTruth/building_instances/gtc_brick.ttl buildings/gth.ttl

buildings/ou44.ttl: inject-ou44 brick-data.ttl buildings
	./inject-ou44 ../../ou44-brick/src/sdu_ou44_brick.ttl buildings/ou44.ttl

results.json: execute-test buildings/gth.ttl buildings/ou44.ttl
	./execute-test

