# Coding

## From the book **Crafting Rails 4 Applications** by *Jose Valim*

[![Build Status][BS img]][Build Status]

[Build Status]: https://travis-ci.org/elgalu/crafting_rails4_apps
[BS img]: https://travis-ci.org/elgalu/crafting_rails4_apps.png

## TODO

Improve build.rb to use Travis build matrix:

```yaml
env:
  - TESTFOLDER=handlers
  - TESTFOLDER=live_assets
  - TESTFOLDER=mail_form
  ...

script: "build.rb $TESTFOLDER"
```
