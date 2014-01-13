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

    # AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhZG1pbiI6dHJ1ZSwidiI6MCwiaWF0IjoxMzg5NTY4MTE5LCJkIjp7ImlkIjoiMTAwMDEifX0._Uwu8T04zbgXM_YdzKcDsQ6eXeHEQhDoC9AL3dRC9V4"
    # AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhZG1pbiI6dHJ1ZSwidiI6MCwiaWF0IjoxMzg5NTY5MDIxLCJkIjp7ImlkIjoiMTAwMDEiLCJ1c2VyIjoidXNlcmZpZWxkIn19.kuLbTY5xPpXI1PxwklNyCSeGp8f7-IVHZyE8clADeNE"
    # AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhZG1pbiI6dHJ1ZSwidiI6MCwiaWF0IjoxMzg5NTY5MTcwLCJkIjp7ImlkIjoiMTAwMDEiLCJ1c2VyIjoidXNlcmZpZWxkIiwidXNlcl9pZCI6InVzZXJpZGZpZWxkIn19.uCfyv-sY58SkYI5y68zmgk_9Lqx_d83g2fLlnnw0VXg"
    AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ2IjowLCJpYXQiOjEzODk1NzA5MTAsImQiOnsiaWQiOiIxMDAwMSIsInVzZXIiOiJ1c2VyZmllbGQiLCJ1c2VyX2lkIjoidXNlcmlkZmllbGQifX0.4izpPNjLnTCxauajciE07rsdHy0f9z9VseuaU0wRhZQ"
    firepadRef = new Firebase(scope.backendUrl())

    # Log me in.
    firepadRef.auth(AUTH_TOKEN, ( (error) ->
      if(error)
        console.log("Login Failed!", error);
      else
        console.log("Login Succeeded!");
    ))

    codeMirror = CodeMirror(document.getElementById(attrs.id), { lineWrapping: true })
    
    scope.firepad = Firepad.fromCodeMirror(firepadRef, codeMirror, { richTextToolbar: true, richTextShortcuts: true })
    scope.firepad.on('ready', ->
      # TODO(kevin): localize
      if (scope.firepad.isHistoryEmpty())
        scope.firepad.setHtml('Welcome! This document is a collaborative document, add classmates to start sharing!')
    )
])
