[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-908a85?logo=gitpod)](https://gitpod.io/#https://github.com/giorgenes/elastic-search-rspec-reference)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](/LICENSE)


# About
A set of rspec tests to demonstrate use cases for elastic search

```bash
ES_PATH_CONF=master-1/config elasticsearch -d
ES_PATH_CONF=node-1/config elasticsearch -d
```

## Running the specs

```
bundle exec rspec
```

To enable elastic logs during specs:

```
ELASTIC_LOG=1 bundle exec rspec
```


