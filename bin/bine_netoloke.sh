bina_MkDocs() {
  cd mkdocs/$1
  mkdocs build
  cd ../..
}

muta_GitHub_dokumensanduke() {
    grep -rl "edit\/master\/docs" html/$1 | xargs sed -i "s/edit\/master\/docs/edit\/master\/$1/g"
}

bina_netoloke() {
    echo
    echo bine netoloke do $1
    bina_MkDocs $1
    muta_GitHub_dokumensanduke $1
}

bina_pan() {
    bina_netoloke zho
    bina_netoloke eng
    bina_netoloke spa
    bina_netoloke epo
    bina_netoloke fra
    bina_netoloke may
    bina_netoloke jpn
    bina_netoloke pandunia
    bina_netoloke pol
    bina_netoloke por
    bina_netoloke rus
    bina_netoloke suomi
    bina_netoloke tai
}

bina_pan

