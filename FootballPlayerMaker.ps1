
$result = '.\result.log'

function Get-Apikey {
    [String]$apikey = Get-Content .\apikey
    return $apikey        
}

function Select-GenderType {
    write-host 'm: male/f: female'
    $genders = @(
                    "m",
                    "f",
                    "none"
                );
    for ($num = 0; $num -lt $genders.Length; $num++) {
        Write-Host $num ": "$genders[$num]
    }
    $select = Read-Host "<SELECT NUMBER>"
    $str = $genders[$select]
    Write-Host "select: $str"
    return $str
}
function Select-RandomSurnameSetting {
    $choice = @(
                    "yes",
                    "no",
                    "none"
                );
    for ($num = 0; $num -lt $choice.Length; $num++) {
        Write-Host $num ": "$choice[$num]
    }
    $select = Read-Host "<SELECT NUMBER>"
    $str = $choice[$select]
    Write-Host "select: $str"
    return $str
}

function Select-Usage {

    $choice = @(
        "afk",
        "afr",
        "aka",
        "alb",
        "alg",
        "ame",
        "amem",
        "amh",
        "anci",
        "apa",
        "ara",
        "arm",
        "asm",
        "ast",
        "astr",
        "aus",
        "ava",
        "aym",
        "aze",
        "bal",
        "bas",
        "bel",
        "ben",
        "ber",
        "bhu",
        "bibl",
        "bos",
        "bre",
        "bsh",
        "bul",
        "bur",
        "cat",
        "cela",
        "celm",
        "cew",
        "cha",
        "che",
        "chi",
        "chk",
        "cht",
        "chy",
        "cir",
        "cmr",
        "com",
        "cop",
        "cor",
        "cre",
        "cro",
        "crs",
        "cze",
        "dan",
        "dhi",
        "dut",
        "egya",
        "egym",
        "eng",
        "enga",
        "esp",
        "est",
        "eth",
        "ewe",
        "fae",
        "fairy",
        "fij",
        "fil",
        "fin",
        "fle",
        "fntsg",
        "fntsm",
        "fntsr",
        "fntss",
        "fntst",
        "fntsx",
        "fre",
        "fri",
        "ful",
        "gaa",
        "gal",
        "gan",
        "geo",
        "ger",
        "gmca",
        "goth",
        "gre",
        "grea",
        "grem",
        "grn",
        "gua",
        "guj",
        "hau",
        "haw",
        "hb",
        "heb",
        "hin",
        "hippy",
        "hist",
        "hmo",
        "hun",
        "ibi",
        "ice",
        "igb",
        "ind",
        "indm",
        "ing",
        "ins",
        "inu",
        "iri",
        "iro",
        "ita",
        "jap",
        "jav",
        "jer",
        "jew",
        "kan",
        "kaz",
        "khm",
        "kig",
        "kik",
        "kk",
        "kon",
        "kor",
        "kur",
        "kyr",
        "lao",
        "lat",
        "lim",
        "lite",
        "litk",
        "lth",
        "luh",
        "luo",
        "mac",
        "mag",
        "mal",
        "man",
        "mao",
        "map",
        "mar",
        "may",
        "mbu",
        "medi",
        "mlm",
        "mly",
        "moh",
        "mon",
        "morm",
        "mrt",
        "mwe",
        "myth",
        "nah",
        "nav",
        "nde",
        "neaa",
        "neam",
        "nep",
        "nor",
        "nrm",
        "nuu",
        "occ",
        "odi",
        "oji",
        "one",
        "oro",
        "oss",
        "pas",
        "pcd",
        "per",
        "pets",
        "pin",
        "pol",
        "popu",
        "por",
        "pow",
        "pun",
        "que",
        "rap",
        "rmn",
        "roma",
        "romm",
        "rus",
        "sam",
        "sar",
        "sax",
        "scaa",
        "scam",
        "sco",
        "sct",
        "sen",
        "ser",
        "sha",
        "sho",
        "sic",
        "sik",
        "sin",
        "sio",
        "sla",
        "slam",
        "slk",
        "sln",
        "smn",
        "som",
        "sor",
        "sot",
        "spa",
        "swa",
        "swe",
        "swz",
        "tag",
        "tah",
        "taj",
        "tam",
        "tat",
        "tau",
        "tel",
        "tha",
        "theo",
        "tibl",
        "tkm",
        "ton",
        "too",
        "trans",
        "tsw",
        "tum",
        "tup",
        "tur",
        "ukr",
        "urd",
        "urh",
        "usa",
        "uyg",
        "uzb",
        "vari",
        "vie",
        "wel",
        "witch",
        "wrest",
        "xho",
        "yao",
        "yol",
        "yor",
        "zap",
        "zul",
        "none"
                );
    for ($num = 0; $num -lt $choice.Length; $num++) {
        $tmp = $choice[$num]
        Write-Host "$num : $tmp"
    }
    $select = Read-Host "<SELECT NUMBER>"
    $str = $choice[$select]
    Write-Host "select: $str"
    return $str
}

# main
$apikey = Get-Apikey
$gender = ""
$isSurname = ""
$usage = ""
$apicall="https://www.behindthename.com/api/random.json?key=$apikey"


while ($true) {
    Write-Host ""
    Write-Host "[[MAIN FUNCTION]]"
    Write-Host "mode is below."
    Write-Host "start : ENTER"
    Write-Host "gender setting : s"
    Write-Host "Surname setting : c"
    Write-Host "usage setting : d"
    Write-Host "quit : q"
    Write-Host ""
 
    write-host $apicall
 
    $select = Read-Host "<<MODE SELECT>>"
    if(($select -eq 's') -or ($select -eq 'S')){
        if($gender -ne ""){
            $tmp = $apicall -replace "&gender=$gender", ""
            Write-Host $tmp
            $apicall = $tmp
        }

        $gender = Select-GenderType

        if($gender -eq "none"){
            # do nothing
        }else{
            $apicall += "&gender=$gender"
        }
        continue
    }elseif(($select -eq 'c') -or ($select -eq 'C')){
        if($isSurname -ne ""){
            $tmp = $apicall -replace "&randomsurname=$isSurname", ""
            Write-Host $tmp
            $apicall = $tmp
        }

        $isSurname = Select-RandomSurnameSetting

        if($isSurname -eq "none"){
            # do nothing
        }else{
            $apicall += "&randomsurname=$isSurname"
        }
        continue
    }elseif(($select -eq 'd') -or ($select -eq 'D')){
        if($usage -ne ""){
            $tmp = $apicall -Replace "&usage=$usage", ""
            Write-Host $tmp
            $apicall = $tmp
        }

        $usage = Select-Usage

        if($usage -eq "none"){
            $tmp = $apicall.Replace($usage, '')
            $apicall = $tmp.Replace('&usage=', '')
        }else{
            $apicall += "&usage=$usage"
        }
        continue
    }elseif(($select -eq 'q') -or ($select -eq 'Q')){
        Write-Host "terminate this program"
        Start-Sleep 1
        return
    }else{
        $response = Invoke-WebRequest $apicall -UseBasicParsing
 
        write-host $response.Content
        Write-Output $response.Content | Out-File $result -Encoding utf8 -Append
        
        continue
    }
}