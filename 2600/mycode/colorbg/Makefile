cart = colorbg
include ../cartbuilder.mk

# TARGET = $(cart).bin
# ASMFILES = $(wildcard *.asm)
# MD5 = $(shell cat $(TARGET).md5)

# stella.pro: stella.pro.in $(TARGET).md5
# 	sed s/%%md5%%/$(MD5)/g stella.pro.in > $@

# $(TARGET): $(ASMFILES)
# 	dasm $^ -f3 -v0 -o$@

# $(TARGET).md5: $(TARGET)
# 	md5sum $(TARGET) | cut -d" " -f1 > $@

# all: $(TARGET) $(TARGET).md5 stella.pro

# .PHONY: clean run all

# clean:
# 	rm $(TARGET)

# run:
# 	stella -tv.scanlines 50 -tv.filter 1 -grabmouse 0 $(TARGET)
