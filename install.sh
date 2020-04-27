#!/usr/bin/env bash

script_dir=`dirname $BASH_SOURCE[0]`

for target in $script_dir/.??*; do
  [[ `basename $target` == ".git" ]] && continue
  [[ `basename $target` == ".gitignore" ]] && continue
  [[ `basename $target` == ".backup" ]] && continue

  if [[ -e "$HOME/`basename $target`" ]]; then
    echo $HOME/`basename $target` $script_dir/.backup
  fi

  ln -snf $target $HOME
done
