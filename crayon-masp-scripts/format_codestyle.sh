# !/bin/zsh

WORK_DIR=$(
  cd $(dirname $0) &&
    cd .. &&
    pwd
)

if [ ! -d "$WORK_DIR" ]; then
  echo "search src failed."
  exit -1
fi
exist_and_import() {
  if [ -f $1 ]; then
    source $1
  fi
}


python3 $WORK_DIR/src/otrs/ament/ament_lint/ament_uncrustify/ament_uncrustify/main.py --reformat $@