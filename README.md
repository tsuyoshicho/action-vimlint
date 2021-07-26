# GitHub Action: Run vimlint with reviewdog

[![Docker Image CI](https://github.com/tsuyoshicho/action-vimlint/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/tsuyoshicho/action-vimlint/actions)
[![Release](https://github.com/tsuyoshicho/action-vimlint/workflows/release/badge.svg)](https://github.com/tsuyoshicho/action-vimlint/releases)

This action runs [vim-vimlint](https://github.com/syngan/vim-vimlint) with
[reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve
code review experience.

based on [reviewdog/action-vint](https://github.com/reviewdog/action-vint)

[![github-pr-check example](https://user-images.githubusercontent.com/96727/68837462-f2505700-06ff-11ea-9df6-80f508cc928a.png)](https://github.com/tsuyoshicho/action-vimlint/pull/1)
[![github-pr-review example](https://user-images.githubusercontent.com/96727/68837468-f67c7480-06ff-11ea-9a05-2b663f771409.png)](https://github.com/tsuyoshicho/action-vimlint/pull/1)

## Inputs

### `github_token`

**Required**. Default is `${{ github.token }}`.

### `level`

Optional. Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.

### `reporter`

Reporter of reviewdog command [github-pr-check,github-check,github-pr-review].
Default is github-pr-review.
It's same as `-reporter` flag of reviewdog.

github-pr-review can use Markdown and add a link to rule page in reviewdog reports.

### `filter_mode`

Optional. Filtering mode for the reviewdog command [added,diff_context,file,nofilter].
Default is added.

### `fail_on_error`

Optional.  Exit code for reviewdog when errors are found [true,false]
Default is `false`.

### `reviewdog_flags`

Optional. Additional reviewdog flags

### `target`

Check target files and/or directories.
If multi item list, use space separation.

Default is autoload.

### `vimlint_flags`

vimlint arguments (Default: `-e EVL102.l:_=1 -c func_abort=1`)

## Example usage

### [.github/workflows/reviewdog.yml](.github/workflows/reviewdog.yml)

```yml
name: reviewdog
on: [pull_request]
jobs:
  vimlint:
    name: runner / vimlint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: vimlint
        uses: tsuyoshicho/action-vimlint@v1
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review # Change reporter.
```
