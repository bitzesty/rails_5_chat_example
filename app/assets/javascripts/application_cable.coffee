#= require cable

@App = {}
App.cable = Cable.createConsumer "ws://127.0.0.1.xip.io:28080"
