path     = require('path')
electron = require('electron')

{app, BrowserWindow} = electron
win = null

createWindow = ->
    win = new BrowserWindow
        width: 800
        height: 600
        # frame: false
        # fullscreen: true

    index = path.resolve __dirname, '../static/index.html'
    win.loadURL "file:///#{index}"
    # win.webContents.openDevTools()

    win.on 'closed', -> win = null

app.on 'ready', ->
    createWindow()

app.on 'activate', =>
    createWindow() if win is null

app.on 'window-all-closed', ->
    app.quit()
