git    = require '../../git'
Branch = require './branch'

# Public: LocalBranch class that extends the {Branch} prototype.
class LocalBranch extends Branch

  remote: false
  local: true

  # Public: Return the 'unpushed' property.
  #
  # Returns the property as {String}.
  unpushed: =>
    @get 'unpushed'

  # Public: Delete the branch.
  delete: =>
    git.cmd 'branch', {D: true}, @name()

  # TODO tracking branch or something?
  remoteName: -> ''

  # Public: Checkout the branch.
  #
  # callback - The callback as {Function}.
  checkout: (callback) =>
    git.checkout @localName()

  # Public: Push the branch to remote.
  #
  # remote - The remote to push to as {String}.
  push: (remote='origin') =>
    git.cmd 'push', [remote, @name()]

module.exports = LocalBranch
