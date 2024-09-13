#!/bin/bash

cd /etc/keyd

if [ -f "./status-normal.txt" ]; then
  cp -f ./a-leetcode-mode.conf ./a-default.conf
  mv ./status-normal.txt ./status-leetcode.txt
elif [ -f "./status-leetcode.txt" ]; then
  cp -f ./a-normal-mode.conf ./a-default.conf
  mv ./status-leetcode.txt ./status-normal.txt
else
  echo "Error!!!"
fi


sudo keyd reload
