# `zurawiki/brews`

This is the `brew` formulae for [`gptcommit`](https://github.com/zurawiki/gptcommit) and other tools


## How do I install these formulae?

`brew install zurawiki/brews/<formula>`

e.g. `brew install zurawiki/brews/gptcommit`

Or `brew tap zurawiki/brews` and then `brew install gptcommit`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).


## Updating these formula

1. Bump the version in the corresponding `*.rb` file

2. Install the new bottle
```sh
brew install --build-bottle Formula/gptcommit.rb
```

3. Update any checksums as neccesary. Make sure the checksums are verified manually.
