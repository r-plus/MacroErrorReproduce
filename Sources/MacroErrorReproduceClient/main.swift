import MacroErrorReproduce

@TestMacro(label: [Int.self])
struct Foo {
    struct Inside {}
}
