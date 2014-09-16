# Description
#   A Hubot script that define alternative command
#
# Configuration:
#   None
#
# Commands:
#   hubot alt[ernative] <new> <old> - define alternative command
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  robot.respond /alt(?:ernative)?\s+(\S+)\s+(.+)$/i, (res) ->
    newCommand = res.match[1]
    oldCommand = res.match[2]

    pattern = new RegExp(newCommand)
    res.robot.respond pattern, (r) ->
      r.message.text = res.robot.name + ' ' + oldCommand
      r.robot.receive r.message

    message = "alias #{newCommand}=#{oldCommand}"
    res.send message
