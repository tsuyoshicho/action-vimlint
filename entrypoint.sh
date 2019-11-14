#!/bin/sh

cd "$GITHUB_WORKSPACE"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

# setup vimlint / vimlparser
export VIMLINT_PATH="${GITHUB_WORKSPACE}/vim-vimlint"
export VIMLPARSER_PATH="${GITHUB_WORKSPACE}/vim-vimlparser"
git clone --depth 1 https://github.com/syngan/vim-vimlint    ${VIMLINT_PATH}
git clone --depth 1 https://github.com/ynkdir/vim-vimlparser ${VIMLPARSER_PATH}

# vimlint:
#   cmd: vimlint -e EVL102.l:_=1 -c func_abort=1 autoload
#   errorformat:
#     - "%f:%l:%c:%trror: %m"
#     - "%f:%l:%c:%tarning: %m"
#     - "%f:%l:%c:%m"


sh "${VIMLINT_PATH}/bin/vimlint.sh" -l "${VIMLINT_PATH}" -p "${VIMLPARSER_PATH}"  \
  -e EVL102.l:_=1 -c func_abort=1 autoload                                        \
   | reviewdog -efm="%f:%l:%c:%trror: %m" -efm="%f:%l:%c:%tarning: %m" -efm="%f:%l:%c:%m"   \
               -name="vimlint" -reporter="${INPUT_REPORTER:-'github-pr-check'}" -level="${INPUT_LEVEL}"
