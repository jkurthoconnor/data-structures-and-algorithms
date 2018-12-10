const assert = require('assert').strict;
const isPalindrome = require('./palindrome');


//                     actual, expected

assert.equal(isPalindrome(''), true);
assert.equal(isPalindrome('.,'), true);
assert.equal(isPalindrome('a'), true);
assert.equal(isPalindrome(',a'), true);
assert.equal(isPalindrome('a,'), true);
assert.equal(isPalindrome('a,,,,,,'), true);
assert.equal(isPalindrome(',,,la,,,,'), false);
assert.equal(isPalindrome('hello'), false);
assert.equal(isPalindrome('ala'), true);
assert.equal(isPalindrome('allalla'), true);
assert.equal(isPalindrome('a;;llalla'), true);
assert.equal(isPalindrome('A man, a plan, a canal: Panama'), true);
assert.equal(isPalindrome('race a car'), false);
assert.equal(isPalindrome('facaf '), true);
// assert.equal(isPalindrome('facaf '), false); // sanity check: we want the error
