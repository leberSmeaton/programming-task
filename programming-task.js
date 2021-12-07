const fs = require('fs');
console.log('Hello world');
const logFile = fs.readFileSync("./programming-task-example-data_(1).log", 'utf-8');

// split puts substrings of new line into array
let arrayOfLogFiles = logFile.split("\n");

// splitting data further so I can separate the IP data
let dataArrayOfLogFiles = [];
for(let i=0; i<arrayOfLogFiles.length; i++){
  // if empty string skip / continue
  if (arrayOfLogFiles[i] == ""){continue}
  let tempArray = arrayOfLogFiles[i].split("-").join(",").split(" ") || [];
  dataArrayOfLogFiles.push(tempArray);  
};

let result = dataArrayOfLogFiles.map(ip => ip[0]);

// find number of unique ip addresses using ES6 set and spread 
let uniqueResult = [...new Set(result)]
console.log(`The number of unique IP addresses ${uniqueResult.length}.`) 

// find the top 3 most active IP addresses
function mode(result) {
  return [...result].sort((a,b) =>
    result.filter(v => v==a).length - result.filter(v => v==b).length
  ).pop();
}
console.log(`The top 3 most active IP addresses ${mode(result)}.`)
// only returns single top value