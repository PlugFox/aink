.PHONY: help

# Script description and usage through `make` or `make help` commands
help:
	@echo "Let's make something good"
	@fvm flutter --version

-include tool/makefile/*.mk
