#!/bin/bash

shopt -s expand_aliases
source ~/.bash_aliases

terraform fmt -recursive
