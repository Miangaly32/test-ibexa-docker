#!/bin/bash

_targetGroup="trainer students"
_trainingType="advanced developer"


_init-training_complete()
{
  local cur prev

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  if [ $COMP_CWORD -eq 1 ]; then

    COMPREPLY=( $(compgen -W "trainer students" -- $cur) )
  elif [ $COMP_CWORD -eq 2 ]; then
    COMPREPLY=( $(compgen -W "advanced developer" -- $cur) )
  fi

  return 0
}

complete -F _init-training_complete ./init-training.sh