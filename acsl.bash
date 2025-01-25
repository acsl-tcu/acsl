# 1. 補完関数の定義
_acsl() {
  local cur prev words cword split
  _init_completion || return

  local defaultIFS=$' \t\n'
  local IFS=$defaultIFS

  case $cword in
  1)
    # subcommands
    COMPREPLY=($(compgen -W 'init remove install' -- "$cur"))
    ;;
  *)
    case ${words[1]} in
    init)
      #
      IFS=$'\n'
      COMPREPLY=($(compgen -W 'PROJECT_LIST' -- "$cur"))
      IFS=$defaultIFS
      ;;
    remove||install)
      IFS=$'\n'
      COMPREPLY=($(compgen -W 'PACKAGE_LIST' -- "$cur"))
      IFS=$defaultIFS
      ;;
    esac
    ;;
  esac
}

# 2. 補完関数とコマンドの結びつけ
complete -F _note note
