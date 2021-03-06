# Git Contributions Graph

[![Travis CI](https://travis-ci.org/bastilian/git-contributions.svg?branch=master)](https://travis-ci.org/bastilian/git-contributions)
[![Test Coverage](https://codeclimate.com/github/bastilian/git-contributions/badges/coverage.svg)](https://codeclimate.com/github/bastilian/git-contributions/coverage)
[![Inch CI](https://inch-ci.org/github/bastilian/git-contributions.svg?branch=master)](https://inch-ci.org/github/bastilian/git-contributions)

An embeddable clone of GitHub's contribution graph.

## Requirements

 * Ruby 2.2.3
 * Git 2.5.3

## Installation

```shell
$ git clone https://github.com/bastilian/git-contributions.git
$ cd git-contributions
$ bundle install
$ rails s # Start webserver
$ rake    # Run specs
```

## Documentation

Generate [code documentation](http://www.rubydoc.info/github/bastilian/git-contributions/master) with:

```shell
$ rake yard
```

## License

MIT License

Copyright © 2016 Sebastian Gräßl <mailto:sebastian@validcode.me>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
