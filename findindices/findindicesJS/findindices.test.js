// To run these tests type: npm test
// To run tests and get code coverage type: npm run testcoverage OR npm test -- --collectCoverage
// To learn more about JEST https://jestjs.io/docs/en/getting-started

// Import the function
const findIndices = require("./findIndices.js");

// To show output from each call set value to true
const EnableDebug = false;

// Tests start, to skipp test just add an x before the it. i.e. xit(...)

it("Test 1: Empty input list", () => {
    const expected = [-1, -1];
    const result = findIndices([], 10, EnableDebug);
    expect(result).toEqual(expected);
});

it("Test 2: Two elements in input add to target", () => {
    const expected = [0, 1];
    const result = findIndices([1, 2], 3, EnableDebug);
    expect(result).toEqual(expected);
});

it("Test 3: First and last of three add to target", () => {
    const expected = [0, 2];
    const result = findIndices([1, 3, 6], 7, EnableDebug);
    expect(result).toEqual(expected);
});

it("Test 3: First and last of three add to target", () => {
    const expected = [0, 2];
    const result = findIndices([1, 3, 6], 7, EnableDebug);
    expect(result).toEqual(expected);
});

it("Test 4: Two middle of four add to target", () => {
    const expected = [1, 2];
    const result = findIndices([1, 2, 3, 7], 5, EnableDebug);
    expect(result).toEqual(expected);
});

it("Test 5: Last two elements of five add to target", () => {
    const expected = [3, 4];
    const result = findIndices([0, 1, 3, 5, 7], 12, EnableDebug);
    expect(result).toEqual(expected);
});

it("Test 6: No two elements of five add to target", () => {
    const expected = [-1, -1];
    result = findIndices([1, 2, 3, 4, 5], 10, EnableDebug);
    expect(result).toEqual(expected);
});
