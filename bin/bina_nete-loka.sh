bina_MkDocs() {
  cd mkdocs/$1
  mkdocs build
  cd ../..
}

muta_GitHub_dokumesanduku() {
    grep -rl "edit\/master\/docs" html/$1 | xargs sed -i "s/edit\/master\/docs/edit\/master\/$1/g"
}

bina_neteloka() {
    echo
    echo bina neteloka to $1
    bina_MkDocs $1
    muta_GitHub_dokumesanduku $1
}

bina_pan() {
    bina_neteloka zho
    bina_neteloka eng
    bina_neteloka spa
    bina_neteloka epo
    bina_neteloka fra
    bina_neteloka may
    bina_neteloka ita
    bina_neteloka jpn
    bina_neteloka pandunia
    bina_neteloka pol
    bina_neteloka por
    bina_neteloka rus
    bina_neteloka fin
    bina_neteloka tha
}

bina_pan

