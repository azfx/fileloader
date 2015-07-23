# Meteor File Loader
Helps override default Meteor file [load order](http://docs.meteor.com/#/full/structuringyourapp).

## Installation
```meteor add azfx:fileloader```

## Usage

### To define file load order

#### Syntax

```
//Define a unique id for the file
var thisFile = new FileLoader("<UniqueFileID>");

//Define dependencies and add application code.
thisFile.loadAfter(["<OtherUniqueFileID1>" , ..."] , function(){
  //application code
  ...
})
```

#### Examples

```
//file1.js
var thisFile = new FileLoader("file1.js");
thisFile.loadAfter(["file2.js" , "file3.js"] , function(){
  //file1.js code
  ...
})
```

```
//file4.js
var thisFile = new FileLoader("file4.js");
thisFile.loadAfter(["file1.js"] , function(){
  //file4.js code
  ...
})
```

### To define a file id only
In case a file is not dependent on any other files, but not vice versa, we can define an id for the file

#### Syntax

```
//Define a unique id for the file
var thisFile = new FileLoader("<UniqueFileID>");

//Add application code here
...

//Let FileLoader know that this file has been loaded
thisFile.finishedLoading();
```

### FAQs
#### Does this need to be applied to every file?
No, only those file which you want to override default load order.

#### Is there a way to debug file load order ?
Yes, call `FileLoader.debug(true)`. The debug messages will be shown server or client depending on where the files are loaded. 
