#compdef diamond

_diamond() {
    local commands=('build' 'run' 'emit')
    local line state

    _arguments -C \
        "1: :->cmds" \
        "*::arg:->args"

    case "$state" in
        cmds)
            _describe 'commands' commands
            ;;
        args)
            case $line[1] in
                build)
                    _diamond_build
                    ;;
                run)
                    _diamond_run
                    ;;
                emit)
                    _diamond_emit
                    ;;
            esac
            ;;
    esac
}

_diamond_build() {
    _arguments \
        '1:program file:_files'
}

_diamond_run() {
    _arguments \
        '1:program file:_files'
}

_diamond_emit() {
  local emit_options=('--tokens' '--ast' '--ast-with-types' '--ast-with-concrete-types' '--llvm-ir' '--obj' '--asm')
  
    _arguments \
        '1:options:->options' \
        '*:program file:_files'

    case $state in
        options)
            _describe 'emit options' emit_options
            ;;
    esac
}

# Call the completion function
compdef _diamond diamond