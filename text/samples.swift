import Foundation

/**
basic types for text:
  - Character
  - String
*/

// ## String

var emptyString = ""
var anotherEmptyString = String()
// the same ways to init empty string

if emptyString.isEmpty {
    print("empty string")
}

var variableString = "mo"
variableString += " ha"

let constantString = "MOHA"
// ** compile-time error:
// constantString += "2young 2simple"

for character in "Dog!🐶".characters {
    print(character)
}

// ## Character
let exclamationMark : Character = "!"
var sayWelcome = "Welcome to MOland"
sayWelcome.append(exclamationMark)
print(sayWelcome)

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

// ## String interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 in \(Double(multiplier) * 2.5)"
print(message)


// ## Unicode
/*
Behind the scenes, Swift’s native String type is built from Unicode scalar values.
A Unicode scalar is a unique 21-bit number for a character or modifier,
such as U+0061 for LATIN SMALL LETTER A ("a"), or U+1F425 for FRONT-FACING BABY CHICK ("🐥").

A Unicode scalar is any Unicode code point in the range U+0000 to U+D7FF inclusive 
or U+E000 to U+10FFFF inclusive.
Unicode scalars do not include the Unicode surrogate pair code points,
which are the code points in the range U+D800 to U+DFFF inclusive.
*/

/**
## Special characters
  - \0 null character
    \\ backslash
    \t horizontal tab
    \n line feed
    \r carriage return
    \" double quote
    \' single quote
  - \{n}, an arbitrary Unicode scalar
  where n is a 1–8 digit hexadecimal number with a value equal to a valid Unicode code point
*/
let wiseWord = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"


/**
## Extended grapheme clusters
some thing like: 
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́
// eAcute is é, combinedEAcute is é

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한
*/

/**
##  Counting characters
watch out for: extended grapheme clusters
*/
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// 4

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301
 
print("the number of characters in \(word) is \(word.characters.count)")
// 4


/**
## accessing and modifying
*/

// indices
let greeting = "Guten Tag!"
// greeting[greeting.startIndex] // G
// greeting[greeting.index(before: greeting.endIndex)] // !
// greeting[greeting.index(after: greeting.startIndex)] // u
// greeting[greeting.index(greeting.startIndex, offsetBy: 7)] // a

// Attempting to access an index outside of a string’s range or a Character 
// at an index outside of a string’s range will trigger a runtime error.
// greeting[greeting.endIndex] // error
// greeting.index(after: greeting.endIndex) // error

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}


/**
## Inserting and removing
*/
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex) // hello!
welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex)) // hello there

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range) // hello


/**
## comparison

note: String and character comparisons in Swift are not locale-sensitive.
*/
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

/**
## Prefix and suffix equality
*/
let justSomeString = "begin: some string. end"
if justSomeString.hasPrefix("begin") {
    print("has prefix")
}
if justSomeString.hasSuffix("end") {
    print("has suffix")
}

/**
## Unicode representations of `String`s
*/