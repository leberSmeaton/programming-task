const fs = require('fs');
console.log('hello');
const logFile = fs.readFileSync("./programming-task-example-data_(1).log", 'utf-8');

// split puts substrings into array
let arrayOfLogFiles = logFile.split("\n");

let dataArrayOfLogFiles = [];
for(let i=0; i<arrayOfLogFiles.length; i++){
  let tempArray = arrayOfLogFiles[i].split("-").join(",").split(" ") || [];
  dataArrayOfLogFiles.push(tempArray);  
};
console.log(dataArrayOfLogFiles);

let result = dataArrayOfLogFiles.map(ip => ip[0]);
console.log(result);