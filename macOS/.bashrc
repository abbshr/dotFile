brew-up() {
  brew update; brew upgrade; brew cleanup;
}

# add ssh priavte keys
for pk_name in $(ls ~/.ssh/*.pub 2>/dev/null); do
  ssh-add ${pk_name/.pub} &> /dev/null
done