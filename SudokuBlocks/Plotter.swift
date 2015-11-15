import Cocoa

let kL = orderedKeyArray()  // ["A1" .. "I9"]

let rectD = constructRectDict()
let tiny_rectL = constructTinyRects()

let cL = constructColorList()
let divL = getBlueDividerRects()

func drawDividers() {
    NSColor.blueColor().set()
    for r in divL {
        NSBezierPath.fillRect(r)
    }
}

func retrieveAndPlotData() {
    let dataD = getCurrentData()
    for key in kL {
        // any Dictionary access returns an Optional
        let r = rectD[key]!
        let data = dataD[key]!
        plotRects(data, rect: r, key: key)
    }
}

func plotRects(data: Set<Int>, rect: NSRect, key: String) {
    if data.count == 1 {
        let i = Array(data)[0]
        
        // adjust for 0-based indexing
        let col = cL[i-1]
        col.set()
        NSBezierPath.fillRect(rect)
        
        NSBezierPath.setDefaultLineWidth(2)
        mercury.set()
        NSBezierPath.strokeRect(rect)
    }
    else {
        plotTinyRects(data, rect: rect, key: key)
    }
}

func plotTinyRects(data: Set<Int>, rect: NSRect, key: String) {
    var a = tiny_rectL
    for n in Array(data).sort() {
        // n is in the range 1 to 9
        let i = n - 1
        var r = a[i]
        
        r.origin.x += rect.origin.x
        r.origin.y += rect.origin.y
        let col = cL[i]
        col.set()
        NSBezierPath.fillRect(r)
    }
    NSBezierPath.setDefaultLineWidth(2)
    mercury.set()
    NSBezierPath.strokeRect(rect)
}

