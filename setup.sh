#!/usr/bin/env bash

for f in $(ls -d z*); do ln -sf $(pwd)/$f $HOME/.$f; done

