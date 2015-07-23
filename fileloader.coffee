class FileLoader
  #Class Vars
  @_loaded : []
  @_loadAfter : []
  @_debug : false

  #Class Methods
  @debug : (flag) =>
    @constructor._debug = flag

  #Instance Methods
  constructor : (@source) ->
    if  _.findWhere @constructor._loaded ,  @source
      debugMessage "##FileLoader - #{@source} is already loaded..."
    else
      debugMessage "##FileLoader - Loading  #{@source}"
      @constructor._loaded.push(@source)

  loadAfter : (@dependencies , cb) =>
    @constructor._loadAfter[@source] = { "dependencies" : @dependencies , "callback" : cb }
    debugMessage "##FileLoader - Load '#{@source}' after loading: #{@dependencies}"
    @checkDependencies()

  load : (cb) =>
    @checkDependencies()

  finishedLoading : () =>
    @checkDependencies()

  checkDependencies : () ->
    loaded = @constructor._loaded
    loadAfter = @constructor._loadAfter
    debugMessage "##FileLoader - Files loaded so far : #{loaded}"
    _.each loaded , (source) ->
      if loadAfter[source]
        if _.difference( loadAfter[source].dependencies , _.intersection( loaded , loadAfter[source].dependencies ) ).length == 0
          debugMessage "##FileLoader - All dependencies for #{source} are loaded.."
          loadAfter[source].callback()

  debugMessage = (message) =>
    if @constructor._debug
      console.log message
