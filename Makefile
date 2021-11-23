CONVERT_OPTS=-density 250x250
bpms=60 70 80 90 100 108 110 120 130 140 150 160
metronomes=$(addprefix metronome-,$(bpms))
dirs=$(addprefix build/,$(addsuffix /,$(metronomes)))
gifs=$(addsuffix .gif,$(metronomes))

default: all

$(bpms):

$(dirs): build/metronome-%/: %
	mkdir -p $@
	sed -e "s/{{bpm}}/$</g" metronome.asy | asy -o $@ -

$(gifs): %.gif: build/%/
	convert $(CONVERT_OPTS) -delay 2 -loop 0 -dispose Background $<*.eps -transparent white $@

all: $(gifs)

clean:
	rm -rf build
	rm -f *.gif
