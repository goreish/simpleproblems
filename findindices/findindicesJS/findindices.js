/* Created by: Gaafer Goreish
 * Date: 2019-10-31
 * Solving the following problem using JavaScript
 * Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 * You may assume that each input would have exactly one solution, and you may not use the same element twice.
 * Example:
 * Given nums = [2, 7, 11, 15], target = 9,
 * Because nums[0] + nums[1] = 2 + 7 = 9,
 * return [0, 1].
 *
 * To run this script, you have multiple options
 * Using Chrome browser
 *      Open the Developer Tool bar [OR Hit F12]
 *      Go to Console
 *      Copy/paste all the content of this file and hit return
 *      To run function with different value just call with different parameters
 *      e.g. findIndices(list, 10, true);
 *
 * Using NodeJS (Must be installed on your system)
 *      node .\findindices.js
 *      To run with different values, edit
 *
 * Using npm (Must be installed on your system)
 *      npm start
 *
 * Sample Output from: findIndices([1,2,3,10,11,13], 5,true)
 * Finding indices of values in array list[1,2,3,10,11,13] that adds up to [5]
 * Trying list[0] (1)
 * Trying list[1] (2)
 * list[1] + list[2] = 2 + 3 = 5
 * (2) [1, 2]
 *
 */
function findIndices(list, target, debug) {
    debug &&
        console.log(
            `Finding indices of values in array list[${list}] that adds up to [${target}]`
        );

    // Create the result array with default values
    var indices = [-1, -1];

    //  Loop over each value in given list of integers
    for (var index = 0; index < list.length; index++) {
        debug && console.log(`Trying list[${index}] (${list[index]})`);

        // Get the index of difference value if it exists or -1
        var otherIndex = list.indexOf(target - list[index]);
        if (otherIndex > -1 && otherIndex != index) {
            debug &&
                console.log(
                    `list[${index}] + list[${otherIndex}] = ${list[index]} + ${list[otherIndex]} = ${target}`
                );

            // Assign indices to result and break out of loop
            indices = [index, otherIndex];
            break;
        }
    }
    return indices;
}

var list = [1, 2, 3, 5, 8, 11, 13, 21, 26];
var target = 34;

var result = findIndices(list, target, true);
console.log(result);

module.exports = findIndices;
