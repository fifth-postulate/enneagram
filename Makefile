.PHONY: clean all

IMAGE_SOURCE_DIRECTORY=src
IMAGE_TARGET_DIRECTORY=docs/image
IMAGE_SOURCES=$(shell find ${IMAGE_SOURCE_DIRECTORY} -name '*.ps')
IMAGE_TARGETS=$(addprefix ${IMAGE_TARGET_DIRECTORY}/,$(addsuffix .png,$(basename $(notdir ${IMAGE_SOURCES}))))

all: ${IMAGE_TARGETS}
	@echo "finished building png images"

${IMAGE_TARGET_DIRECTORY}/%.png: ${IMAGE_SOURCE_DIRECTORY}/%.ps
	gs -sDEVICE=png256 -sPAPERSIZE=a4 -o $@ $<

clean:
	rm -f ${IMAGE_TARGETS}
