all: bv

bv: ./src/main.d
	dmd -Dd=./doc -od=./bin -of=./bv ./src/main.d
