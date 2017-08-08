//main module
const {app, BrowserWindow} = require('electron')
const path = require('path')
const url = require('url')
//event handling module
const {ipcMain} = require('electron')

let win

app.setPath('userData', __dirname + '/saved_recordings')

function createWindow(){
  win = new BrowserWindow({
    width: 800,
    height: 600
  })
  win.loadURL(url.format({
    pathname: path.join(__dirname, 'index.html') ,
    protocol: 'file:',
    slashes: true
  }))
  //open console log
  //win.webContents.openDevTools()

  win.on('closed',() =>{
    win = null
  })
}

/*
ipcMain.on('openFile',(event,path) => {
  const {dialog} = require('electron')
  const fileSystem = require('fs')
  dialog.showOpenDialog(function( filenames ){
    if ( filenames === undefined ) {
      console.log('No selected file');
    }else{
      readFile(filenames[0])
    }
  })
  function readFile( filePath ){
    fileSystem.readFile(filePath, 'utf-8', (err,data) => {
      if (err) {
        console.log(err.message);
        return
      }
      event.sender.send('filename',data)
    })
  }
})
*/



app.on('ready', createWindow)
app.on('window-all-closed',() => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})
app.on('activate',() => {
  if (win === null) {
    createWindow()
  }
})
