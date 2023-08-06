// B. Канонический путь

let absolute = readLine()!

func canonical(from absolute: String) -> String {
    enum PathComponent: CustomStringConvertible {
        case dir(String)
        case current
        case parent
        case empty
        
        init(string: String) {
            switch string {
            case "..":
                self = .parent
            case ".":
                self = .current
            case "":
                self = .empty
            default:
                self = .dir(string)
            }
        }
        
        var description: String {
            switch self {
            case .dir(let string):
                return string
            case .parent:
                return ".."
            case .empty:
                return "<empty>"
            case .current:
                return "."
            }
        }
    }
    
    let canonical = absolute.split(separator: "/", omittingEmptySubsequences: false)
        .map { PathComponent(string: String($0)) }
        .reduce([PathComponent](), { result, nextValue in
            switch nextValue {
            case .parent:
                return result.dropLast()
            case .dir(let str):
                return result + [nextValue]
            case .empty, .current:
                return result
            }
        })
        .reduce("", { result, nextValue in 
            switch nextValue {
            case .dir(let str):
                return result + "/" + str
            default:
                return result
            }
        })
    
    if canonical.isEmpty {
        return "/"
    }
    
    return canonical
}
print(canonical(from: absolute))