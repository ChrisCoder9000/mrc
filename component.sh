create_component() {
    COMPONENT_NAME=$1
    DEST_DIR="src/components/$1"
    TEMPLATE_DIR+="/component"
    
    mkdir -p $DEST_DIR
    
    # Copia e personalizza i file template
    sed "s/%%COMPONENT_NAME%%/$COMPONENT_NAME/g" $TEMPLATE_DIR/ComponentTemplate.txt > $DEST_DIR/$COMPONENT_NAME.tsx
    sed -e "s/%%COMPONENT_NAME%%/$COMPONENT_NAME/g" -e "s/%%STYLE_COMPONENT%%/$STYLE_COMPONENT/g" $TEMPLATE_DIR/StyledComponentTemplate.txt > $DEST_DIR/Styled$COMPONENT_NAME.ts
    sed "s/%%COMPONENT_NAME%%/$COMPONENT_NAME/g" $TEMPLATE_DIR/index.txt > $DEST_DIR/index.ts
}