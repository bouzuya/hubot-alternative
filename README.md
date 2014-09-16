# hubot-alternative

A Hubot script that define alternative command

## Installation

    $ npm install git://github.com/bouzuya/hubot-alternative.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-alternative.git#TAG'

## Example

    bouzuya> hubot help alternative
      hubot> hubot alt[ernative] <new> <old> - define alternative command.

    (original)
    bouzuya> hubot ping
      hubot> pong

    (define ppp)
    bouzuya> hubot alt ppp ping
      hubot> ppp=ping

    (execute ppp)
    bouzuya> hubot ppp
      hubot> pong


## Configuration

See [`src/scripts/alternative.coffee`](src/scripts/alternative.coffee).

## Development

`npm run`

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][mail]&gt; ([http://bouzuya.net][url])

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]
[![Coverage Status][coveralls-badge]][coveralls]

[travis]: https://travis-ci.org/bouzuya/hubot-alternative
[travis-badge]: https://travis-ci.org/bouzuya/hubot-alternative.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-alternative
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-alternative.png
[coveralls]: https://coveralls.io/r/bouzuya/hubot-alternative
[coveralls-badge]: https://img.shields.io/coveralls/bouzuya/hubot-alternative.svg
[user]: https://github.com/bouzuya
[mail]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
