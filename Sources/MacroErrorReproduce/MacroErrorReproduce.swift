@attached(memberAttribute)
public macro TestMacro(label: [any Any.Type]) = #externalMacro(module: "MacroErrorReproduceMacros", type: "TestMacro")

@attached(member)
public macro InsideMacro() = #externalMacro(module: "MacroErrorReproduceMacros", type: "InsideMacro")
