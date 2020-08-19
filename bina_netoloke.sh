bina_MkDocs() {
  cd mkdocs/$1
  mkdocs build
  cd ../..
}

muta_GitHub_dokumsanduke() {
    grep -rl "edit\/master\/docs" html/$1 | xargs sed -i "s/edit\/master\/docs/edit\/master\/$1/g"
}

bina_netoloke() {
    echo $1
    bina_MkDocs $1
    muta_GitHub_dokumsanduke $1
}

bina_pane() {
    bina_netoloke cini
    bina_netoloke engli
    bina_netoloke espani
    bina_netoloke esperanti
    bina_netoloke fransi
    bina_netoloke niponi
    bina_netoloke pandunia
    bina_netoloke polski
    bina_netoloke rusi
    bina_netoloke suomi
}

bina_pane

