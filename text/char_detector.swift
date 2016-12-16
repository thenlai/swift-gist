// 汉字：
// \u4e00-\u9fa5
// 19968, 40869
// ！ 65281
// 。12290

func valid(word: String) -> Bool {
    for scalar in word.unicodeScalars {
        let codePoint = scalar.value
        if codePoint < 0x4e00 || codePoint > 0x9fa5 {
            return false
        }
    }
    return true
}

if valid(word: "你好世界") {
    print("all hanzi")
} else {
    print("not all hanzi")
}