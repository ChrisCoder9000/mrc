# MRC (Make React Component)

### To make it executable

create a script wrapper

```
vim /usr/local/bin/make-component
```

add the following to the file

```
#!/bin/bash

# Percorso completo della directory dello script
SCRIPT_DIR="/Users/christiannonis/Documents/mrc"

# Esegui lo script principale
bash "$SCRIPT_DIR/mrc.sh" "$@"
```

make it executable

```
chmod +x /usr/local/bin/make-component
```
