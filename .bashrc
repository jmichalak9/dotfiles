function extract() {
    if [ $# -ne 1 ]; then
        echo "Usage: $FUNCNAME filename"
    fi
    
    filename=$1
    if [ -f $filename ]; then
        case $filename in
            *.tar.xz)   tar xvfJ $filename                          ;;
            *.tar.gz)   tar --gzip -xvf $filename                   ;;
            *.tar.bz2)  tar --bzip2 -xvf $filename                  ;;
            *.tar)      tar -xvf $filename                          ;;
            *.tgz)      tar --gzip -xvf $filename                   ;;
            *.tbz2)     tar --bzip2 -xvf $filename                  ;;
            *.bz2)      bunzip2 $filename                           ;;
            *.7z)       7za x $filename                             ;;
            *.Z)        uncompress --keep $filename                 ;;
            *.zip)      unzip $filename -d ${filename%.*}           ;;
            *.rar)      unrar x $filename                           ;;
            *.jar)      jar xf $filename                            ;;
            *)          echo "'$filename' not supported extension"  ;;
        esac
    else
        echo "'$filename' is not a file."
    fi
}