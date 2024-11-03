#!/usr/bin/env bash

if [[ $(git ls-files -m) ]]; then
  echo "There are unstaged files in GIT. Run this script may change in-place."

  while true; do
    read -p "Do you want to continue? (y/n):" yn
    case $yn in
    [Yy]*)
      break
      ;;
    [Nn]*) exit ;;
    *) echo "please answer y or n." ;;
    esac
  done
fi

find ./exercises \
  -type f -regex ".*\.\(h\|c\|hpp\|cpp\|hxx\|cxx\|h\+\+|c\+\+\|cu\)" \
  -not -path "./build" |
  xargs clang-format-14 -i

find . -type f -name "*.sh" \
  -not -path "./build" |
  xargs shfmt -i 2 -w
