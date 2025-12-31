CoWaRD is a CLI tool, written in Rust, for interacting with a sqlite-backed Trie structure that saves natural language words.

This repo is intended to be a natural language autocomplete plugin in neovim. However, some prompt engineered (vibecoded) CLI portions to test progress were too good to discard.

## Generating the DB
Using the [english words repo](https://github.com/dwyl/english-words/blob/master/words_alpha.txt), I created the file `insert_english.txt`. All you need to do is run these 2 commands:
```bash
sed "s/.*/INSERT OR IGNORE INTO words (word) VALUES ('&');/" insert_english.txt > insert_english.sql
sqlite3 dictionary.db < insert_english.sql
```

Note that `dictionary.db` is chosen and loaded by the Rust code in main. You can modify the name and path of the SQLite DB as needed.
