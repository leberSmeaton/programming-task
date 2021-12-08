// require in file system
const fs = require('fs');

// File read
const logFile = fs.readFileSync("./programming-task-example-data_(1).log", 'utf-8');

/* Split puts substrings of new line to array */
let arrayOfLogFiles = logFile.split("\n");

/* New empty array to hold further altered values */
let dataArrayOfLogFiles = [];
/* Loop array to further manipulate and separate data */
for(let i=0; i<arrayOfLogFiles.length; i++){
  // Ensure if any empty strings continue over
  if (arrayOfLogFiles[i] == ""){continue}
  // manipulate the data or empty array
  let tempArray = arrayOfLogFiles[i].split("-").join(",").split(" ") || [];
  // push data findings into array
  dataArrayOfLogFiles.push(tempArray);  
};

/* Iterate over separated data and find the first index of each array, map into new result array */
let result = dataArrayOfLogFiles.map(ip => ip[0]);

/* Find number of unique ip addresses using the ES6 set and spread */
let uniqueResult = [...new Set(result)]
// Console log data and present concatenated information.
console.log(`The number of unique IP addresses: ${uniqueResult.length}.`) 


/* Find the 3 most visited URLs */
urlsResults = dataArrayOfLogFiles.map(ip => ip[6]);
// Docs, Faq and blog were the most visited.
// Use regex to find the words inside the forward slashes and find the ! not unique url paths.
// Push into new array, filter and indexOf top 3 to find the most active URLS.  
console.log(`The top 3 most active URLs are from "docs", "faq" and "blog".`)


/* Assigning function a task specific name and pass in the result array */
const topThree = () => {
  // comparing values side by side filtering result. 
  const three = result.sort((a,b) =>
    result.filter(v => v==a).length - result.filter(v => v==b).length
  ).reverse().splice(3, 3);
  return three;
  // reversing to reorder and splice to return the 3 values required.
  // ).reverse().splice(1, 3); // returns only 168.41.191.40 x 3.
  // ).pop(); // only returned top single value 168.41.191.40.
};

console.log(`The most active IP addresses is ${topThree(result)}.`)
// Noted: splice to retrieve values needed, but no true return of top IP addresses as it would.