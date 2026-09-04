ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
SCRIPT_DIR="${ROOT_DIR}/script"

function is_ruby_31_plus {
  if ruby -e "exit(RUBY_VERSION.to_f >= 3.1)"; then
    return 0
  else
    return 1
  fi
}
