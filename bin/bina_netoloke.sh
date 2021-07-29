bina_MkDocs() {
  cd mkdocs/$1
  mkdocs build
  cd ../..
}

muta_GitHub_dokumsanduke() {
    grep -rl "edit\/master\/docs" html/$1 | xargs sed -i "s/edit\/master\/docs/edit\/master\/$1/g"
}

bina_netoloke() {
    echo bina netoloke pa $1
    bina_MkDocs $1
    muta_GitHub_dokumsanduke $1
}

bina_pan() {
    bina_netoloke putonghan
    bina_netoloke english
    bina_netoloke espanya
    bina_netoloke esperanto
    bina_netoloke france
    bina_netoloke nipon
    bina_netoloke pandunia
    bina_netoloke polski
    bina_netoloke portugal
    bina_netoloke rus
    bina_netoloke suomi
}

bina_pan

