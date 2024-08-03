function _cdd()
{
  latest="${COMP_WORDS[$COMP_CWORD]}"
  prev="${COMP_WORDS[$COMP_CWORD - 1]}"
  words=""

  case "${prev}" in
    cdd)
      words="   obsidian
                webdev
                python
                book
                ln
                cpp
                tmux
                nvim
                i3
                go
                toeic
                todo
                robo2"
      ;;
   *)
      ;;
  esac
  COMPREPLY=($(compgen -W "$words" -- $latest))
  return 0
}

fuction cdd() 
{
    case "$1" in
        "python")
            cd "/media/theuser/mount/documents/Code/python"
            ;;

        "book")
            cd "/media/theuser/mount/documents/Documents/Book"
            ;;

        "ln")
            cd "/media/theuser/mount/documents/Documents/Book/LightNovel"
            ;;

        "cpp")
            cd "/media/theuser/mount/documents/Code/Cpp"
            ;;

        "go")
            cd "/media/theuser/mount/documents/Code/go"
            ;;

        "robo2")
            cd "/media/theuser/mount/documents/Code/python/robo2"
            ;;
            
        "obsidian")
            cd "/media/theuser/mount/documents/Obsidian/My Vault"
            ;;

        "nvim")
            cd "/home/theuser/.config/nvim"
            ;;

        "tmux")
            cd "/home/theuser/.config/tmux"
            ;;

        "i3")
            cd "/home/theuser/.config/i3"
            ;;

        "toeic")
            cd "/media/theuser/mount/documents/Documents/TOEIC 33/document"
            ;;

        "todo")
            cd "/media/theuser/mount/documents/Obsidian/My Vault/Daily Note"
            ;;

        "webdev")
            cd "/media/theuser/mount/documents/Code/webDev"
            ;;
        *)
            ;;
    esac
    return 0
}
complete -F _cdd cdd

