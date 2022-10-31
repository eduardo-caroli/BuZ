//
//  Validator.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 26/10/22.
//

import Foundation

class Validator {
    
    private let lines = ["324","795", "868", "853",
                         "565", "688", "895", "863",
                         "583", "615", "460", "350",
                         "601", "779", "665", "2381",
                         "461", "801", "SV774", "2310",
                         "2336", "2344", "803", "629",
                         "2342", "2345", "840", "SV777", "685", "483", "880", "613", "892", "315", "472", "600", "774", "920", "416", "771", "746", "497", "368", "328", "455", "770", "275", "2110", "409", "846", "355", "638", "435", "639", "220", "851", "539", "2309", "606", "SP315", "2307", "309", "SP343", "898", "786", "306", "232", "712", "298", "804", "634", "433", "793", "2802", "611", "2339", "112", "810", "2335", "", "864", "463", "822", "759", "397", "209", "218", "2114", "783", "944", "630", "476", "249", "900", "265", "833", "584", "2343", "326", "696", "485", "484", "384", "608", "363", "100", "SV363", "390", "2303", "302", "553", "323", "108", "548", "910", "721", "247", "885", "SP265", "2803", "756", "342", "870", "550", "SVA685", "825", "117", "229", "SP810", "2111", "849", "871", "918", "867", "371", "338", "102", "SV483", "812", "711", "2337", "878", "679", "554", "627", "835", "353", "325", "819", "838", "474", "473", "LECD38", "415", "794", "492", "624", "650", "312", "SVA665", "552", "905", "SV779", "361", "329", "623", "2338", "866", "884", "292", "831", "731", "348", "457", "217", "104", "861", "393", "766", "692", "386", "SV394", "790", "300", "850", "859", "919", "2804", "110", "SPA613", "335", "557", "313", "107", "399", "LECD36", "913", "202", "636", "691", "926", "906", "652", "383", "917", "745", "SV606", "669", "378", "422", "555", "954", "842", "936", "426", "2334", "741", "621", "2112", "341", "369", "802", "343", "628", "LECD54", "622", "610", "625", "752", "321", "379", "847", "538", "SP550", "950", "296", "844", "743", "775", "607", "693", "614", "SV790", "LECD50", "SP513", "LECD42", "829", "837", "SV917", "SP766", "862", "883", "843", "897", "558", "848", "SVB665", "LECD40", "852", "SV866", "932", "875", "869", "687", "940", "SV384", "210", "101", "486", "680", "951", "507", "836", "LECD55", "LECD39", "901", "007", "928", "834", "239", "845", "893", "238", "388", "133", "LECD43", "201", "821", "922", "2383", "953", "908", "410", "362", "2308", "SP805", "SVB685", "448", "616", "327", "SV474", "LECD45", "LECD52", "SV669", "651", "LECD56", "809", "006", "LECD49", "010", "778", "626", "678", "014", "LECD44", "925", "SV908", "603", "805"]
    func checkLineExistence(of line: String) -> Bool {
        guard lines.contains(line),
              !line.isEmpty
        else { return false }
        return true
    }
    
}
