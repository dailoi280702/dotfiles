#!/bin/bash

darwin-rebuild switch --flake ".#$(uname -m)-darwin" --impure
