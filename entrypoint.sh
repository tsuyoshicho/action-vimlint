#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

# setup vimlint / vimlparser
export VIMLINT_PATH="${GITHUB_WORKSPACE}/vim-vimlint"
export VIMLPARSER_PATH="${GITHUB_WORKSPACE}/vim-vimlparser"
rm -rf "${VIMLINT_PATH}" "${VIMLPARSER_PATH}"
git clone --depth 1 https://github.com/syngan/vim-vimlint    "${VIMLINT_PATH}"
git clone --depth 1 https://github.com/ynkdir/vim-vimlparser "${VIMLPARSER_PATH}"

# vimlint:
#   cmd: vimlint -e EVL102.l:_=1 -c func_abort=1 autoload
#   errorformat:
#     - "%f:%l:%c:%trror: %m"
#     - "%f:%l:%c:%tarning: %m"
#     - "%f:%l:%c:%m"

# shellcheck disable=SC2086
sh "${VIMLINT_PATH}/bin/vimlint.sh" -l "${VIMLINT_PATH}" -p "${VIMLPARSER_PATH}"  \
  -e EVL102.l:_=1 -c func_abort=1 ${INPUT_TARGET}                                 \
    | reviewdog -efm="%f:%l:%c:%trror: %m"                                        \
                -efm="%f:%l:%c:%tarning: %m"                                      \
                -efm="%f:%l:%c:%m"                                                \
      -name="${INPUT_TOOL_NAME}"                                                  \
      -reporter="${INPUT_REPORTER:-github-pr-review}"                             \
      -filter-mode="${INPUT_FILTER_MODE}"                                         \
      -fail-on-error="${INPUT_FAIL_ON_ERROR}"                                     \
      -level="${INPUT_LEVEL}"                                                     \
      ${INPUT_REVIEWDOG_FLAGS}
