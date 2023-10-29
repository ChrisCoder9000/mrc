#! /bin/bash

SCRIPT_DIR="/Users/christiannonis/Documents/mrc"

if [ ! -f "package.json" ]; then
    echo "Warning: 'package.json' not found. Make sure you are in a React project."
    exit 1  # Exit script if package.json is not found
fi

if [ ! -d "src/components" ] || [ ! -d "src/app" ]; then
    echo "Warning: 'src/components' or 'src/app' directory not found. Make sure you are in a React project."
    exit 1  # Exit script if directories are not found
fi

source $SCRIPT_DIR/component.sh
source $SCRIPT_DIR/page.sh
source $SCRIPT_DIR/atom.sh

COMPONENT_NAME=""
IS_PAGE=false
IS_ATOM=false
STYLE_COMPONENT="div"
TEMPLATE_DIR="$SCRIPT_DIR/templates"
HELP=false

for arg in "$@"; do
    case $arg in
        --help)
            HELP=true  # Imposta HELP a true se --help è specificato
        ;;
        --page)
            IS_PAGE=true
        ;;
        --atom)
            IS_ATOM=true
        ;;
        --sc=*)
            STYLE_COMPONENT="${arg#--sc=}"
        ;;
        *)
            # Assume the first non-flag argument is the component name
            if [[ -z $COMPONENT_NAME ]]; then
                COMPONENT_NAME=$arg
            fi
        ;;
    esac
done

if $IS_PAGE; then
    create_page $COMPONENT_NAME
fi

if $IS_ATOM; then
    create_atom $COMPONENT_NAME
fi

if ! $IS_PAGE && ! $IS_ATOM && ! $HELP; then
    create_component $COMPONENT_NAME
fi

if $HELP; then
    echo "Usage: mrc <component-name> [--page --atom --sc=<style-component>]"
    echo ""
    echo "Options:"
    echo "  --page                Create a page component"
    echo "  --atom                Create an atom component"
    echo "  --sc=<style-component>   Specify the style component for the atom component"
    exit 0
fi

if [[ -z $COMPONENT_NAME ]]; then
    echo "Usage: mrc <component-name> [--page --atom --sc=<style-component>]"
    exit 1
fi