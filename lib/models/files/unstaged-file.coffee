File= require './file'
git = require '../../git'

module.exports =
class UnstagedFile extends File

  # Tracked files appear second in the file list
  sort_value: 1

  unstage: ->
    git.unstage(@path())
    .catch (error) =>
      error_callback
      @errorCallback(error)
    .finally => @trigger 'update'

  kill: ->
    atom.confirm
      message: "Discard unstaged changes to \"#{@path()}\"?"
      buttons:
        'Discard': @checkout
        'Cancel': -> return

  loadDiff: ->
    git.getDiff(@path()).then (diff) => @setDiff(diff)

  isUnstaged: -> true
