#!/bin/bash

dot -Tpng input.txt > out1.png
dot -Tpng dot.txt -o out2.png
