/*
 *** VUT FIT ***
 * ITU project *
 * WorkoutPlanning *
 * 2022/2023 *
 @author: Filip Karasek
 @xlogin: xkaras39
*/
.pragma library

// array na ukladani vsech vytvorenych cviceni
var a = [
    "Ukázka 1", // nazev
    "12",   // doba trvani
    "dřepy",     // cvik 1
    "2",     // trvani cviku 1
    "0.5",       // pauza cviku 1
    "2",     // pocet serii cviku 1
    "konec_s3r13",       // znaceni konce dane serie, stejne pro vsechny
            // cvik 2...n
    "Ukázka 2",
    "10",
    "sedy-lehy",
    "5",
    "1",
    "dřepy",
    "3",
    "1",
    "konec_s3r13",
    "Ukázka 3",
    "7",
    "kliky",
    "6",
    "1",
    "konec_s3r13",
            "Ukázka 4",
            "7",
            "kliky",
            "6",
            "1",
            "konec_s3r13",
            "Ukázka 5",
            "7",
            "kliky",
            "6",
            "1",
            "konec_s3r13",
            "Ukázka 6",
            "7",
            "kliky",
            "6",
            "1",
            "konec_s3r13",
    "k0n3c"     // znaceni uplneho konce pole
];


// array na predavani JMENA cviku ktery se ma prehrat
// Adam:
// nazev toho cviku tam bude pushutej kdyz to dostanes kdyztak si tam zatim muzes napsat treba "Ukazka 1" a zkouset to
// 1. ziskat do promene v qml pomoci ALIAS.play.pop()
// 2. projit array a nahrat si k sobe cviky a casy
var play = []


