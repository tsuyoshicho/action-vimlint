# GitHub Action: Run vimlint with reviewdog

[![Docker Image CI](https://github.com/tsuyoshicho/action-vimlint/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/tsuyoshicho/action-vimlint/actions)
[![Release](https://img.shields.io/github/release/tsuyoshicho/action-vimlint.svg?maxAge=43200)](https://github.com/tsuyoshicho/action-vimlint/releases)

This action runs [vim-vimlint](https://github.com/syngan/vim-vimlint) with
[reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve
code review experience.

based on [reviewdog/action-vint](https://github.com/reviewdog/action-vint)

<!---
[![github-pr-check example](https://user-images.githubusercontent.com/3797062/65413404-57887a00-de2c-11e9-8f45-0729808b1c29.png)](https://github.com/reviewdog/action-vint/pull/1)
[![github-pr-review example](https://user-images.githubusercontent.com/3797062/65413352-3f185f80-de2c-11e9-956e-569eeaccac5f.png)](https://github.com/reviewdog/action-vint/pull/1)
-->

## Inputs

### `github_token`

**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`'.

### `level`

Optional. Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.

### `reporter`

Reporter of reviewdog command [github-pr-check,github-pr-review].
Default is github-pr-check.
github-pr-review can use Markdown and add a link to rule page in reviewdog reports.

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
        uses: tsuyoshicho/action-vimlint@master
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review # Change reporter.
```
