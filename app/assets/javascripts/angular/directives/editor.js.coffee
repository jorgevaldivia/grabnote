# Module with methods relating to the editor.

# Shared directive methods go here.
grabnote.controller("EditorController", ["$scope", ($scope) ->
])

# Render the editor. The gist of it is that firepad and codeMirror instances
# are created.
.directive("grabnoteEditor", ["$compile", ($compile) ->
  restrict: "CE",
  controller: "EditorController",
  link: (scope, element, attrs, controller) ->
    scope.backendUrl = ->
      "grabnote.firebaseio.com/#{attrs.key}"

    firepadRef = new Firebase(scope.backendUrl())
    codeMirror = CodeMirror(document.getElementById(attrs.id), { lineWrapping: true })
    
    scope.firepad = Firepad.fromCodeMirror(firepadRef, codeMirror, { richTextToolbar: true, richTextShortcuts: true })
    scope.firepad.on('ready', ->
      # TODO(kevin): localize
      if (scope.firepad.isHistoryEmpty())
        scope.firepad.setHtml('Welcome! This document is a collaborative document, add classmates to start sharing!')
    )
])
