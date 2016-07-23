#if os(OSX) || os(iOS)
    import Darwin
#elseif os(Linux)
    import Glibc
#endif



#if os(Linux)
    
    // Physical Pin 13 on Orange Pi
let gpioPA0 = GPIO(sunXi: SunXiGPIO(letter: .A, pin: 0))
let gpioBuzz = gpioPA0
    
gpioBuzz.direction = .OUT
gpioBuzz.value = 0
    
#endif



let separationBetweenNotes = UInt32(20)

enum Modifier: Int {
    case Sharp = 1
    case Flat = -1
}


protocol FrequencyProtocol {
    func frequency(modifier: Modifier?, octave: Int?) -> Int
}


let octaveBase = 4

enum Note: Int, FrequencyProtocol {
    case C = 0
    case D = 2
    case E = 4
    case F = 5
    case G = 7
    case A = 9
    case B = 11
    
    func frequency(modifier: Modifier? = nil, octave: Int? = octaveBase) -> Int {
        return frequencyForNote(note: self, modifier: modifier, octave: octave!)
    }
    
}


func frequencyForNote(note: Note, modifier: Modifier?, octave: Int) -> Int {
    var halfStepsFromA4: Int = note.rawValue - Note.A.rawValue
    
    halfStepsFromA4 += 12 * (octave - 4)
    
    if let modifier = modifier {
        halfStepsFromA4 += modifier.rawValue
    }
    
    let frequencyOfA4 = 440.0
    let a = 1.059463094359
    
    let frequency = Int(frequencyOfA4 * pow(a, Double(halfStepsFromA4)))
    print(frequency)
    return frequency
}






// This function generates the square wave
// that makes the piezo speaker sound at a determinated frequency
func beep(frequency: Int, duration: Int) {
    
    // This is the semiperiod of each note
    let beepDelay = 1000000/frequency
    // This is how long we need to spend on the note
    let time = (duration*1000) / (beepDelay*2)
    
    for _ in 0..<time {
        #if os(Linux)
            // 1st semeperiod
            gpioBuzz.value = 1
            usleep(UInt32(beepDelay))
            // 2nd semeperiod
            gpioBuzz.value = 0
            usleep(UInt32(beepDelay))
        #endif
    }
    
    // Add a little delay to separate the single notes
    #if os(Linux)
        gpioBuzz.value = 0
        usleep(separationBetweenNotes)
    #endif
    
}



beep( frequency: Note.A.frequency(), duration: 500)
beep( frequency: Note.A.frequency(), duration: 500)
beep( frequency: Note.F.frequency(), duration: 350)
beep( frequency: Note.C.frequency(octave: octaveBase + 1), duration: 150)

beep( frequency: Note.A.frequency(), duration: 500)
beep( frequency: Note.F.frequency(), duration: 350)
beep( frequency: Note.C.frequency(octave: octaveBase + 1), duration: 150)
beep( frequency: Note.A.frequency(), duration: 1000)
beep( frequency: Note.E.frequency(octave: octaveBase + 1), duration: 500)

beep( frequency: Note.E.frequency(octave: octaveBase + 1), duration: 500)
beep( frequency: Note.E.frequency(octave: octaveBase + 1), duration: 500)
beep( frequency: Note.F.frequency(octave: octaveBase + 1), duration: 350)
beep( frequency: Note.C.frequency(octave: octaveBase + 1), duration: 150)
beep( frequency: Note.G.frequency(modifier: .Sharp), duration: 500)

beep( frequency: Note.F.frequency(), duration: 350)
beep( frequency: Note.C.frequency(octave: octaveBase + 1), duration: 150)
beep( frequency: Note.A.frequency(), duration: 1000)
beep( frequency: Note.A.frequency(octave: octaveBase + 1), duration: 500)
beep( frequency: Note.A.frequency(), duration: 350)


