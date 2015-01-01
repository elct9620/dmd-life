###
# Command Parser
###

commands = {}

execCommand = (socket, command, options, content) ->
  if commands.hasOwnProperty(command)
    callback = commands[command]
    return callback(socket, content, options)

  return false

class Command

  @parse: (socket, message) ->
    if message.substr(0, 1) is '/'
      parsedCommand = message.split(" ")
      command = parsedCommand.shift()
      content = parsedCommand.pop()
      options = parsedCommand # TODO: Options need to imrpove to handle option content

      return execCommand(socket, command, options, content)

    return false

  @register: (command, callback) ->
    if commands.hasOwnProperty(command)
      return false

    commands[command] = callback
    return true

module.exports = Command
