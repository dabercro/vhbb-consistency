# vhbb-consistency

These few scripts use the `dynamo-consistency` package to check that two directory structures match.
Start by installing `dynamo-consistency`:

```
pip install dynamo-consistency
```

Then just run:

```
./vhbb_consistency.sh
```

Two files will appear in the working directory.
With the default configuration,
`vhbb_missing.txt` will list files that are on EOS and not at MIT.
`vhbb_orphan.txt` will list files that are at MIT, but no longer on EOS.
Files that appear in both lists actually have a different size at the two sites.
