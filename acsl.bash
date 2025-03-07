# 1. 補完関数の定義
_acsl() {
  local cur prev words cword split
  _init_completion || return

  local defaultIFS=$' \t\n'
  local IFS=$defaultIFS

  case $cword in
  1)
    #if [[ -z $(which dps) ]]; then
    if [[ $(pwd) == $(echo ~) ]]; then
      _filedir -d
    else
      # subcommands
      COMPREPLY=($(compgen -W 'init remove install' -- "$cur"))
    fi
    ;;
  2)
    cd $ACSL_WORK_DIR
    case ${words[1]} in
    init)
      project_list=
      #      IFS=$'\n'
      COMPREPLY=($(compgen -W '' -- "$cur"))
      #     IFS=$defaultIFS
      ;;
    remove | install)
      #    IFS=$'\n'
      COMPREPLY=($(compgen -W '$(cat .acsl/package_list)' -- "$cur"))
      #   IFS=$defaultIFS
      ;;
    esac
    ;;
  3)
    list=$(cat .acsl/ros2_id_list | grep ${words[2]} | awk '{print $2}')
    COMPREPLY=($(compgen -W '$list' -- "$cur"))
    ;;
  esac
}

# 2. 補完関数とコマンドの結びつけ
complete -F _acsl acsl
