@echo off
setlocal enabledelayedexpansion





rem LE CODE ICI





pause>nul&exit

::=================================================================================::
:: Copyright (c) 2021 - Flammrock                                                  ::
::                                                                                 ::
:: Permission is hereby granted, free of charge, to any person obtaining a copy    ::
:: of this software and associated documentation files (the "Software"), to deal   ::
:: in the Software without restriction, including without limitation the rights    ::
:: to use, copy, modify, merge, publish, distribute, sublicense, and/or sell       ::
:: copies of the Software, and to permit persons to whom the Software is           ::
:: furnished to do so, subject to the following conditions:                        ::
::                                                                                 ::
:: The above copyright notice and this permission notice shall be included in all  ::
:: copies or substantial portions of the Software.                                 ::
::                                                                                 ::
:: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      ::
:: IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        ::
:: FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     ::
:: AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          ::
:: LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   ::
:: OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   ::
:: SOFTWARE.                                                                       ::
::=================================================================================::

::================================================================::
::                         PROTOTYPE LIST                         ::
::================================================================::
::   :Date.Create <out:Date> <DataString> <FormatString>
::   :Date.ReBuild <Date> <Day> <Month> <Year>
::   :Date.ShowProperties <Date>
::   :Date.Print <Date> <FormatString> [Locale]
::   :Date.ToString <out:String> <Date> <FormatString> [Locale]
::   :Date.CheckDataFormat <Format> <Start> <Length> <Start2> <Length2> <LocalDataString> <LocalFormatString>
::   :Date.ExtractDataFromFormat <DataString> <Index> <Localformat> <out:Data> <out:Index> <out:Length> <Format>
::   :Date.ParseData <out:Variable> <DataString> <FormatString>
::   :Date.ParseFormat <out:Variable> <FormatString>
::   :Date.LocalFormat.isDay <Localformat> <exit:true|false>
::   :Date.LocalFormat.isMonth <Localformat> <exit:true|false>
::   :Date.LocalFormat.isYear <Localformat> <exit:true|false>
::   :Date.LocalFormat.isHour <Localformat> <exit:true|false>
::   :Date.LocalFormat.isMinute <Localformat> <exit:true|false>
::   :Date.LocalFormat.isSecond <Localformat> <exit:true|false>
::   :Date.IsExistDate <Day> <Month> <Year> <exit:true|false>
::   :Date.IsExistTime <Hour> <Minute> <Second> <exit:true|false>
::   :Date.DateToDayNumber <Day> <Month> <Year> <out:DayNumber>
::   :Date.DayNumberToDate <DayNumber> <out:Day> <out:Month> <out:Year>
::   :Date.ToSecondSinceEpoch <exit:overflow> <out:Seconds> <Day> <Month> <Year> <Hour> <Minute> <Second>
::   :Date.ToTimeStamp <out:Timestamp> <Day> <Month> <Year> <Hour> <Minute> <Second> <GMT_Offset_Minutes>
::   :Date.GetDayIndex <out:Index> <Day> <Month> <Year>
::   :Date.GetDayName <out:Name> <Day> <Month> <Year>
::   :Date.GetDayShortName <out:Name> <Day> <Month> <Year>
::   :Date.GetDayNames <out:Index> <Out:Name> <Out:ShortName> <Day> <Month> <Year>
::   :Date.GetMonthName <out:Name> <Month>
::   :Date.GetMonthShortName <out:Name> <Month>
::   :Date.GetWeekOfMonth <out:WeekOfMonth> <Day> <Month> <Year>
::   :Date.GetWeekOfYear <out:WeekOfYear> <Day> <Month> <Year>
::   :Date.GetDaysInMonth <out:Days> <Month> <Year>
::   :Date.IsLeapYear <exit:true|false> <Year>
::   :Date.GetIdentifierIndex <out:Index> <Identifier> <Start> <End> <Name>
::   :Date.GetDayOfWeekIndex <out:index> <DayName>
::   :Date.GetDayShortOfWeekIndex <out:index> <DayShortName>
::   :Date.GetMonthOfYearIndex <out:index> <MonthName>
::   :Date.GetMonthShortOfYearIndex <out:index> <MonthShortName>
::   :Date.GetDateFromWeekOfYear <out:Day> <out:Month> <out:Year> <DayNumber> <WeekOfYear> <Year>
::   :Date.GetDateFromWeekOfMonth <out:Day> <DayNumber> <WeekOfMonth> <Month> <Year>
::   :Date.DateAddDays <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Days>
::   :Date.DateSubstractDays <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Days>
::   :Date.DateAddMonths <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Months>
::   :Date.DateSubstractMonths <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Months>
::   :Date.DateAddYears <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Years>
::   :Date.DateSubstractYears <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Years>
::   :Date.AddYears <Date> <Years>
::   :Date.SubstractYears <Date> <Years>
::   :Date.AddMonths <Date> <Months>
::   :Date.SubstractMonths <Date> <Months>
::   :Date.AddDays <Date> <Days>
::   :Date.SubstractDays <Date> <Days>
::   :Date.DateAddTime <out:Day> <out:Month> <out:Year> <out:Time> <Day> <Month> <Year> <Time> <Times>
::   :Date.DateSubstractTime <out:Day> <out:Month> <out:Year> <out:Time> <Day> <Month> <Year> <Time> <Times>
::   :Date.AddTime <Date> <Time>
::   :Date.SubstractTime <Date> <Time>
::   :Date.DateGetFrom <DD/MM/YYYY> <out:Year> <out:Month> <out:Day>
::   :Date.DateDiffenceBetweenDate <DD/MM/YYYY> <HH:II:SS> <DD/MM/YYYY> <HH:II:SS> <out:Days> <out:HH:II:SS>
::   :Date.DateDiffenceBetweenDateFormat <DD/MM/YYYY> <HH:II:SS> <DD/MM/YYYY> <HH:II:SS> <out:Year> <out:Month> <out:Week> <out:Day> <out:HH:II:SS>
::   :TimeCalc.Add <HH:II:SS> <HH:II:SS> <out:result>
::   :TimeCalc.Sub <HH:II:SS> <HH:II:SS> <out:result>
::   :TimeCalc.ToSecond <HH:II:SS> <out:Second>
::   :TimeCalc.ToString <Second> <out:result>
::   :Date.BuildCalendar <out:Calendar> <DayFormat> <MonthPerRow> <Year>
::   :Date.BuildCalendarMerge <CalendarMonth1> <CalendarMonth2> <out:CalendarMonthMerged>
::   :Date.BuildMonthCalendar <out:result> <DayFormat> <Month> <Year>
::   :Date.AddLocale <Code> <Days> <DaysShort> <DaysMin> <Months> <MonthsShort>
::   :Date.AddLocale <Code> <Days> <DaysShort> <DaysMin> <Months> <MonthsShort>
::   :Date.ComputeLengthString <out:Length> <Variable>
::   :Date.Error.TimeInvalid
::   :Date.Error.DateInvalid
::   :Date.Init
::================================================================::
::                       END:PROTOTYPE LIST                       ::
::================================================================::

pause>nul&exit

::,--------------,---------------------------------------------------------------------------------------,-------,
::| :Date.Create |                                                                                       |       |
::;--------------'                                                                                       |  #1   |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de cr??er un Objet Date                                                                                |
::|                                                                                                              |
::| @param [in/out] {Date}   Date         - Nom de la variable qui contiendra toutes les informations            |
::|                                                                                                              |
::| @param [in]     {string} DataString   - Une Date sous forme de chaine de caract??res                          |
::|                                         Exemple: "12/09/2021 10:50"                                          |
::|                                         Exemple: "dimanche 12 septembre 2021"                                |
::|                                                                                                              |
::| @param [in]     {string} FormatString - Le format de la Date sous forme de chaine de caract??res,             |
::|                                         ce format doit correspondre ?? celui de [DataString]                  |
::|                                         Exemple: "DD/MM/YYYY HH:II"                                          |
::|                                         Exemple: "dd DD mm YYYY"                                             |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.Create mydate "12/09/2021 10:56:24" "DD/MM/YYYY HH:II:SS"                                      |
::|    call :Date.Create mydate "dimanche 12 septembre 2021" "dd DD mm YYYY"                                     |
::|    call :Date.Create mydate "Jour:7 Semaine:36 Annee:2021" "Jour:DDD \Se\ma\ine:W Annee:YYYY"                |
::|    call :Date.Create mydate "11H07 - dim. [12] sept." "HH\HII - d [DD] m"                                    |
::|                                                                                                              |
::|                                                                                                              |
::| @see Ces functions permettent d'afficher la Date sur la console                                              |
::|                                                                                                              |
::|   :Date.ShowProperties <Date>                                                                                |
::|   :Date.Print <Date> <FormatString> <Locale>                                                                 |
::|   :Date.ToString <out:String> <Date> <FormatString> <Locale>                                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.Create <out:Date> <DataString> <FormatString>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    call :Date.ParseData data "%~2" "%~3" || (
        endlocal
        exit /b 1
    )
    set "properties=Year Month Day Hour Minute Second Timestamp SecondSinceEpoch MonthName DayName MonthShortName DayShortName WeekOfMonth WeekOfYear DayOfWeek"
    set "default_values="
    set "values="
    for /f "tokens=* delims=" %%i in ('WMIC Path Win32_LocalTime Get Day^,Month^,Year /Format:list ^| findstr /r /v "^$"') do (
        if not "%%i"=="" (
            for /f "tokens=1,2 delims==" %%1 in ('echo;%%~i') do (
                set /a val=%%~2
                set default_values=!default_values! "%%1:!val!"
                set "%%1=!val!"
            )
        )
    )
    for /f "tokens=* delims=" %%i in ('WMIC OS Get CurrentTimeZone ^| findstr /r /v "^$"') do set /a "CurrentTimeZone=%%~i"
    set default_values=!default_values! "CurrentTimeZone:!CurrentTimeZone!"
    set "p=Day Month Year Hour Minute Second"
    set isday=0
    set ismonth=0
    set "dayname="
    set "dayshortname="
    set "wm="
    set "wy="
    set di=-1
    set monthindext=-1
    for %%f in (Hour Minute Second) do set "%%~f=0"
    for /l %%i in (0,1,!data.Size!) do (
        for %%d in ("!data[%%i].Data!") do (
            for %%f in (!p!) do (
                call :Date.LocalFormat.is%%f !data[%%i].Format! && (
                    set /a "_tmp=!Date.RemoveLeadingZero:zero=%%~d!"
                    set values=!values! "%%f:!_tmp!"
                    set "%%f=!_tmp!"
                    if "%%f"=="Day" set isday=1
                    if "%%f"=="Month" set ismonth=1
                )
            )
            if "!data[%%i].Format!"=="DDD" set /a "di=%%~d-1"
            if "!data[%%i].Format!"=="DDDD" set /a "di=%%~d-1"
            if "!data[%%i].Format!"=="mm" set "monthname=%%~d"
            if "!data[%%i].Format!"=="m" set "monthshortname=%%~d"
            if "!data[%%i].Format!"=="dd" set "dayname=%%~d"
            if "!data[%%i].Format!"=="d" set "dayshortname=%%~d"
            if "!data[%%i].Format!"=="w" set "wm=%%~d"
            if "!data[%%i].Format!"=="W" set "wy=%%~d"
        )
    )
    if not "!di!"=="-1" (
        if !di! lss 0 goto :Date.Error.DateInvalid
        if !di! gtr 6 goto :Date.Error.DateInvalid
    )
    if not "!dayname!"=="" if not "!dayshortname!"=="" (
        call :Date.GetDayOfWeekIndex dayindext "!dayname!" || goto :Date.Error.DateInvalid
        call :Date.GetDayShortOfWeekIndex dayindext2 "!dayshortname!" || goto :Date.Error.DateInvalid
        if not "!dayindext!"=="!dayindext2!" goto :Date.Error.DateInvalid
    )
    if not "!monthname!"=="" call :Date.GetMonthOfYearIndex monthindext "!monthname!" || goto :Date.Error.DateInvalid
    if not "!monthshortname!"=="" call :Date.GetMonthShortOfYearIndex monthindext "!monthshortname!" || goto :Date.Error.DateInvalid
    if not "!monthname!"=="" if not "!monthshortname!"=="" (
        call :Date.GetMonthOfYearIndex monthindext "!monthname!" || goto :Date.Error.DateInvalid
        call :Date.GetMonthShortOfYearIndex monthindext2 "!monthshortname!" || goto :Date.Error.DateInvalid
        if not "!monthindext!"=="!monthindext2!" goto :Date.Error.DateInvalid
    )
    set /a monthindext+=1
    if "!ismonth!"=="1" (
        if not "!monthindext!"=="0" (
            if not "!monthindext!"=="!Month!" goto :Date.Error.DateInvalid
        )
    ) else (
        if "!monthindext!"=="0" set monthindext=1
        set Month=!monthindext!
        set ismonth=1
        set values=!values! "Month:!Month!"
    )
    if "!isday!"=="0" (
        set dayt=1
        set dayindext=!di!
        if not "!dayname!"=="" (
            call :Date.GetDayOfWeekIndex dayindext "!dayname!" || goto :Date.Error.DateInvalid
            if not "!di!"=="-1" if not "!di!"=="!dayindext!" goto :Date.Error.DateInvalid
        )
        if not "!dayshortname!"=="" (
            call :Date.GetDayShortOfWeekIndex dayindext "!dayshortname!" || goto :Date.Error.DateInvalid
            if not "!di!"=="-1" if not "!di!"=="!dayindext!" goto :Date.Error.DateInvalid
        )
        if not "!dayindext!"=="-1" (
            if not "!wy!"=="" (
                set /a dayindext+=1
                call :Date.GetDateFromWeekOfYear dayt montht yeart "!dayindext!" "!wy!" "!Year!"
                if not "!ismonth!"=="0" (
                    if not "!montht!"=="!Month!" goto :Date.Error.DateInvalid
                ) else (
                    set ismonth=1
                    set Month=!montht!
                    set values=!values! "Month:!Month!"
                )
                if not "!Year!"=="!yeart!" goto :Date.Error.DateInvalid
            ) else if not "!wm!"=="" (
                set /a dayindext+=1
                if "!ismonth!"=="0" (
                    set ismonth=1
                    set values=!values! "Month:1"
                    set Month=1
                )
                call :Date.GetDateFromWeekOfMonth dayt "!dayindext!" "!wm!" "!Month!" "!Year!" || goto :Date.Error.DateInvalid
            ) else (
                if "!ismonth!"=="0" (
                    set ismonth=1
                    set values=!values! "Month:1"
                    set Month=1
                )
                call :Date.GetDayIndex findex 01 "!Month!" "!Year!"
                set /a "dayt=((!dayindext!-!findex!+7) %% 7)+1"
            )
        )
        set values=!values! "Day:!dayt!"
        set Day=!dayt!
    ) else (
        if not "!dayname!"=="" (
            call :Date.GetDayOfWeekIndex dayindext "!dayname!" || goto :Date.Error.DateInvalid
            call :Date.GetDayNames dayindex dayname dayshortname !Day! !Month! !Year!
            if not "!dayindex!"=="!dayindext!" goto :Date.Error.DateInvalid
        )
        if not "!dayshortname!"=="" (
            call :Date.GetDayShortOfWeekIndex dayindext "!dayshortname!" || goto :Date.Error.DateInvalid
            call :Date.GetDayNames dayindex dayname dayshortname !Day! !Month! !Year!
            if not "!dayindex!"=="!dayindext!" goto :Date.Error.DateInvalid
        )
    )
    if "!ismonth!"=="0" (
        set ismonth=1
        set values=!values! "Month:1"
        set Month=1
    )
    call :Date.IsExistDate !Day! !Month! !Year! || goto :Date.Error.DateInvalid
    call :Date.IsExistTime !Hour! !Minute! !Second! || goto :Date.Error.TimeInvalid
    call :Date.ToTimeStamp timestamp !Day! !Month! !Year! !Hour! !Minute! !Second! !CurrentTimeZone! && (
        set /a "secondsinceepoch=!timestamp!+(!CurrentTimeZone!*60)"
    ) || (
        for /f "tokens=*" %%i in ('powershell -Command "!timestamp!+^(!CurrentTimeZone!*60^)"') do set "secondsinceepoch=%%~i"
    )
    call :Date.GetDayNames dayindex dayname dayshortname !Day! !Month! !Year!
    call :Date.GetMonthName monthname !Month!
    call :Date.GetMonthShortName monthshortname !Month!
    set /a dayindex+=1
    if not "!di!"=="-1" (
        set /a di+=1
        if not "!di!"=="!dayindex!" goto :Date.Error.DateInvalid
    )
    call :Date.GetWeekOfMonth weekofmonth !Day! !Month! !Year!
    call :Date.GetWeekOfYear weekofyear !Day! !Month! !Year!
    if not "!wm!"=="" if not "!wm!"=="!weekofmonth!" goto :Date.Error.DateInvalid
    if not "!wy!"=="" if not "!wy!"=="!weekofyear!" goto :Date.Error.DateInvalid
    (
        endlocal
        set "%~1.ObjectType=Date"
        for %%f in (%p%) do set "%~1.%%f=0"
        for %%d in (%default_values%) do (
            for /f "tokens=1,* delims=:" %%1 in ('echo;%%~d') do (
                set "%~1.%%1=%%2"
            )
        )
        for %%d in (%values%) do (
            for /f "tokens=1,* delims=:" %%1 in ('echo;%%~d') do (
                set "%~1.%%1=%%2"
            )
        )
        set "%~1.Properties=%properties%"
        set "%~1.Timestamp=%timestamp%"
        set "%~1.SecondSinceEpoch=%secondsinceepoch%"
        set "%~1.DayName=%dayname%"
        set "%~1.DayShortName=%dayshortname%"
        set "%~1.MonthName=%monthname%"
        set "%~1.MonthShortName=%monthshortname%"
        set "%~1.DayOfWeek=%dayindex%"
        set "%~1.WeekOfMonth=%weekofmonth%"
        set "%~1.WeekOfYear=%weekofyear%"
    )
exit /b 0

::,---------------,--------------------------------------------------------------------------------------,-------,
::| :Date.Rebuild |                                                                                      |       |
::;---------------'                                                                                      |  #2   |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de reconstruire un Object Date ?? partir du jour, mois, ann??e                                          |
::|                                                                                                              |
::| @param [in/out] {Date}   Date      - Nom de la variable qui contient l'Objet Date ?? mettre ?? jour            |
::|                                    vers une nouvelle date DD/MM/YYYY                                         |
::|                                                                                                              |
::| @param [in]     {number} Day     - Le jour du mois (de 1 ?? 31)                                               |
::|                                                                                                              |
::| @param [in]     {number} Month   - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [in]     {number} Year    - L'ann??e                                                                   |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    rem on cr???? la date                                                                                       |
::|    call :Date.Create mydate "12/09/2021 10:56:24" "DD/MM/YYYY HH:II:SS"                                      |
::|                                                                                                              |
::|    rem on met ?? jour l'Objet Date vers une autre date (toutes les propri??t??s sont mises ?? jour)              |
::|    call :Date.ReBuild mydate 25 03 2015                                                                      |
::|                                                                                                              |
::| @see Ces functions permettent d'afficher la Date sur la console                                              |
::|                                                                                                              |
::|   :Date.ShowProperties <Date>                                                                                |
::|   :Date.Print <Date> <FormatString> <Locale>                                                                 |
::|   :Date.ToString <out:String> <Date> <FormatString> <Locale>                                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.ReBuild <Date> <Day> <Month> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a "Day=!Date.r:z=%~2!"&set /a "Month=!Date.r:z=%~3!"&set /a "Year=!Date.r:z=%~4!"
    call :Date.IsExistDate !Day! !Month! !Year! || goto :Date.Error.DateInvalid
    call :Date.ToTimeStamp timestamp !Day! !Month! !Year! !%~1.Hour! !%~1.Minute! !%~1.Second! !%~1.CurrentTimeZone! && (
        set /a "secondsinceepoch=!timestamp!+(!%~1.CurrentTimeZone!*60)"
    ) || (
        for /f "tokens=*" %%i in ('powershell -Command "!timestamp!+^(!%~1.CurrentTimeZone!*60^)"') do set "secondsinceepoch=%%~i"
    )
    call :Date.GetDayNames dayindex dayname dayshortname !Day! !Month! !Year!
    call :Date.GetMonthName monthname !Month!
    call :Date.GetMonthShortName monthshortname !Month!
    set /a dayindex+=1
    call :Date.GetWeekOfMonth weekofmonth !Day! !Month! !Year!
    call :Date.GetWeekOfYear weekofyear !Day! !Month! !Year!
    (
        endlocal
        set "%~1.Day=%Day%"
        set "%~1.Month=%Month%"
        set "%~1.Year=%Year%"
        set "%~1.Timestamp=%timestamp%"
        set "%~1.SecondSinceEpoch=%secondsinceepoch%"
        set "%~1.DayName=%dayname%"
        set "%~1.DayShortName=%dayshortname%"
        set "%~1.MonthName=%monthname%"
        set "%~1.MonthShortName=%monthshortname%"
        set "%~1.DayOfWeek=%dayindex%"
        set "%~1.WeekOfMonth=%weekofmonth%"
        set "%~1.WeekOfYear=%weekofyear%"
    )
exit /b 0

::,----------------------,-------------------------------------------------------------------------------,-------,
::| :Date.ShowProperties |                                                                               |       |
::;----------------------'                                                                               |  #3   |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'afficher toutes les propri??t??s de l'Object Date                                                     |
::|                                                                                                              |
::| @param [in] {Date} Date     - Nom de la variable qui contient l'Objet Date                                   |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    rem on cr???? la date                                                                                       |
::|    call :Date.Create mydate "12/09/2021 10:56:24" "DD/MM/YYYY HH:II:SS"                                      |
::|                                                                                                              |
::|    rem on affiche les propri??t??s                                                                             |
::|    call :Date.ShowProperties mydate                                                                          |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.ShowProperties <Date>
    for %%p in (!%~1.Properties!) do echo;%~1.%%p=!%~1.%%p!
exit /b 0

::,-------------,----------------------------------------------------------------------------------------,-------,
::| :Date.Print |                                                                                        |       |
::;-------------'                                                                                        |  #4   |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'afficher un Objet Date en sp??cifiant un format et une locale (langue)                               |
::|                                                                                                              |
::| @param [in] {Date}   Date              - Nom de la variable qui contient l'Objet Date                        |
::|                                                                                                              |
::| @param [in] {string} FormatString      - le Format d'Output sous forme de chaine de caract??res               |
::|                                                                                                              |
::| @param [in] {string} Locale (optional) - Le language qui sera utilis?? pour afficher le nom des jours/mois    |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    rem on cr???? la date                                                                                       |
::|    call :Date.Create mydate "12/09/2021 10:56:24" "DD/MM/YYYY HH:II:SS"                                      |
::|                                                                                                              |
::|    rem on affiche l'Objet Date                                                                               |
::|    call :Date.Print mydate "dd DD mm YYYY"                                                                   |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.Print <Date> <FormatString> [Locale]
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    call :Date.ToString s "%~1" "%~2" "%~3"
    echo;!s!
    endlocal
exit /b 0

::,----------------,-------------------------------------------------------------------------------------,-------,
::| :Date.ToString |                                                                                     |       |
::;----------------'                                                                                     |  #5   |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de construire l'affichage d'un Objet Date dans une variable en sp??cifiant un format                   |
::| et une locale (langue)                                                                                       |
::|                                                                                                              |
::| @param [out] {variable} String            - Nom de la variable qui contientra le r??sultat                    |
::|                                                                                                              |
::| @param [in]  {Date}     Date              - Nom de la variable qui contient l'Objet Date                     |
::|                                                                                                              |
::| @param [in]  {string}   FormatString      - le Format d'Output sous forme de chaine de caract??res            |
::|                                                                                                              |
::| @param [in]  {string}   Locale (optional) - Le language qui sera utilis?? pour afficher le nom des jours/mois |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    rem on cr???? la date                                                                                       |
::|    call :Date.Create mydate "12/09/2021 10:56:24" "DD/MM/YYYY HH:II:SS"                                      |
::|                                                                                                              |
::|    rem on construit l'affichage                                                                              |
::|    call :Date.ToString mystring mydate "dd DD mm YYYY"                                                       |
::|                                                                                                              |
::|    rem on peut ensuite par exemple afficher la variable :                                                    |
::|    echo %mystring%                                                                                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.ToString <out:String> <Date> <FormatString> [Locale]
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set "savelocale=!Date.Locale!"
    if not "%~4"=="" (
        set Date.Language[%~4] >nul 2>&1 || goto :Date.Error.LocaleInvalid
        set "Date.Locale=%~4"
    )
    set "format=%~3"
    call :Date.ParseFormat formatobj "!format!"
    set "formate=!format!"
    for %%m in (!formatobj.MagicNumber!) do set "formate=!formate:\\=%%m!"
    set "formate=!formate:\=!"
    for %%m in (!formatobj.MagicNumber!) do set "formate=!formate:%%m=\!"
    set index=0
    set indexend2=0
    set offset2=0
    set "data="
    for /l %%i in (0,1,!formatobj.Size!) do (
        set /a indexstart2=!indexend2!+!offset2!
        set /a indexend2=!formatobj[%%i].Position!
        set /a len2=!indexend2!-!indexstart2!
        set offset2=!formatobj[%%i].Length!
        for /f "tokens=1-4 delims= " %%1 in ('echo;!indexstart2! !len2!') do (
            set "data=!data!!formate:~%%1,%%2!"
        )
        if "!formatobj[%%i].Format!"=="YYYY" (
            set "data=!data!!%~2.Year!"
        ) else if "!formatobj[%%i].Format!"=="MM" (
            set t=!%~2.Month!
            if !t! lss 10 set t=0!t!
            set "data=!data!!t!"
        ) else if "!formatobj[%%i].Format!"=="M" (
            set "data=!data!!%~2.Month!"
        ) else if "!formatobj[%%i].Format!"=="DD" (
            set t=!%~2.Day!
            if !t! lss 10 set t=0!t!
            set "data=!data!!t!"
        ) else if "!formatobj[%%i].Format!"=="D" (
            set "data=!data!!%~2.Day!"
        ) else if "!formatobj[%%i].Format!"=="HH" (
            set t=!%~2.Hour!
            if !t! lss 10 set t=0!t!
            set "data=!data!!t!"
        ) else if "!formatobj[%%i].Format!"=="H" (
            set "data=!data!!%~2.Hour!"
        ) else if "!formatobj[%%i].Format!"=="II" (
            set t=!%~2.Minute!
            if !t! lss 10 set t=0!t!
            set "data=!data!!t!"
        ) else if "!formatobj[%%i].Format!"=="I" (
            set "data=!data!!%~2.Minute!"
        ) else if "!formatobj[%%i].Format!"=="SS" (
            set t=!%~2.Second!
            if !t! lss 10 set t=0!t!
            set "data=!data!!t!"
        ) else if "!formatobj[%%i].Format!"=="S" (
            set "data=!data!!%~2.Second!"
        ) else if "!formatobj[%%i].Format!"=="WW" (
            set t=!%~2.WeekOfYear!
            if !t! lss 10 set t=0!t!
            set "data=!data!!t!"
        ) else if "!formatobj[%%i].Format!"=="ww" (
            set t=!%~2.WeekOfMonth!
            if !t! lss 10 set t=0!t!
            set "data=!data!!t!"
        ) else if "!formatobj[%%i].Format!"=="W" (
            set "data=!data!!%~2.WeekOfYear!"
        ) else if "!formatobj[%%i].Format!"=="w" (
            set "data=!data!!%~2.WeekOfMonth!"
        ) else if "!formatobj[%%i].Format!"=="DDDD" (
            set t=!%~2.DayOfWeek!
            if !t! lss 10 set t=0!t!
            set "data=!data!!t!"
        ) else if "!formatobj[%%i].Format!"=="DDD" (
            set "data=!data!!%~2.DayOfWeek!"
        ) else if "!formatobj[%%i].Format!"=="dd" (
            set "data=!data!!%~2.DayName!"
        ) else if "!formatobj[%%i].Format!"=="d" (
            set "data=!data!!%~2.DayShortName!"
        ) else if "!formatobj[%%i].Format!"=="mm" (
            set "data=!data!!%~2.MonthName!"
        ) else if "!formatobj[%%i].Format!"=="m" (
            set "data=!data!!%~2.MonthShortName!"
        ) else if "!formatobj[%%i].Format!"=="T" (
            set "data=!data!!%~2.Timestamp!"
        ) else if "!formatobj[%%i].Format!"=="t" (
            set "data=!data!!%~2.SecondSinceEpoch!"
        )
    )
    set /a indexstart2=!indexend2!+!offset2!
    set /a len2=!formatobj.StringLength!-!indexstart2!
    for /f "tokens=1-4 delims= " %%1 in ('echo;!indexstart2! !len2!') do (
        set "data=!data!!formate:~%%1,%%2!"
    )
    set "Date.Locale=!savelocale!"
    (
        endlocal
        set "%~1=%data%"
    )
exit /b 0

::,-----------------------,------------------------------------------------------------------------------,-------,
::| :Date.CheckDataFormat | @PRIVATE                                                                     |       |
::;-----------------------'                                                                              |  #6   |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de tester si une chaine de caract??res entre [start,start+length] est ??gale ?? une autre chaine de      |
::| de caract??res entre [start2,start2+length2]                                                                  |
::| et une locale (langue)                                                                                       |
::| (la 2??me chaine de caract??res est ??chapp??e (caract??re d'??chappement '\'))                                    |
::|                                                                                                              |
::| @param [in] {Format} Format             - Nom de la variable qui contient un Objet Format                    |
::|                                           (parser avec :Date.ParseFormat)                                    |
::|                                                                                                              |
::| @param [in]  {number} Start             - Indice de d??but (LocalDataString)                                  |
::|                                                                                                              |
::| @param [in]  {number} Length            - Longueur (LocalDataString)                                         |
::|                                                                                                              |
::| @param [in]  {number} Start2            - Indice de d??but (LocalFormatString)                                |
::|                                                                                                              |
::| @param [in]  {number} Length2           - Longueur (LocalFormatString)                                       |
::|                                                                                                              |
::| @param [in]  {string} LocalDataString   - La chaine de caract??res des donn??es                                |
::|                                                                                                              |
::| @param [in]  {string} LocalFormatString - La chaine de caract??res du format                                  |
::|                                                                                                              |
::| @See :Date.ParseData pour comprendre comment elle est utilis??e                                               |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.CheckDataFormat <Format> <Start> <Length> <Start2> <Length2> <LocalDataString> <LocalFormatString>
    setlocal enabledelayedexpansion
    set "data=%~6"&set "format=%~7"
    for %%m in (!%~1.MagicNumber!) do set "format=!format:\\=%%m!"
    set "format=!format:\=!"
    for %%m in (!%~1.MagicNumber!) do set "format=!format:%%m=\!"
    if "!data:~%~2,%~3!"=="!format:~%~4,%~5!" (
        endlocal
        exit /b 0
    )
    endlocal
exit /b 1

::,-----------------------------,------------------------------------------------------------------------,-------,
::| :Date.ExtractDataFromFormat | @PRIVATE                                                               |       |
::;-----------------------------'                                                                        |  #7   |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| A partir d'un indice de d??but et du type du format (DD,MM,YYYY,d,dd,...), cette fonction extrait les donn??es |
::| qui correspondent au format                                                                                  |
::|                                                                                                              |
::| @param [in]  {string}      DataString    - La chaine de caract??re qui contient les donn??es                   |
::|                                                                                                              |
::| @param [in]  {number}      Index         - La position du curseur virtuel                                    |
::|                                            (l'analyse d??marrera ?? cette position)                            |
::|                                                                                                              |
::| @param [in]  {Localformat} Localformat   - Un ??l??ment de l'Objet Format pars??                                |
::|                                                                                                              |
::| @param [out] {string}      Data          - La chaine de caract??re extrait qui correspond au LocalFormat      |
::|                                                                                                              |
::| @param [out] {number}      Index         - La nouvelle position du curseur                                   |
::|                                                                                                              |
::| @param [out] {number}      Length        - La taille de la chaine de caract??res Data extrait                 |
::|                                                                                                              |
::| @param [in]  {Format}      Format        - L'objet Format                                                    |
::|                                                                                                              |
::| @See :Date.ParseData pour comprendre comment elle est utilis??e                                               |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.ExtractDataFromFormat <DataString> <Index> <Localformat> <out:Data> <out:Index> <out:Length> <Format>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a index=%~2+!%~3.Position!
    set len=0
    set "data=%~1"
    set "_tmp="
    set isnumber=1
    for %%i in (dd d mm m) do (
        if "!%~3.Format!"=="%%i" (
            set isnumber=0
        )
    )
    set minnumberofdigit=1
    set maxnumberofdigit=2
    if "!%~3.Format!"=="YYYY" (
        set minnumberofdigit=-1
        set maxnumberofdigit=-1
    )
    :Date.ExtractDataFromFormat.Loop
        set "ch=!data:~%index%,1!"
        if "!ch!"=="" (
            if "!_tmp!"=="" (
                endlocal
                exit /b 1
            )
            goto :Date.ExtractDataFromFormat.LoopEnd
        )
        if "!isnumber!"=="1" (
            set "test="&for /f "delims=0123456789" %%i in ("!ch!") do set "test=%%i"
        ) else (
            if "!%~3.Format!"=="d" (
                set "test="&for /f "delims=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz." %%i in ("!ch!") do set "test=%%i"
            ) else if "!%~3.Format!"=="m" (
                set "test="&for /f "delims=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz." %%i in ("!ch!") do set "test=%%i"
            ) else (
                set "test="&for /f "delims=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" %%i in ("!ch!") do set "test=%%i"
            )
        )
        if not "!test!"=="" (
            if "!_tmp!"=="" (
                endlocal
                exit /b 1
            )
            if "!isnumber!"=="1" (
                if !minnumberofdigit! neq -1 (
                    if !len! lss !minnumberofdigit! (
                        endlocal
                        exit /b 1
                    )
                )
            )
            goto :Date.ExtractDataFromFormat.LoopEnd
        )
        if "!isnumber!"=="0" (
            if !len! gtr 0 (
                (
                    set Date.Language[!Date.Locale!].Data.!%~3.Format!.!_tmp!!ch! || (
                        set Date.Language[!Date.Locale!].Data.!%~3.Format!.!_tmp! && (
                            goto :Date.ExtractDataFromFormat.LoopEnd
                        ) || (
                            endlocal
                            exit /b 1
                        )
                    )
                )>nul 2>&1
            )
        )
        set "_tmp=!_tmp!!ch!"
        set /a index+=1
        set /a len+=1
        if "!isnumber!"=="1" (
            if !maxnumberofdigit! neq -1 (
                if !len! geq !maxnumberofdigit! goto :Date.ExtractDataFromFormat.LoopEnd
            )
        )
    goto :Date.ExtractDataFromFormat.Loop
    :Date.ExtractDataFromFormat.LoopEnd
    set /a "indexoffset=%~2+(!len!-!%~3.Length!)"
    (
        endlocal
        set "%~4=%_tmp%"
        set /a %~5=%indexoffset%
        set %~6=%len%
    )
exit /b 0

::,-----------------,------------------------------------------------------------------------------------,-------,
::| :Date.ParseData |                                                                                    |       |
::;-----------------'                                                                                    |  #8   |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de parser une date (qui est sous forme de caract??res) ?? partir du format dans lequel elle est         |
::|                                                                                                              |
::| @param [in/out]  {Data}    Variable      - La variable qui contiendra les donn??es sous forme d'objet Data    |
::|                                                                                                              |
::| @param [in]      {string}  DataString    - La chaine de caract??re qui contient les donn??es                   |
::|                                                                                                              |
::| @param [in]      {string}  FormatString  - La chaine de caract??re qui contient le format                     |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    setlocal enabledelayedexpansion                                                                           |
::|    call :Date.ParseData data "12/09/2021 10:56:24" "DD/MM/YYYY HH:II:SS"                                     |
::|    for /l %%i in (0,1,!data.Size!) do (                                                                      |
::|        echo;Data[%%i]:                                                                                       |
::|        echo;  .Data   : !data[%%i].Data!                                                                     |
::|        echo;  .Format : !data[%%i].Format!                                                                   |
::|        echo;  .Length : !data[%%i].Length!                                                                   |
::|        echo;===================================                                                              |
::|    )                                                                                                         |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.ParseData <out:Variable> <DataString> <FormatString>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set "format=%~3"
    call :Date.ParseFormat formatobj "%~3"
    set "formate=!format!"
    for %%m in (!formatobj.MagicNumber!) do set "formate=!formate:\\=%%m!"
    set "formate=!formate:\=!"
    for %%m in (!formatobj.MagicNumber!) do set "formate=!formate:%%m=\!"
    set index=0
    set indexend=0&set indexend2=0
    set offset=0&set offset2=0
    set "data=%~2"
    set datalength=0
    set "parsedData="
    for /l %%i in (0,1,!formatobj.Size!) do (
        set /a indexstart=!indexend!+!offset!
        set /a indexend=!formatobj[%%i].Position!+!index!
        set /a indexstart2=!indexend2!+!offset2!
        set /a indexend2=!formatobj[%%i].Position!
        call :Date.ExtractDataFromFormat "!data!" "!index!" "formatobj[%%i]" localdata index length "%~3" || (
            endlocal
            echo;Error: Format and Date not match
            exit /b 1
        )
        set /a len=!indexend!-!indexstart!&set /a len2=!indexend2!-!indexstart2!
        set offset=!length!
        set parsedData=!parsedData! "!datalength!:!localdata!:!length!:!formatobj[%%i].Format!"
        set /a datalength+=1
        set offset2=!formatobj[%%i].Length!
        for /f "tokens=1-4 delims= " %%1 in ('echo;!indexstart! !len! !indexstart2! !len2!') do (
            call :Date.CheckDataFormat formatobj "!indexstart!" "!len!" "!indexstart2!" "!len2!" "!data!" "!format!" || (
               endlocal
               echo;Error: Format and Date not match
               exit /b 1
            )
        )
    )
    set /a datasize=!datalength!-1
    (
        endlocal
        set %~1.Length=%datalength%
        set %~1.Size=%datasize%
        for %%i in (%parsedData%) do (
            for /f "tokens=1-4 delims=:" %%1 in ('echo;%%~i') do (
                set "%~1[%%1].Data=%%2"
                set "%~1[%%1].Length=%%3"
                set "%~1[%%1].Format=%%4"
            )
        )
    )
exit /b 0

::,-------------------,----------------------------------------------------------------------------------,-------,
::| :Date.ParseFormat |                                                                                  |       |
::;-------------------'                                                                                  |  #9   |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de parser un format                                                                                   |
::|                                                                                                              |
::| @param [in/out]  {Format}  Variable      - La variable qui contiendra le format sous forme d'objet Format    |
::|                                                                                                              |
::| @param [in]      {string}  FormatString  - La chaine de caract??re qui contient le format                     |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    setlocal enabledelayedexpansion                                                                           |
::|    call :Date.ParseFormat format "DD/MM/YYYY HH:II:SS"                                                       |
::|    for /l %%i in (0,1,!format.Size!) do (                                                                    |
::|        echo;Format[%%i]:                                                                                     |
::|        echo;  .Format   : !format[%%i].Format!                                                               |
::|        echo;  .Position : !format[%%i].Position!                                                             |
::|        echo;  .Length   : !format[%%i].Length!                                                               |
::|        echo;===================================                                                              |
::|    )                                                                                                         |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.ParseFormat <out:Variable> <FormatString>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set "format=%~2"
    set "_tmp="
    set i=0
    set istart=0
    set len=0
    set length=0
    set data=
    set skip=0
    for %%i in (DDDD DDD DD D d dd MM M mm m YYYY HH H II I SS S w W ww WW t T) do set Date.Format.%%i=1
    set ii=0
    :Date.ParseFormat.LoopChar
    for %%q in (!ii!) do for %%b in ("!format:~%%q,1!") do (
        if !skip! gtr 0 set /a skip-=1
        if "!skip!"=="0" if "%%~b"=="\" (
            set skip=2
            if not "!_tmp!"=="" (
                set "data=!data! !length!:!_tmp!:!istart!:!len!"
                set len=0
                set "_tmp="
                set /a length+=1
            )
            set /a istart=!i!+1
            set /a i-=1
        )
        if "!skip!"=="0" (
            set v=0
            for %%i in (d m y h s D M Y H I S w W t T) do if "%%~b"=="%%i" set v=1
            if "!v!"=="1" if not "!_tmp!"=="" if not "%%~b"=="!_tmp:~0,1!" set v=2
            (
                set Date.Format.!_tmp!%%~b || (
                    set Date.Format.!_tmp! && (
                        if "!v!"=="1" set /a v+=1
                    )
                )
            )>nul 2>&1
            if "!v!"=="1" (
                set "_tmp=!_tmp!%%~b"
                set /a len+=1
            ) else (
                if not "!_tmp!"=="" (
                    set "data=!data! !length!:!_tmp!:!istart!:!len!"
                    set len=0
                    set /a istart=!i!+1
                    set /a length+=1
                )
                if "!v!"=="2" (
                    set "_tmp=%%~b"
                    set len=1
                    set istart=!i!
                ) else (
                    set "_tmp="
                    set len=0
                    set /a istart=!i!+1
                )
            )
        )
        set /a i+=1
    )
    set /a ii+=1
    for %%q in (!ii!) do if not "!format:~%%~q,1!"=="" goto :Date.ParseFormat.LoopChar
    if not "!_tmp!"=="" (
        set "data=!data! !length!:!_tmp!:!istart!:!len!"
        set /a length+=1
    )
    set /a totallength=!istart!+!len!
    :Date.ParseFormat.Loop
    set magicnumber=!random!!random!
    for %%m in (%magicnumber%) do if not "!format:%%m=!"=="!format!" goto :Date.ParseFormat.Loop
    (
        endlocal
        set %~1.MagicNumber=%magicnumber%
        set %~1.Length=%length%
        set %~1.StringLength=%totallength%
        set /a %~1.Size=%length%-1
        for %%i in (%data:~1%) do (
            for /f "tokens=1-4 delims=:" %%1 in ('echo;%%i') do (
                set "%~1[%%1].Format=%%2"
                set "%~1[%%1].Position=%%3"
                set "%~1[%%1].Length=%%4"
            )
        )
    )
exit /b 0

::,-------------------------,----------------------------------------------------------------------------,-------,
::| :Date.LocalFormat.isDay |                                                                            |       |
::;-------------------------'                                                                            |  #10  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir si un format (MM,d,dd,DD,YYYY,...) correspond au jour                                       |
::|                                                                                                              |
::| @param [in]  {Localformat} Localformat - Un ??l??ment de l'Objet Format pars??                                  |
::|                                                                                                              |
::| @return 0 => true                                                                                            |
::|         1 => false                                                                                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.LocalFormat.isDay <Localformat> <exit:true|false>
    for %%i in (DD D) do if "%~1"=="%%~i" exit /b 0
exit /b 1

::,---------------------------,--------------------------------------------------------------------------,-------,
::| :Date.LocalFormat.isMonth |                                                                          |       |
::;---------------------------'                                                                          |  #11  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir si un format (MM,d,dd,DD,YYYY,...) correspond au mois                                       |
::|                                                                                                              |
::| @param [in]  {Localformat} Localformat - Un ??l??ment de l'Objet Format pars??                                  |
::|                                                                                                              |
::| @return 0 => true                                                                                            |
::|         1 => false                                                                                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.LocalFormat.isMonth <Localformat> <exit:true|false>
    for %%i in (MM M) do if "%~1"=="%%~i" exit /b 0
exit /b 1

::,--------------------------,---------------------------------------------------------------------------,-------,
::| :Date.LocalFormat.isYear |                                                                           |       |
::;--------------------------'                                                                           |  #12  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir si un format (MM,d,dd,DD,YYYY,...) correspond ?? l'ann??e                                     |
::|                                                                                                              |
::| @param [in]  {Localformat} Localformat - Un ??l??ment de l'Objet Format pars??                                  |
::|                                                                                                              |
::| @return 0 => true                                                                                            |
::|         1 => false                                                                                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.LocalFormat.isYear <Localformat> <exit:true|false>
    for %%i in (YYYY YY) do if "%~1"=="%%~i" exit /b 0
exit /b 1

::,--------------------------,---------------------------------------------------------------------------,-------,
::| :Date.LocalFormat.isHour |                                                                           |       |
::;--------------------------'                                                                           |  #13  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir si un format (MM,d,dd,DD,YYYY,...) correspond ?? l'heure                                     |
::|                                                                                                              |
::| @param [in]  {Localformat} Localformat - Un ??l??ment de l'Objet Format pars??                                  |
::|                                                                                                              |
::| @return 0 => true                                                                                            |
::|         1 => false                                                                                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.LocalFormat.isHour <Localformat> <exit:true|false>
    for %%i in (HH H) do if "%~1"=="%%~i" exit /b 0
exit /b 1

::,----------------------------,-------------------------------------------------------------------------,-------,
::| :Date.LocalFormat.isMinute |                                                                         |       |
::;----------------------------'                                                                         |  #14  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir si un format (MM,d,dd,DD,YYYY,...) correspond ?? la minute                                   |
::|                                                                                                              |
::| @param [in]  {Localformat} Localformat - Un ??l??ment de l'Objet Format pars??                                  |
::|                                                                                                              |
::| @return 0 => true                                                                                            |
::|         1 => false                                                                                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.LocalFormat.isMinute <Localformat> <exit:true|false>
    for %%i in (II I) do if "%~1"=="%%~i" exit /b 0
exit /b 1

::,----------------------------,-------------------------------------------------------------------------,-------,
::| :Date.LocalFormat.isSecond |                                                                         |       |
::;----------------------------'                                                                         |  #15  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir si un format (MM,d,dd,DD,YYYY,...) correspond ?? la seconde                                  |
::|                                                                                                              |
::| @param [in]  {Localformat} Localformat - Un ??l??ment de l'Objet Format pars??                                  |
::|                                                                                                              |
::| @return 0 => true                                                                                            |
::|         1 => false                                                                                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.LocalFormat.isSecond <Localformat> <exit:true|false>
    for %%i in (SS S) do if "%~1"=="%%~i" exit /b 0
exit /b 1

::,-------------------,----------------------------------------------------------------------------------,-------,
::| :Date.IsExistDate |                                                                                  |       |
::;-------------------'                                                                                  |  #16  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir si une date DD/MM/YYYY existe                                                               |
::|                                                                                                              |
::| @param [in]  {number} Day   - Le jour (de 1 ?? 31)                                                            |
::|                                                                                                              |
::| @param [in]  {number} Month - Le mois (de 1 ?? 12)                                                            |
::|                                                                                                              |
::| @param [in]  {number} Year  - L'ann??e                                                                        |
::|                                                                                                              |
::| @return 0 => La date existe                                                                                  |
::|         1 => La date n'existe pas                                                                            |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.IsExistDate 29 02 2020 && (                                                                    |
::|        echo;existe                                                                                           |
::|    ) || (                                                                                                    |
::|        echo;n'existe pas                                                                                     |
::|    )                                                                                                         |
::|                                                                                                              |
::|    call :Date.IsExistDate 29 02 2021 && (                                                                    |
::|        echo;existe                                                                                           |
::|    ) || (                                                                                                    |
::|        echo;n'existe pas                                                                                     |
::|    )                                                                                                         |
::|                                                                                                              |
::|    call :Date.IsExistDate 29 02 2020                                                                         |
::|    echo;resultat: %errorlevel%                                                                               |
::|                                                                                                              |
::|    call :Date.IsExistDate 29 02 2021                                                                         |
::|    echo;resultat: %errorlevel%                                                                               |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.IsExistDate <Day> <Month> <Year> <exit:true|false>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a "day=!Date.RemoveLeadingZero:zero=%~1!"
    set /a "month=!Date.RemoveLeadingZero:zero=%~2!"
    set /a "year=!Date.RemoveLeadingZero:zero=%~3!"
    if !month! lss 1 (
        endlocal
        exit /b 1
    )
    if !month! gtr 12 (
        endlocal
        exit /b 1
    )
    if !day! lss 1 (
        endlocal
        exit /b 1
    )
    if !day! gtr 31 (
        endlocal
        exit /b 1
    )
    if !month! equ 2 (
        set _leapv1=0
        set _leapv2=0
        set /a _leap1=!year! %% 4
        set /a _leap2=!year! %% 100
        set /a _leap3=!year! %% 400
        if !_leap1! equ 0 set _leapv1=1
        if !_leap2! neq 0 set _leapv2=1
        if !_leap3! equ 0 set _leapv2=1
        set _leap=0
        if !_leapv1! equ 1 if !_leapv2! equ 1 set _leap=1
        if !_leap! equ 1 (
            if !day! leq 29 (
                endlocal
                exit /b 0
            )
            endlocal
            exit /b 1
        ) else (
            if !day! leq 28 (
                endlocal
                exit /b 0
            )
            endlocal
            exit /b 1
        )
    )
    set _m=0
    if !month! equ 4 set _m=1
    if !month! equ 6 set _m=1
    if !month! equ 9 set _m=1
    if !month! equ 11 set _m=1
    if !_m! equ 1 (
        if !day! leq 30 (
            endlocal
            exit /b 0
        )
        endlocal
        exit /b 1
    )
    endlocal
exit /b 0

::,-------------------,----------------------------------------------------------------------------------,-------,
::| :Date.IsExistTime |                                                                                  |       |
::;-------------------'                                                                                  |  #17  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir si une dur??e HH:II:SS existe                                                                |
::|                                                                                                              |
::| @param [in]  {number} Hour   - L'heure (de 0 ?? 23)                                                           |
::|                                                                                                              |
::| @param [in]  {number} Minute - La minute (de 0 ?? 59)                                                         |
::|                                                                                                              |
::| @param [in]  {number} Second - La seconde (de 0 ?? 59)                                                        |
::|                                                                                                              |
::| @return 0 => La dur??e existe                                                                                 |
::|         1 => La dur??e n'existe pas                                                                           |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.IsExistTime 12 54 32 && (                                                                      |
::|        echo;existe                                                                                           |
::|    ) || (                                                                                                    |
::|        echo;n'existe pas                                                                                     |
::|    )                                                                                                         |
::|                                                                                                              |
::|    call :Date.IsExistTime 12 54 32                                                                           |
::|    echo;resultat: %errorlevel%                                                                               |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.IsExistTime <Hour> <Minute> <Second> <exit:true|false>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a "hour=!Date.RemoveLeadingZero:zero=%~1!"
    set /a "minute=!Date.RemoveLeadingZero:zero=%~2!"
    set /a "second=!Date.RemoveLeadingZero:zero=%~3!"
    if !hour! lss 0 (
        endlocal
        exit /b 1
    )
    if !hour! gtr 23 (
        endlocal
        exit /b 1
    )
    if !minute! lss 0 (
        endlocal
        exit /b 1
    )
    if !minute! gtr 59 (
        endlocal
        exit /b 1
    )
    if !second! lss 0 (
        endlocal
        exit /b 1
    )
    if !second! gtr 59 (
        endlocal
        exit /b 1
    )
    endlocal
exit /b 0

::,-----------------------,------------------------------------------------------------------------------,-------,
::| :Date.DateToDayNumber |                                                                              |       |
::;-----------------------'                                                                              |  #18  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de convertir une date DD/MM/YYYY en nombre de jours                                                   |
::|                                                                                                              |
::| @param [in]  {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [out] {number} DayNumber  - Le nombre de jours correspondant                                          |
::|                                                                                                              |
::| @see https://web.archive.org/web/20170507133619/https://alcor.concordia.ca/~gpkatch/gdate-algorithm.html     |
::|      https://web.archive.org/web/20161203020157/http://alcor.concordia.ca/~gpkatch/gdate-method.html         |
::|      :Date.DayNumberToDate (op??ration inverse)                                                               |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateToDayNumber 12 09 2021 days                                                                |
::|    echo %days%                                                                                               |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateToDayNumber <Day> <Month> <Year> <out:DayNumber>
    setlocal enabledelayedexpansion
    set /a d=1%~1+1%~1-2%~1&set /a m=1%~2+1%~2-2%~2&set /a y=1%~3+1%~3-2%~3
    set /a "m=(%m%+9) %% 12"&set /a "y=%y%-!m!/10"
    (endlocal&set /a "%~4=365*%y%+%y%/4-%y%/100+%y%/400+(%m%*306+5)/10+(%d%-1)")
exit /b

::,-----------------------,------------------------------------------------------------------------------,-------,
::| :Date.DayNumberToDate |                                                                              |       |
::;-----------------------'                                                                              |  #19  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de convertir un nombre de jours en date DD/MM/YYYY                                                    |
::|                                                                                                              |
::| @param [in]  {number} DayNumber  - Le nombre de jours correspondant                                          |
::|                                                                                                              |
::| @param [out] {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [out] {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [out] {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @see https://web.archive.org/web/20170507133619/https://alcor.concordia.ca/~gpkatch/gdate-algorithm.html     |
::|      https://web.archive.org/web/20161203020157/http://alcor.concordia.ca/~gpkatch/gdate-method.html         |
::|      :Date.DateToDayNumber (op??ration inverse)                                                               |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DayNumberToDate 738350 day month year                                                          |
::|    echo %day% %month% %year%                                                                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DayNumberToDate <DayNumber> <out:Day> <out:Month> <out:Year>
    setlocal enabledelayedexpansion
    set /a "g=1%~1+1%~1-2%~1"&set /a "h=!g!+1"&set /a "y=!h!47/36524"
    if !y! gtr 58794 (endlocal&echo;Error: Year too big&exit /b 1)
    set /a "ddd=!g! - (365*!y! + !y!/4 - !y!/100 + !y!/400)"
    if !ddd! lss 0 (set /a y-=1&set /a "ddd=!g! - (365*!y! + !y!/4 - !y!/100 + !y!/400)")
    set /a "mi=(100*!ddd! + 52)/3060"&set /a "mm=(!mi! + 2) %% 12 + 1"
    set /a "y+=(!mi! + 2)/12"&set /a "dd=!ddd!-(!mi!*306+5)/10 + 1"
    (endlocal&set "%~2=%dd%"&set "%~3=%mm%"&set "%~4=%y%")
exit /b

::,--------------------------,---------------------------------------------------------------------------,-------,
::| :Date.ToSecondSinceEpoch |                                                                           |       |
::;--------------------------'                                                                           |  #20  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de convertir une date "DD/MM/YYYY HH:II:SS" en secondes (utilise le timezone)                         |
::|                                                                                                              |
::| @param [out] {number} Seconds    - Le nombre de secondes depuis le 1er janvier 1970 00:00:00                 |
::|                                                                                                              |
::| @param [in]  {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Hour       - L'heure (de 0 ?? 23)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Minute     - La minute (de 0 ?? 59)                                                     |
::|                                                                                                              |
::| @param [in]  {number} Second     - La seconde (de 0 ?? 59)                                                    |
::|                                                                                                              |
::| @see :Date.ToTimeStamp permet de r??cup??rer le nombre de secondes depuis le 1er janvier 1970 00:00:00 UTC     |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.ToSecondSinceEpoch seconds 12 09 2021 22 50 35                                                 |
::|    echo %seconds%                                                                                            |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.ToSecondSinceEpoch <exit:overflow> <out:Seconds> <Day> <Month> <Year> <Hour> <Minute> <Second>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    call :Date.DateToDayNumber 1 1 1970 g1
    call :Date.DateToDayNumber %~2 %~3 %~4 g2
    set /a "hour=!Date.RemoveLeadingZero:zero=%~5!"
    set /a "minute=!Date.RemoveLeadingZero:zero=%~6!"
    set /a "second=!Date.RemoveLeadingZero:zero=%~7!"
    set /a g=!g2!-!g1!
    set h=!g!
    if !g! lss 0 set h=!g:~1!
    (
        endlocal
        if %h% geq 24853 (
            for /f "tokens=*" %%i in ('powershell -Command "%g%*86400+%hour%*3600+%minute%*60+%second%"') do set "%~1=%%~i"
            exit /b 1
        ) else (
            set /a "%~1=%g%*86400+%hour%*3600+%minute%*60+%second%"
        )
    )
exit /b 0

::,-------------------,----------------------------------------------------------------------------------,-------,
::| :Date.ToTimeStamp |                                                                                  |       |
::;-------------------'                                                                                  |  #21  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de convertir une date "DD/MM/YYYY HH:II:SS" en secondes (utilise le timezone)                         |
::|                                                                                                              |
::| @param [out] {number} Timestamp          - Le nombre de secondes depuis le 1er janvier 1970 00:00:00         |
::|                                                                                                              |
::| @param [in]  {number} Day                - Le jour (de 1 ?? 31)                                               |
::|                                                                                                              |
::| @param [in]  {number} Month              - Le mois (de 1 ?? 12)                                               |
::|                                                                                                              |
::| @param [in]  {number} Year               - L'ann??e                                                           |
::|                                                                                                              |
::| @param [in]  {number} Hour               - L'heure (de 0 ?? 23)                                               |
::|                                                                                                              |
::| @param [in]  {number} Minute             - La minute (de 0 ?? 59)                                             |
::|                                                                                                              |
::| @param [in]  {number} Second             - La seconde (de 0 ?? 59)                                            |
::|                                                                                                              |
::| @param [in]  {number} GMT_Offset_Minutes - Le d??calage par rapport ?? UTC en minutes                          |
::|                                            (example: Europe: +120, ...)                                      |
::|                                                                                                              |
::| @see :Date.ToSecondSinceEpoch permet de r??cup??rer le nombre de secondes depuis le 1er janvier 1970 00:00:00  |
::|      en fonction de la timezone                                                                              |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.ToTimeStamp timestamp 12 09 2021 22 50 35 120                                                  |
::|    echo %timestamp%                                                                                          |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.ToTimeStamp <out:Timestamp> <Day> <Month> <Year> <Hour> <Minute> <Second> <GMT_Offset_Minutes>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    call :Date.ToSecondSinceEpoch seconds "%~2" "%~3" "%~4" "%~5" "%~6" "%~7"
    set err=!errorlevel!
    set /a "offset=!Date.RemoveLeadingZero:zero=%~8!"
    if %~8 lss 0 (
        set /a s=!offset!*60*-1
        set c=%seconds%+!s!
    ) else (
        set c=%seconds%-!offset!*60
    )
    (
        endlocal
        if "%err%"=="1" (
            for /f "tokens=*" %%i in ('powershell -Command "%c%"') do set %~1=%%~i
        ) else (
            set /a "%~1=%c%"
        )
        exit /b %err%
    )
exit /b 0

::,-------------------,----------------------------------------------------------------------------------,-------,
::| :Date.GetDayIndex |                                                                                  |       |
::;-------------------'                                                                                  |  #22  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir s'il s'agit d'un [lundi, mardi, mercredi, ..., samedi, dimanche]                            |
::| ?? partir d'une date DD/MM/YYYY                                                                               |
::|                                                                                                              |
::| @param [out] {number} Index  - ISO 8601                                                                      |
::|                                 0 => lundi                                                                   |
::|                                 1 => mardi                                                                   |
::|                                 2 => mercredi                                                                |
::|                                 3 => jeudi                                                                   |
::|                                 4 => vendredi                                                                |
::|                                 5 => samedi                                                                  |
::|                                 6 => dimanche                                                                |
::|                                                                                                              |
::| @param [in]  {number} Day    - Le jour (de 1 ?? 31)                                                           |
::|                                                                                                              |
::| @param [in]  {number} Month  - Le mois (de 1 ?? 12)                                                           |
::|                                                                                                              |
::| @param [in]  {number} Year   - L'ann??e                                                                       |
::|                                                                                                              |
::| @see http://en.wikipedia.org/wiki/Doomsday_rule                                                              |
::|      https://stackoverflow.com/questions/25758766/algorithm-to-calculate-the-name-of-a-day-for-a-date        |
::|      :Date.GetDayName                                                                                        |
::|      :Date.GetDayShortName                                                                                   |
::|      :Date.GetDayNames                                                                                       |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetDayIndex index 12 09 2021                                                                   |
::|    set /a index+=1                                                                                           |
::|    echo day of week: %index%                                                                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetDayIndex <out:Index> <Day> <Month> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a "_day=!Date.r:z=%~2!"&set /a "_month=!Date.r:z=%~3!"&set /a "_year=!Date.r:z=%~4!"
    set _i=0
    for %%a in (0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4) do (
        set _months[!_i!]=%%~a
        set /a _i+=1
    )
    if !_month! lss 3 (
        set /a _year-=1
    )
    set /a _monthindex=!_month!-1
    for %%a in (!_monthindex!) do set /a _nb=(!_year! + !_year!/4 - !_year!/100 + !_year!/400 + !_months[%%~a]! + !_day!) %% 7
    set /a "_nb=((7+!_nb!)-1) %% 7"
    (
        endlocal
        set "%~1=%_nb%"
    )
exit /b 0

::,------------------,-----------------------------------------------------------------------------------,-------,
::| :Date.GetDayName |                                                                                   |       |
::;------------------'                                                                                   |  #23  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir s'il s'agit d'un [lundi, mardi, mercredi, ..., samedi, dimanche]                            |
::| ?? partir d'une date DD/MM/YYYY                                                                               |
::|                                                                                                              |
::| @param [out] {string} Name   - [lundi, mardi, mercredi, ..., samedi, dimanche]                               |
::|                                                                                                              |
::| @param [in]  {number} Day    - Le jour (de 1 ?? 31)                                                           |
::|                                                                                                              |
::| @param [in]  {number} Month  - Le mois (de 1 ?? 12)                                                           |
::|                                                                                                              |
::| @param [in]  {number} Year   - L'ann??e                                                                       |
::|                                                                                                              |
::| @see :Date.GetDayIndex                                                                                       |
::|      :Date.GetDayShortName                                                                                   |
::|      :Date.GetDayNames                                                                                       |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetDayName name 12 09 2021                                                                     |
::|    echo day of week: %name%                                                                                  |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetDayName <out:Name> <Day> <Month> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    call :Date.GetDayIndex _nb "%~2" "%~3" "%~4"
    for %%l in (!Date.Locale!) do for %%n in (!_nb!) do set "name=!Date.Language[%%l].Day[%%n]!"
    (endlocal&set "%~1=%name%")
exit /b 0

::,-----------------------,------------------------------------------------------------------------------,-------,
::| :Date.GetDayShortName |                                                                              |       |
::;-----------------------'                                                                              |  #24  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir s'il s'agit d'un [lundi, mardi, mercredi, ..., samedi, dimanche]                            |
::| ?? partir d'une date DD/MM/YYYY                                                                               |
::|                                                                                                              |
::| @param [out] {string} Name   - [lun., mar., mer., ..., sam., dim.]                                           |
::|                                                                                                              |
::| @param [in]  {number} Day    - Le jour (de 1 ?? 31)                                                           |
::|                                                                                                              |
::| @param [in]  {number} Month  - Le mois (de 1 ?? 12)                                                           |
::|                                                                                                              |
::| @param [in]  {number} Year   - L'ann??e                                                                       |
::|                                                                                                              |
::| @see :Date.GetDayIndex                                                                                       |
::|      :Date.GetDayName                                                                                        |
::|      :Date.GetDayNames                                                                                       |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetDayShortName shortname 12 09 2021                                                           |
::|    echo day of week: %shortname%                                                                             |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetDayShortName <out:Name> <Day> <Month> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    call :Date.GetDayIndex _nb "%~2" "%~3" "%~4"
    for %%l in (!Date.Locale!) do for %%n in (!_nb!) do set "name=!Date.Language[%%l].DayShort[%%n]!"
    (endlocal&set "%~1=%name%")
exit /b 0

::,-------------------,----------------------------------------------------------------------------------,-------,
::| :Date.GetDayNames |                                                                                  |       |
::;-------------------'                                                                                  |  #25  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir s'il s'agit d'un [lundi, mardi, mercredi, ..., samedi, dimanche]                            |
::| ?? partir d'une date DD/MM/YYYY                                                                               |
::|                                                                                                              |
::| @param [out] {number} Index     - ISO 8601                                                                   |
::|                                    0 => lundi                                                                |
::|                                    1 => mardi                                                                |
::|                                    2 => mercredi                                                             |
::|                                    3 => jeudi                                                                |
::|                                    4 => vendredi                                                             |
::|                                    5 => samedi                                                               |
::|                                    6 => dimanche                                                             |
::|                                                                                                              |
::| @param [out] {string} Name      - [lundi, mardi, mercredi, ..., samedi, dimanche]                            |
::|                                                                                                              |
::| @param [out] {string} ShortName - [lun., mar., mer., ..., sam., dim.]                                        |
::|                                                                                                              |
::| @param [in]  {number} Day       - Le jour (de 1 ?? 31)                                                        |
::|                                                                                                              |
::| @param [in]  {number} Month     - Le mois (de 1 ?? 12)                                                        |
::|                                                                                                              |
::| @param [in]  {number} Year      - L'ann??e                                                                    |
::|                                                                                                              |
::| @see :Date.GetDayIndex                                                                                       |
::|      :Date.GetDayName                                                                                        |
::|      :Date.GetDayShortName                                                                                   |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetDayShortName index name shortname 12 09 2021                                                |
::|    set /a index+=1                                                                                           |
::|    echo day of week: %index% - %name% - %shortname%                                                          |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetDayNames <out:Index> <Out:Name> <Out:ShortName> <Day> <Month> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    call :Date.GetDayIndex _nb "%~4" "%~5" "%~6"
    for %%l in (!Date.Locale!) do for %%n in (!_nb!) do set "name=!Date.Language[%%l].Day[%%n]!"
    for %%l in (!Date.Locale!) do for %%n in (!_nb!) do set "shortname=!Date.Language[%%l].DayShort[%%n]!"
    (endlocal&set "%~1=%_nb%"&set "%~2=%name%"&set "%~3=%shortname%")
exit /b 0

::,--------------------,---------------------------------------------------------------------------------,-------,
::| :Date.GetMonthName |                                                                                 |       |
::;--------------------'                                                                                 |  #26  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir s'il s'agit d'un [janvier, f??vrier, mars, ..., novembre, d??cembre]                          |
::| ?? partir du mois (MM)                                                                                        |
::|                                                                                                              |
::| @param [out] {string} Name  - Le nom du mois [janvier, f??vrier, mars, ..., novembre, d??cembre]               |
::|                                                                                                              |
::| @param [in]  {number} Month - Le mois (de 1 ?? 12)                                                            |
::|                                                                                                              |
::| @see :Date.GetMonthShortName                                                                                 |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetMonthName name 09                                                                           |
::|    echo month name: %name%                                                                                   |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetMonthName <out:Name> <Month>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a index=%~2-1
    for %%l in (!Date.Locale!) do for %%n in (!index!) do set "name=!Date.Language[%%l].Month[%%n]!"
    (
        endlocal
        set "%~1=%name%"
    )
exit /b 0

::,-------------------------,----------------------------------------------------------------------------,-------,
::| :Date.GetMonthShortName |                                                                            |       |
::;-------------------------'                                                                            |  #27  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir s'il s'agit d'un [janvier, f??vrier, mars, ..., novembre, d??cembre]                          |
::| ?? partir du mois (MM)                                                                                        |
::|                                                                                                              |
::| @param [out] {string} Name  - Le nom du mois [janv., fevr., mars, nov., dec.]                                |
::|                                                                                                              |
::| @param [in]  {number} Month - Le mois (de 1 ?? 12)                                                            |
::|                                                                                                              |
::| @see :Date.GetMonthName                                                                                      |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetMonthShortName shortname 09                                                                 |
::|    echo month shortname: %shortname%                                                                         |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetMonthShortName <out:Name> <Month>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a index=!Date.r:z=%~2!-1
    for %%l in (!Date.Locale!) do for %%n in (!index!) do set "name=!Date.Language[%%l].MonthShort[%%n]!"
    (
        endlocal
        set "%~1=%name%"
    )
exit /b 0

::,----------------------,-------------------------------------------------------------------------------,-------,
::| :Date.GetWeekOfMonth |                                                                               |       |
::;----------------------'                                                                               |  #28  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir le num??ro de la semaine du mois [1,2,3,4,5] ?? partir d'une date DD/MM/YYYY                  |
::| Certains mois ont 5 semaines (ex: le mois de septembre 2021 est compos?? de 5 semaines)                       |
::|                                                                                                              |
::| @param [out] {number} WeekOfMonth  - 1 => semaine 1                                                          |
::|                                      2 => semaine 2                                                          |
::|                                      3 => semaine 3                                                          |
::|                                      4 => semaine 4                                                          |
::|                                      5 => semaine 5 (pour certains mois)                                     |
::|                                                                                                              |
::| @param [in]  {number} Day          - Le jour (de 1 ?? 31)                                                     |
::|                                                                                                              |
::| @param [in]  {number} Month        - Le mois (de 1 ?? 12)                                                     |
::|                                                                                                              |
::| @param [in]  {number} Year         - L'ann??e                                                                 |
::|                                                                                                              |
::| @see :Date.GetWeekOfYear                                                                                     |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetWeekOfMonth week 12 09 2021                                                                 |
::|    echo semaine du mois : %week%                                                                             |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetWeekOfMonth <out:WeekOfMonth> <Day> <Month> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    call :Date.GetDayIndex index "%~2" "%~3" "%~4"
    set /a index+=1
    set /a "weekofmonth=(((!index!-((!Date.r:z=%~2!) %% 7)+7) %% 7+(!Date.r:z=%~2!)-1)/7)+1"
    (
        endlocal
        set "%~1=%weekofmonth%"
    )
exit /b 0

::,---------------------,--------------------------------------------------------------------------------,-------,
::| :Date.GetWeekOfYear |                                                                                |       |
::;---------------------'                                                                                |  #29  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir le num??ro de la semaine (de l'ann??e) [1,2,...,51,52,53] ?? partir d'une date DD/MM/YYYY      |
::| Certaines ann??es sont compos??es de 53 semaines (ISO 8601)                                                    |
::|                                                                                                              |
::| @param [out] {number} WeekOfYear   - Le num??ro de semaine [1,2,...,51,52,53]                                 |
::|                                                                                                              |
::| @param [in]  {number} Day          - Le jour (de 1 ?? 31)                                                     |
::|                                                                                                              |
::| @param [in]  {number} Month        - Le mois (de 1 ?? 12)                                                     |
::|                                                                                                              |
::| @param [in]  {number} Year         - L'ann??e                                                                 |
::|                                                                                                              |
::| @see https://www.epochconverter.com/weeknumbers                                                              |
::|      :Date.GetWeekOfMonth                                                                                    |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetWeekOfYear week 12 09 2021                                                                  |
::|    echo numero de semaine : %week%                                                                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetWeekOfYear <out:WeekOfYear> <Day> <Month> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a "day=!Date.r:z=%~2!"&set /a "month=!Date.r:z=%~3!"&set /a "year=!Date.r:z=%~4!"
    call :Date.GetDayIndex index "!day!" "!month!" "!year!"
    call :Date.GetDaysInMonth dayinmonth "!month!" "!year!"
    set /a thursday=!day!+4-!index!-1
    set day=!thursday!
    if !thursday! leq 0 (
        set /a month-=1
        if !month! leq 0 (
            set month=12
            set /a year-=1
        )
        call :Date.GetDaysInMonth dayinmonth2 "!month!" "!year!"
        set /a day=!dayinmonth2!+!day!
    ) else if !thursday! gtr !dayinmonth! (
        set /a day=!thursday! %% !dayinmonth!
        set /a month+=1
        if !month! gtr 12 (
            set month=1
            set /a year+=1
        )
    )
    call :Date.GetDayIndex index2 "01" "01" "!year!"
    set /a "delta=1+((4-!index2!-1+7) %% 7)"
    call :Date.DateToDayNumber !delta! 1 "!year!" g1
    call :Date.DateToDayNumber "!day!" "!month!" "!year!" g2
    set /a "weekofyear=(!g2!-!g1!)/7+1"
    (
        endlocal
        set "%~1=%weekofyear%"
    )
exit /b 0

::,----------------------,-------------------------------------------------------------------------------,-------,
::| :Date.GetDaysInMonth |                                                                               |       |
::;----------------------'                                                                               |  #30  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir le nombre de jours dans un mois ?? partir de MM/YYYY                                         |
::| (l'ann??e sert juste pour savoir s'il s'agit d'une ann??e bissextile (pour f??vrier))                           |
::|                                                                                                              |
::| @param [out] {number} Days   - Le nombre de jours du mois (28, 29, 30 ou 31)                                 |
::|                                                                                                              |
::| @param [in]  {number} Month  - Le mois (de 1 ?? 12)                                                           |
::|                                                                                                              |
::| @param [in]  {number} Year   - L'ann??e                                                                       |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetDaysInMonth days 02 2020                                                                    |
::|    echo nombre de jours 02/2020 : %days%                                                                     |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetDaysInMonth <out:Days> <Month> <Year>
    if "%~2"=="0" (
        set %~1=0
        exit /b
    )
    if "%~2"=="2" (
        call :Date.IsLeapYear "%~3" && (
            set %~1=29
        ) || (
            set %~1=28
        )
    ) else (
        set /a "%~1=31 - ((1%~2+1%~2-2%~2) - 1) %% 7 %% 2"
    )
exit /b

::,------------------,-----------------------------------------------------------------------------------,-------,
::| :Date.IsLeapYear |                                                                                   |       |
::;------------------'                                                                                   |  #31  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de savoir si une ann??e est bissextile (366 jours) ou pas (365 jours)                                  |
::|                                                                                                              |
::| @param [in]  {number} Year - L'ann??e                                                                         |
::|                                                                                                              |
::| @return 0 => L'ann??e est bissextile                                                                          |
::|         1 => L'ann??e n'est pas bissextile                                                                    |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.IsLeapYear 2020 && (                                                                           |
::|        echo;2020: yes                                                                                        |
::|    ) || (                                                                                                    |
::|        echo;2020: no                                                                                         |
::|    )                                                                                                         |
::|                                                                                                              |
::|    call :Date.IsLeapYear 2021 && (                                                                           |
::|        echo;2021: yes                                                                                        |
::|    ) || (                                                                                                    |
::|        echo;2021: no                                                                                         |
::|    )                                                                                                         |
::|                                                                                                              |
::|    call :Date.IsLeapYear 2020                                                                                |
::|    echo;resultat: %errorlevel%                                                                               |
::|                                                                                                              |
::|    call :Date.IsLeapYear 2021                                                                                |
::|    echo;resultat: %errorlevel%                                                                               |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.IsLeapYear <exit:true|false> <Year>
    setlocal disabledelayedexpansion
    set /a year=1%~1+1%~1-2%~1
    set /a "leap=!(year%%4) + (!!(year%%100)-!!(year%%400))"
    if "%leap%"=="1" (
        endlocal
        exit /b 0
    )
exit /b 1

::,--------------------------,---------------------------------------------------------------------------,-------,
::| :Date.GetIdentifierIndex | @PRIVATE                                                                  |       |
::;--------------------------'                                                                           |  #32  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de r??cup??rer l'index dans un tableau d'un ??l??ment ?? partir de sa valeur                               |
::|                                                                                                              |
::| @param [out] {number} Index      - L'index du tableau o?? se trouve l'??l??ment                                 |
::|                                                                                                              |
::| @param [in]  {string} Identifier - Nom du tableau de la Locale (Day, DayShort, Month, MonthShort)            |
::|                                                                                                              |
::| @param [in]  {number} Start      - L'indice du premier ??l??ment du tableau                                    |
::|                                                                                                              |
::| @param [in]  {number} End        - L'indice du dernier ??l??ment du tableauv                                   |
::|                                                                                                              |
::| @param [in]  {string} Name       - Valeur de l'??l??ment ?? trouver dans le tableau                             |
::|                                                                                                              |
::| @return 0 => L'??l??ment a ??t?? trouv??                                                                          |
::|         1 => L'??l??ment n'a pas ??t?? trouv??                                                                    |
::|                                                                                                              |
::| @see :Date.GetDayOfWeekIndex                                                                                 |
::|      :Date.GetDayShortOfWeekIndex                                                                            |
::|      :Date.GetMonthOfYearIndex                                                                               |
::|      :Date.GetMonthShortOfYearIndex                                                                          |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetIdentifierIndex <out:Index> <Identifier> <Start> <End> <Name>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    for %%l in (!Date.Locale!) do (
        for /l %%n in (%~3,1,%~4) do (
            if /i "!Date.Language[%%l].%~2[%%n]!"=="%~5" (
                endlocal
                set %~1=%%n
                exit /b 0
            )
        )
    )
    endlocal
exit /b 1

::,-------------------------,----------------------------------------------------------------------------,-------,
::| :Date.GetDayOfWeekIndex |                                                                            |       |
::;-------------------------'                                                                            |  #33  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de r??cup??rer l'index du jour ?? partir du nom du jour [lundi,mardi,...,samedi,dimanche]                |
::|                                                                                                              |
::| @param [out] {number} Index - L'index du jour [0,1,2,3,4,5,6] (ISO 8601)                                     |
::|                                                                                                              |
::| @param [in]  {string} Name  - Nom du jour [lundi,mardi,...,samedi,dimanche]                                  |
::|                                                                                                              |
::| @return 0 => Le jour a ??t?? trouv??                                                                            |
::|         1 => Le jour n'a pas ??t?? trouv??                                                                      |
::|                                                                                                              |
::| @see :Date.GetIdentifierIndex                                                                                |
::|      :Date.GetDayOfWeekIndex                                                                                 |
::|      :Date.GetDayShortOfWeekIndex                                                                            |
::|      :Date.GetMonthOfYearIndex                                                                               |
::|      :Date.GetMonthShortOfYearIndex                                                                          |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetDayOfWeekIndex index dimanche                                                               |
::|    set /a index+=1                                                                                           |
::|    echo dimanche : jour numero %index% de la semaine                                                         |
::|                                                                                                              |
::|    call :Date.GetDayOfWeekIndex index dimanchhhe || echo ce jour n'existe pas                                |
::|                                                                                                              |
::|    call :Date.GetDayOfWeekIndex index dimanchhhe && (                                                        |
::|        echo ce jour existe                                                                                   |
::|    ) || (                                                                                                    |
::|        echo ce jour n'existe pas                                                                             |
::|    )                                                                                                         |
::|                                                                                                              |
::|    call :Date.GetDayOfWeekIndex index dimanchhhe                                                             |
::|    echo resultat: %errorlevel% (si 0 alors ce jour existe sinon il n'existe pas)                             |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetDayOfWeekIndex <out:index> <DayName>
    call :Date.GetIdentifierIndex "%~1" Day 0 6 "%~2"
exit /b %errorlevel%

::,------------------------------,-----------------------------------------------------------------------,-------,
::| :Date.GetDayShortOfWeekIndex |                                                                       |       |
::;------------------------------'                                                                       |  #34  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de r??cup??rer l'index du jour ?? partir du nom du jour [lun.,mar.,...,sam.,dim.]                        |
::|                                                                                                              |
::| @param [out] {number} Index - L'index du jour [0,1,2,3,4,5,6] (ISO 8601)                                     |
::|                                                                                                              |
::| @param [in]  {string} Name  - Nom du jour [lun.,mar.,...,sam.,dim.]                                          |
::|                                                                                                              |
::| @return 0 => Le jour a ??t?? trouv??                                                                            |
::|         1 => Le jour n'a pas ??t?? trouv??                                                                      |
::|                                                                                                              |
::| @see :Date.GetIdentifierIndex                                                                                |
::|      :Date.GetDayOfWeekIndex                                                                                 |
::|      :Date.GetDayShortOfWeekIndex                                                                            |
::|      :Date.GetMonthOfYearIndex                                                                               |
::|      :Date.GetMonthShortOfYearIndex                                                                          |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetDayShortOfWeekIndex index dim.                                                              |
::|    set /a index+=1                                                                                           |
::|    echo dim. : jour numero %index% de la semaine                                                             |
::|                                                                                                              |
::|    call :Date.GetDayShortOfWeekIndex index dim || echo ce jour n'existe pas                                  |
::|                                                                                                              |
::|    call :Date.GetDayShortOfWeekIndex index dim && (                                                          |
::|        echo ce jour existe                                                                                   |
::|    ) || (                                                                                                    |
::|        echo ce jour n'existe pas                                                                             |
::|    )                                                                                                         |
::|                                                                                                              |
::|    call :Date.GetDayShortOfWeekIndex index dim                                                               |
::|    echo resultat: %errorlevel% (si 0 alors ce jour existe sinon il n'existe pas)                             |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetDayShortOfWeekIndex <out:index> <DayShortName>
    call :Date.GetIdentifierIndex "%~1" DayShort 0 6 "%~2"
exit /b %errorlevel%

::,---------------------------,--------------------------------------------------------------------------,-------,
::| :Date.GetMonthOfYearIndex |                                                                          |       |
::;---------------------------'                                                                          |  #35  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de r??cup??rer l'index du mois ?? partir du nom du mois [janvier,fevrier,...,novembre,decembre]          |
::|                                                                                                              |
::| @param [out] {number} Index - L'index du mois [0,1,2,3,4,5,6,7,8,9,10,11]                                    |
::|                                                                                                              |
::| @param [in]  {string} Name  - Nom du mois [janvier,fevrier,...,novembre,decembre]                            |
::|                                                                                                              |
::| @return 0 => Le mois a ??t?? trouv??                                                                            |
::|         1 => Le mois n'a pas ??t?? trouv??                                                                      |
::|                                                                                                              |
::| @see :Date.GetIdentifierIndex                                                                                |
::|      :Date.GetDayOfWeekIndex                                                                                 |
::|      :Date.GetDayShortOfWeekIndex                                                                            |
::|      :Date.GetMonthOfYearIndex                                                                               |
::|      :Date.GetMonthShortOfYearIndex                                                                          |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetMonthOfYearIndex index septembre                                                            |
::|    set /a index+=1                                                                                           |
::|    echo septembre : mois numero %index% de l'annee                                                           |
::|                                                                                                              |
::|    call :Date.GetMonthOfYearIndex index septtembre || echo ce mois n'existe pas                              |
::|                                                                                                              |
::|    call :Date.GetMonthOfYearIndex index septtembre && (                                                      |
::|        echo ce mois existe                                                                                   |
::|    ) || (                                                                                                    |
::|        echo ce mois n'existe pas                                                                             |
::|    )                                                                                                         |
::|                                                                                                              |
::|    call :Date.GetMonthOfYearIndex index septtembre                                                           |
::|    echo resultat: %errorlevel% (si 0 alors ce mois existe sinon il n'existe pas)                             |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetMonthOfYearIndex <out:index> <MonthName>
    call :Date.GetIdentifierIndex "%~1" Month 0 11 "%~2"
exit /b %errorlevel%

::,--------------------------------,---------------------------------------------------------------------,-------,
::| :Date.GetMonthShortOfYearIndex |                                                                     |       |
::;--------------------------------'                                                                     |  #36  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de r??cup??rer l'index du mois ?? partir du nom du mois [janv.,fevr.,...,nov.,dec.]                      |
::|                                                                                                              |
::| @param [out] {number} Index - L'index du mois [0,1,2,3,4,5,6,7,8,9,10,11]                                    |
::|                                                                                                              |
::| @param [in]  {string} Name  - Nom du mois [janv.,fevr.,...,nov.,dec.]                                        |
::|                                                                                                              |
::| @return 0 => Le mois a ??t?? trouv??                                                                            |
::|         1 => Le mois n'a pas ??t?? trouv??                                                                      |
::|                                                                                                              |
::| @see :Date.GetIdentifierIndex                                                                                |
::|      :Date.GetDayOfWeekIndex                                                                                 |
::|      :Date.GetDayShortOfWeekIndex                                                                            |
::|      :Date.GetMonthOfYearIndex                                                                               |
::|      :Date.GetMonthShortOfYearIndex                                                                          |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetMonthShortOfYearIndex index sept.                                                           |
::|    set /a index+=1                                                                                           |
::|    echo sept. : mois numero %index% de l'annee                                                               |
::|                                                                                                              |
::|    call :Date.GetMonthShortOfYearIndex index septt. || echo ce mois n'existe pas                             |
::|                                                                                                              |
::|    call :Date.GetMonthShortOfYearIndex index septt. && (                                                     |
::|        echo ce mois existe                                                                                   |
::|    ) || (                                                                                                    |
::|        echo ce mois n'existe pas                                                                             |
::|    )                                                                                                         |
::|                                                                                                              |
::|    call :Date.GetMonthShortOfYearIndex index septt.                                                          |
::|    echo resultat: %errorlevel% (si 0 alors ce mois existe sinon il n'existe pas)                             |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetMonthShortOfYearIndex <out:index> <MonthShortName>
    call :Date.GetIdentifierIndex "%~1" MonthShort 0 11 "%~2"
exit /b %errorlevel%

::,-----------------------------,------------------------------------------------------------------------,-------,
::| :Date.GetDateFromWeekOfYear |                                                                        |       |
::;-----------------------------'                                                                        |  #37  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de trouver DD/MM/YYYY ?? partir du jour de la semaine, du num??ro de semaine et de l'ann??e              |
::|   DDD/W/YYYY => DD/MM/YYYY                                                                                   |
::|                                                                                                              |
::| @param [out] {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [out] {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [out] {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} DayNumber  - Le jour de la semaine [1,2,3,4,5,6,7]                                     |
::|                                                                                                              |
::| @param [in]  {number} WeekOfYear - Le num??ro de semaine [1,2,3,...,51,52,53]                                 |
::|                                                                                                              |
::| @param [in]  {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @see :Date.GetDateFromWeekOfMonth                                                                            |
::|      :Date.GetWeekOfYear                                                                                     |
::|      :Date.GetWeekOfMonth                                                                                    |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetDateFromWeekOfYear day month year 7 36 2021                                                 |
::|    echo 1 36 2021 : %day% %month% %year%                                                                     |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetDateFromWeekOfYear <out:Day> <out:Month> <out:Year> <DayNumber> <WeekOfYear> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a "index=!Date.r:z=%~4!"&set /a "wy=!Date.r:z=%~5!"&set /a "year=!Date.r:z=%~6!"
    call :Date.GetDayIndex index2 "01" "01" "!year!"
    set /a "delta=1+((4-!index2!-1+7) %% 7)"
    set month=1&set v=0&set p=0
    set /a "days=(!wy!-1)*7"
    call :Date.IsLeapYear !year! && (
        set "daysinmonth=!Date.DaysInMonthLeap!"
    ) || (
        set "daysinmonth=!Date.DaysInMonth!"
    )
    for %%i in (!daysinmonth!) do (
        if !days! gtr %%i (
            set /a month+=1&set p=%%i
        ) else if "!v!"=="0" (
            set v=1&set /a days-=!p!
        )
    )
    set /a "days+=!delta!-(4-!index!)"
    call :Date.GetDaysInMonth mt2 !month! !year!
    if !days! lss 1 (
        set /a month-=1
        if !month! lss 1 (
            set month=12
            set /a year-=1
        )
        call :Date.GetDaysInMonth mt !month! !year!
        set /a days=!mt!+!days!
    ) else if !days! gtr !mt2! (
        set /a month+=1
        if !month! gtr 12 (
            set month=1
            set /a year+=1
        )
        set /a "days=!days! %% !mt2!"
    )
    (
        endlocal
        set %~1=%days%
        set %~2=%month%
        set %~3=%year%
    )
exit /b

::,------------------------------,-----------------------------------------------------------------------,-------,
::| :Date.GetDateFromWeekOfMonth |                                                                       |       |
::;------------------------------'                                                                       |  #38  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de trouver DD ?? partir du jour de la semaine, du num??ro de semaine du mois, du mois et de l'ann??e     |
::|   DDD/w/MM/YYYY => DD                                                                                        |
::|                                                                                                              |
::| @param [out] {number} Day         - Le jour (de 1 ?? 31)                                                      |
::|                                                                                                              |
::| @param [in]  {number} DayNumber   - Le jour de la semaine [1,2,3,4,5,6,7]                                    |
::|                                                                                                              |
::| @param [in]  {number} WeekOfMonth - Le num??ro de semaine [1,2,3,4,5]                                         |
::|                                                                                                              |
::| @param [in]  {number} Month       - Le mois (de 1 ?? 12)                                                      |
::|                                                                                                              |
::| @param [in]  {number} Year        - L'ann??e                                                                  |
::|                                                                                                              |
::| @see :Date.GetDateFromWeekOfYear                                                                             |
::|      :Date.GetWeekOfYear                                                                                     |
::|      :Date.GetWeekOfMonth                                                                                    |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.GetDateFromWeekOfMonth day 7 2 9 2021                                                          |
::|    echo %day%                                                                                                |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.GetDateFromWeekOfMonth <out:Day> <DayNumber> <WeekOfMonth> <Month> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a "index=!Date.r:z=%~2!"&set /a "wm=!Date.r:z=%~3!"&set /a "month=!Date.r:z=%~4!"&set /a "year=!Date.r:z=%~5!"
    call :Date.GetDayIndex index2 "01" "!month!" "!year!"
    set /a index2+=1
    set /a "day=1+(!wm!-1)*7+!index!-!index2!"
    call :Date.GetDaysInMonth days "!month!" "!year!"
    if !day! lss 1 (
        endlocal
        exit /b 1
    )
    if !day! gtr !days! (
        endlocal
        exit /b 1
    )
    (
        endlocal
        set %~1=%day%
    )
exit /b 0

::,-------------------,----------------------------------------------------------------------------------,-------,
::| :Date.DateAddDays |                                                                                  |       |
::;-------------------'                                                                                  |  #39  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter un nombre de jours ?? une date DD/MM/YYYY                                                    |
::|                                                                                                              |
::| @param [out] {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [out] {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [out] {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Days       - Le nombre de jours ?? ajouter ?? la date                                    |
::|                                                                                                              |
::| @see :Date.DateSubstractDays                                                                                 |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateAddDays day month year 28 2 2021 1                                                         |
::|    echo %day% %month% %year%                                                                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateAddDays <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Days>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a "day=!Date.r:z=%~4!"&set /a "month=!Date.r:z=%~5!"&set /a "year=!Date.r:z=%~6!"
    set "d=%~7"&set "d=!d: =!"
    if "!d:~0,1!"=="-" (
        set /a "d=-(1!d:~1!+1!d:~1!-2!d:~1!)"
    ) else (
        set /a "d=1!d!+1!d!-2!d!"
    )
    call :Date.DateToDayNumber !day! !month! !year! days
    set /a "days+=!d!"
    (
        endlocal
        call :Date.DayNumberToDate %days% "%~1" "%~2" "%~3"
    )
exit /b

::,-------------------------,----------------------------------------------------------------------------,-------,
::| :Date.DateSubstractDays |                                                                            |       |
::;-------------------------'                                                                            |  #40  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de soustraire un nombre de jours ?? une date DD/MM/YYYY                                                |
::|                                                                                                              |
::| @param [out] {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [out] {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [out] {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Days       - Le nombre de jours ?? soustraire ?? la date                                 |
::|                                                                                                              |
::| @see :Date.DateAddDays                                                                                       |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateSubstractDays day month year 1 3 2021 1                                                    |
::|    echo %day% %month% %year%                                                                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateSubstractDays <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Days>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set "d=%~7"&set "d=!d: =!"
    if "!d:~0,1!"=="-" (
        set /a "d=-(1!d:~1!+1!d:~1!-2!d:~1!)"
    ) else (
        set /a "d=1!d!+1!d!-2!d!"
    )
    set /a "days=(!d!)*-1"
    (
        endlocal
        call :Date.DateAddDays "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%days%"
    )
exit /b

::,---------------------,--------------------------------------------------------------------------------,-------,
::| :Date.DateAddMonths |                                                                                |       |
::;---------------------'                                                                                |  #41  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter un nombre de mois ?? une date DD/MM/YYYY                                                     |
::|                                                                                                              |
::| @param [out] {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [out] {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [out] {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Months     - Le nombre de mois ?? ajouter ?? la date                                     |
::|                                                                                                              |
::| @see :Date.DateSubstractMonths                                                                               |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateAddMonths day month year 31 1 2021 1                                                       |
::|    echo %day% %month% %year%                                                                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateAddMonths <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Months>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set "d=%~7"&set "d=!d: =!"
    if "!d:~0,1!"=="-" (
        set /a "d=-(1!d:~1!+1!d:~1!-2!d:~1!)"
    ) else (
        set /a "d=1!d!+1!d!-2!d!"
    )
    set /a "day=!Date.r:z=%~4!"&set /a "month=(!Date.r:z=%~5!)+(!d! %% 12)"&set /a "year=(!Date.r:z=%~6!)+(!d!/12)"
    if !month! gtr 12 (
        set /a "year+=(!month!-1)/12"
        set /a "month=((!month!-1) %% 12)+1"
    )
    if !month! lss 1 (
        set /a year-=1
        set /a month=12+!month!
    )
    call :Date.GetDaysInMonth days !month! !year!
    if !day! gtr !days! (
        set /a "month+=!day!/!days!"
        set /a "day=!day! %% !days!"
    )
    (
        endlocal
        set %~1=%day%
        set %~2=%month%
        set %~3=%year%
    )
exit /b

::,---------------------------,--------------------------------------------------------------------------,-------,
::| :Date.DateSubstractMonths |                                                                          |       |
::;---------------------------'                                                                          |  #42  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de soustraire un nombre de mois ?? une date DD/MM/YYYY                                                 |
::|                                                                                                              |
::| @param [out] {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [out] {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [out] {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Months     - Le nombre de mois ?? soustraire ?? la date                                  |
::|                                                                                                              |
::| @see :Date.DateAddMonths                                                                                     |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateSubstractMonths day month year 31 5 2021 1                                                 |
::|    echo %day% %month% %year%                                                                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateSubstractMonths <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Months>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set "d=%~7"&set "d=!d: =!"
    if "!d:~0,1!"=="-" (
        set /a "d=-(1!d:~1!+1!d:~1!-2!d:~1!)"
    ) else (
        set /a "d=1!d!+1!d!-2!d!"
    )
    set /a "months=(!d!)*-1"
    call :Date.DateAddMonths day month year "%~4" "%~5" "%~6" "!months!"
    (
        endlocal
        set %~1=%day%
        set %~2=%month%
        set %~3=%year%
    )
exit /b

::,--------------------,---------------------------------------------------------------------------------,-------,
::| :Date.DateAddYears |                                                                                 |       |
::;--------------------'                                                                                 |  #43  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter un nombre d'ann??es ?? une date DD/MM/YYYY                                                    |
::|                                                                                                              |
::| @param [out] {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [out] {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [out] {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Years      - Le nombre d'ann??es ?? ajouter ?? la date                                    |
::|                                                                                                              |
::| @see :Date.DateSubstractYears                                                                                |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateAddYears day month year 29 2 2020 1                                                        |
::|    echo %day% %month% %year%                                                                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateAddYears <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Years>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set "d=%~7"&set "d=!d: =!"
    if "!d:~0,1!"=="-" (
        set /a "d=-(1!d:~1!+1!d:~1!-2!d:~1!)"
    ) else (
        set /a "d=1!d!+1!d!-2!d!"
    )
    set /a "day=!Date.r:z=%~4!"&set /a "month=!Date.r:z=%~5!"&set /a "year=(!Date.r:z=%~6!)+(!d!)"
    call :Date.IsLeapYear !year! || (
        if "!month!"=="2" (
            set /a "month+=!day!/28"
            set /a "day=!day! %% 28"
        )
    )
    (
        endlocal
        set %~1=%day%
        set %~2=%month%
        set %~3=%year%
    )
exit /b

::,--------------------------,---------------------------------------------------------------------------,-------,
::| :Date.DateSubstractYears |                                                                           |       |
::;--------------------------'                                                                           |  #44  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de soustraire un nombre d'ann??es ?? une date DD/MM/YYYY                                                |
::|                                                                                                              |
::| @param [out] {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [out] {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [out] {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Day        - Le jour (de 1 ?? 31)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Month      - Le mois (de 1 ?? 12)                                                       |
::|                                                                                                              |
::| @param [in]  {number} Year       - L'ann??e                                                                   |
::|                                                                                                              |
::| @param [in]  {number} Years      - Le nombre d'ann??es ?? soustraire ?? la date                                 |
::|                                                                                                              |
::| @see :Date.DateAddYears                                                                                      |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateSubstractYears day month year 29 2 2020 1                                                  |
::|    echo %day% %month% %year%                                                                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateSubstractYears <out:Day> <out:Month> <out:Year> <Day> <Month> <Year> <Years>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set "d=%~7"&set "d=!d: =!"
    if "!d:~0,1!"=="-" (
        set /a "d=-(1!d:~1!+1!d:~1!-2!d:~1!)"
    ) else (
        set /a "d=1!d!+1!d!-2!d!"
    )
    set /a "years=(!d!)*-1"
    call :Date.DateAddYears day month year "%~4" "%~5" "%~6" "!years!"
    (
        endlocal
        set %~1=%day%
        set %~2=%month%
        set %~3=%year%
    )
exit /b

::,----------------,-------------------------------------------------------------------------------------,-------,
::| :Date.AddYears |                                                                                     |       |
::;----------------'                                                                                     |  #45  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter un nombre d'ann??es ?? un Objet Date                                                          |
::|                                                                                                              |
::| @param [in/out] {Date}   Date       - Un Objet Date                                                          |
::|                                                                                                              |
::| @param [in]     {number} Years      - Le nombre d'ann??es ?? ajouter ?? l'Objet Date                            |
::|                                                                                                              |
::| @see :Date.SubstractYears                                                                                    |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.Create mydate "29 2 2020" "D M YYYY"                                                           |
::|    call :Date.AddYears mydate 1                                                                              |
::|    call :Date.Print mydate "DD MM YYYY"                                                                      |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.AddYears <Date> <Years>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    if not "!%~1.ObjectType!"=="Date" exit /b 1
    call :Date.DateAddYears day month year "!%~1.Day!" "!%~1.Month!" "!%~1.Year!" "%~2"
    (
        endlocal
        call :Date.ReBuild "%~1" "%day%" "%month%" "%year%"
    )
exit /b

::,----------------------,-------------------------------------------------------------------------------,-------,
::| :Date.SubstractYears |                                                                               |       |
::;----------------------'                                                                               |  #46  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de soustraire un nombre d'ann??es ?? un Objet Date                                                      |
::|                                                                                                              |
::| @param [in/out] {Date}   Date       - Un Objet Date                                                          |
::|                                                                                                              |
::| @param [in]     {number} Years      - Le nombre d'ann??es ?? soustraire ?? l'Objet Date                         |
::|                                                                                                              |
::| @see :Date.AddYears                                                                                          |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.Create mydate "29 2 2020" "D M YYYY"                                                           |
::|    call :Date.SubstractYears mydate 1                                                                        |
::|    call :Date.Print mydate "DD MM YYYY"                                                                      |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.SubstractYears <Date> <Years>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    if not "!%~1.ObjectType!"=="Date" exit /b 1
    call :Date.DateSubstractYears day month year "!%~1.Day!" "!%~1.Month!" "!%~1.Year!" "%~2"
    (
        endlocal
        call :Date.ReBuild "%~1" "%day%" "%month%" "%year%"
    )
exit /b

::,-----------------,------------------------------------------------------------------------------------,-------,
::| :Date.AddMonths |                                                                                    |       |
::;-----------------'                                                                                    |  #47  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter un nombre de mois ?? un Objet Date                                                           |
::|                                                                                                              |
::| @param [in/out] {Date}   Date       - Un Objet Date                                                          |
::|                                                                                                              |
::| @param [in]     {number} Months     - Le nombre de mois ?? ajouter ?? l'Objet Date                             |
::|                                                                                                              |
::| @see :Date.SubstractMonths                                                                                   |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.Create mydate "31 1 2021" "D M YYYY"                                                           |
::|    call :Date.AddMonths mydate 1                                                                             |
::|    call :Date.Print mydate "DD MM YYYY"                                                                      |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.AddMonths <Date> <Months>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    if not "!%~1.ObjectType!"=="Date" exit /b 1
    call :Date.DateAddMonths day month year "!%~1.Day!" "!%~1.Month!" "!%~1.Year!" "%~2"
    (
        endlocal
        call :Date.ReBuild "%~1" "%day%" "%month%" "%year%"
    )
exit /b

::,-----------------------,------------------------------------------------------------------------------,-------,
::| :Date.SubstractMonths |                                                                              |       |
::;-----------------------'                                                                              |  #48  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de soustraire un nombre de mois ?? un Objet Date                                                       |
::|                                                                                                              |
::| @param [in/out] {Date}   Date       - Un Objet Date                                                          |
::|                                                                                                              |
::| @param [in]     {number} Months     - Le nombre de mois ?? soustraire ?? l'Objet Date                          |
::|                                                                                                              |
::| @see :Date.AddMonths                                                                                         |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.Create mydate "31 5 2021" "D M YYYY"                                                           |
::|    call :Date.SubstractMonths mydate 1                                                                       |
::|    call :Date.Print mydate "DD MM YYYY"                                                                      |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.SubstractMonths <Date> <Months>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    if not "!%~1.ObjectType!"=="Date" exit /b 1
    call :Date.DateSubstractMonths day month year "!%~1.Day!" "!%~1.Month!" "!%~1.Year!" "%~2"
    (
        endlocal
        call :Date.ReBuild "%~1" "%day%" "%month%" "%year%"
    )
exit /b

::,---------------,--------------------------------------------------------------------------------------,-------,
::| :Date.AddDays |                                                                                      |       |
::;---------------'                                                                                      |  #49  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter un nombre de jours ?? un Objet Date                                                          |
::|                                                                                                              |
::| @param [in/out] {Date}   Date       - Un Objet Date                                                          |
::|                                                                                                              |
::| @param [in]     {number} Days       - Le nombre de jours ?? ajouter ?? l'Objet Date                            |
::|                                                                                                              |
::| @see :Date.SubstractDays                                                                                     |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.Create mydate "28 2 2021" "D M YYYY"                                                           |
::|    call :Date.AddDays mydate 1                                                                               |
::|    call :Date.Print mydate "DD MM YYYY"                                                                      |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.AddDays <Date> <Days>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    if not "!%~1.ObjectType!"=="Date" exit /b 1
    call :Date.DateToDayNumber "!%~1.Day!" "!%~1.Month!" "!%~1.Year!" days
    set /a "days+=!Date.r:z=%~2!"
    call :Date.DayNumberToDate !days! day month year
    (
        endlocal
        call :Date.ReBuild "%~1" "%day%" "%month%" "%year%"
    )
exit /b

::,---------------------,--------------------------------------------------------------------------------,-------,
::| :Date.SubstractDays |                                                                                |       |
::;---------------------'                                                                                |  #50  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de soustraire un nombre de jours ?? un Objet Date                                                      |
::|                                                                                                              |
::| @param [in/out] {Date}   Date       - Un Objet Date                                                          |
::|                                                                                                              |
::| @param [in]     {number} Days       - Le nombre de jours ?? soustraire ?? l'Objet Date                         |
::|                                                                                                              |
::| @see :Date.AddDays                                                                                           |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.Create mydate "1 3 2021" "D M YYYY"                                                            |
::|    call :Date.SubstractDays mydate 1                                                                         |
::|    call :Date.Print mydate "DD MM YYYY"                                                                      |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.SubstractDays <Date> <Days>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    if not "!%~1.ObjectType!"=="Date" exit /b 1
    call :Date.DateToDayNumber "!%~1.Day!" "!%~1.Month!" "!%~1.Year!" days
    set /a "days-=!Date.r:z=%~2!"
    call :Date.DayNumberToDate !days! day month year
    (
        endlocal
        call :Date.ReBuild "%~1" "%day%" "%month%" "%year%"
    )
exit /b

::,-------------------,----------------------------------------------------------------------------------,-------,
::| :Date.DateAddTime |                                                                                  |       |
::;-------------------'                                                                                  |  #51  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter/soustraire une dur??e ?? une date DD/MM/YYYY HH:II:SS                                         |
::|                                                                                                              |
::| @param [out] {number}   Day        - Le jour (de 1 ?? 31)                                                     |
::|                                                                                                              |
::| @param [out] {number}   Month      - Le mois (de 1 ?? 12)                                                     |
::|                                                                                                              |
::| @param [out] {number}   Year       - L'ann??e                                                                 |
::|                                                                                                              |
::| @param [out] {HH:II:SS} Time       - La dur??e                                                                |
::|                                                                                                              |
::| @param [in]  {number}   Day        - Le jour (de 1 ?? 31)                                                     |
::|                                                                                                              |
::| @param [in]  {number}   Month      - Le mois (de 1 ?? 12)                                                     |
::|                                                                                                              |
::| @param [in]  {number}   Year       - L'ann??e                                                                 |
::|                                                                                                              |
::| @param [in]  {HH:II:SS} Time       - La dur??e                                                                |
::|                                                                                                              |
::| @param [in]  {HH:II:SS} Times      - La dur??e ?? ajouter/soustraire ?? la date                                 |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateAddTime day month year t 14 09 2021 20:27:45 4:00:00                                       |
::|    echo %day% %month% %year% %t%                                                                             |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateAddTime <out:Day> <out:Month> <out:Year> <out:Time> <Day> <Month> <Year> <Time> <Times>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a "day=!Date.r:z=%~5!"&set /a "month=!Date.r:z=%~6!"&set /a "year=!Date.r:z=%~7!"
    call :TimeCalc.Add "%~8" "%~9" t
    set "ta=!t!"
    if "!t:~0,1!"=="-" set "ta=!t:~1!"
    set da=0&set ha=0&set ma=0&set sa=0
    for /f "tokens=1-3 delims=:" %%1 in ('echo;!ta!') do (
        set /a "ha=!Date.r:z=%%1!"&set /a "ma=!Date.r:z=%%2!"&set /a "sa=!Date.r:z=%%3!"
        set /a ma+=!sa!/60
        set /a sa=!sa! %% 60
        if !sa! leq 9 set sa=0!sa!
        set /a ha+=!ma!/60
        set /a ma=!ma! %% 60
        if !ma! leq 9 set ma=0!ma!
        set /a da+=!ha!/24
        set /a ha=!ha! %% 24
        if !ha! leq 9 set ha=0!ha!
        set ta=!ha!:!ma!:!sa!
        if "!t:~0,1!"=="-" set "ta=-!ta!"
    )
    if "!t:~0,1!"=="-" (
        call :Date.DateSubstractDays day month year !day! !month! !year! !da!
        call :TimeCalc.Add "24:00:00" "!ta!" t
        call :Date.DateSubstractDays day month year !day! !month! !year! 1
    ) else (
        set "t=!ta!"
        call :Date.DateAddDays day month year !day! !month! !year! !da!
    )
    (
        endlocal
        set %~1=%day%
        set %~2=%month%
        set %~3=%year%
        set %~4=%t%
    )
exit /b

::,-------------------------,----------------------------------------------------------------------------,-------,
::| :Date.DateSubstractTime |                                                                            |       |
::;-------------------------'                                                                            |  #52  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter/soustraire une dur??e ?? une date DD/MM/YYYY HH:II:SS                                         |
::|                                                                                                              |
::| @param [out] {number}   Day        - Le jour (de 1 ?? 31)                                                     |
::|                                                                                                              |
::| @param [out] {number}   Month      - Le mois (de 1 ?? 12)                                                     |
::|                                                                                                              |
::| @param [out] {number}   Year       - L'ann??e                                                                 |
::|                                                                                                              |
::| @param [out] {HH:II:SS} Time       - La dur??e                                                                |
::|                                                                                                              |
::| @param [in]  {number}   Day        - Le jour (de 1 ?? 31)                                                     |
::|                                                                                                              |
::| @param [in]  {number}   Month      - Le mois (de 1 ?? 12)                                                     |
::|                                                                                                              |
::| @param [in]  {number}   Year       - L'ann??e                                                                 |
::|                                                                                                              |
::| @param [in]  {HH:II:SS} Time       - La dur??e                                                                |
::|                                                                                                              |
::| @param [in]  {HH:II:SS} Times      - La dur??e ?? ajouter/soustraire ?? la date                                 |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateSubstractTime day month year t 15 09 2021 00:27:45 4:00:00                                 |
::|    echo %day% %month% %year% %t%                                                                             |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateSubstractTime <out:Day> <out:Month> <out:Year> <out:Time> <Day> <Month> <Year> <Time> <Times>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set "t=%~9"
    if "!t:~0,1!"=="-" (
        set "t=!t:~1!"
    ) else (
        set "t=-!t!"
    )
    call :Date.DateAddTime day month year t "%~5" "%~6" "%~7" "%~8" "!t!"
    (
        endlocal
        set %~1=%day%
        set %~2=%month%
        set %~3=%year%
        set %~4=%t%
    )
exit /b

::,---------------,--------------------------------------------------------------------------------------,-------,
::| :Date.AddTime |                                                                                      |       |
::;---------------'                                                                                      |  #53  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter/soustraire une dur??e ?? un Objet Date                                                        |
::|                                                                                                              |
::| @param [in/out] {Date}     Date       - Un Objet Date                                                        |
::|                                                                                                              |
::| @param [in]     {HH:II:SS} Time       - La dur??e ?? ajouter/soustraire ?? l'Objet Date                         |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.Create mydate "14 9 2021 20:27:45" "D M YYYY H:I:S"                                            |
::|    call :Date.AddTime mydate 4:00:00                                                                         |
::|    call :Date.Print mydate "D M YYYY HH:II:SS"                                                               |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.AddTime <Date> <Time>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    if not "!%~1.ObjectType!"=="Date" exit /b 1
    call :Date.DateAddTime day month year t "!%~1.Day!" "!%~1.Month!" "!%~1.Year!" "!%~1.Hour!:!%~1.Minute!:!%~1.Second!" "%~2"
    (
        endlocal
        set /a "%~1.Hour=1%t:~0,2%+1%t:~0,2%-2%t:~0,2%"
        set /a "%~1.Minute=1%t:~3,2%+1%t:~3,2%-2%t:~3,2%"
        set /a "%~1.Second=1%t:~6,2%+1%t:~6,2%-2%t:~6,2%"
        call :Date.ReBuild "%~1" "%day%" "%month%" "%year%"
    )
exit /b

::,---------------------,--------------------------------------------------------------------------------,-------,
::| :Date.SubstractTime |                                                                                |       |
::;---------------------'                                                                                |  #54  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter/soustraire une dur??e ?? un Objet Date                                                        |
::|                                                                                                              |
::| @param [in/out] {Date}     Date       - Un Objet Date                                                        |
::|                                                                                                              |
::| @param [in]     {HH:II:SS} Time       - La dur??e ?? ajouter/soustraire ?? l'Objet Date                         |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.Create mydate "15 9 2021 00:27:45" "D M YYYY H:I:S"                                            |
::|    call :Date.SubstractTime mydate 4:00:00                                                                   |
::|    call :Date.Print mydate "D M YYYY HH:II:SS"                                                               |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.SubstractTime <Date> <Time>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    if not "!%~1.ObjectType!"=="Date" exit /b 1
    call :Date.DateSubstractTime day month year t "!%~1.Day!" "!%~1.Month!" "!%~1.Year!" "!%~1.Hour!:!%~1.Minute!:!%~1.Second!" "%~2"
    (
        endlocal
        set /a "%~1.Hour=1%t:~0,2%+1%t:~0,2%-2%t:~0,2%"
        set /a "%~1.Minute=1%t:~3,2%+1%t:~3,2%-2%t:~3,2%"
        set /a "%~1.Second=1%t:~6,2%+1%t:~6,2%-2%t:~6,2%"
        call :Date.ReBuild "%~1" "%day%" "%month%" "%year%"
    )
exit /b

::,-------------------,----------------------------------------------------------------------------------,-------,
::| :Date.DateGetFrom |                                                                                  |       |
::;-------------------'                                                                                  |  #55  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de parser rapidement une date sous le format DD/MM/YYYY                                               |
::|                                                                                                              |
::| @param [in]  {DD/MM/YYYY} Date  - Une date sous le format DD/MM/YYYY                                         |
::|                                                                                                              |
::| @param [out] {number}     Year  - L'ann??e                                                                    |
::|                                                                                                              |
::| @param [out] {number}     Month - Le mois (de 1 ?? 12)                                                        |
::|                                                                                                              |
::| @param [out] {number}     Day   - Le jour (de 1 ?? 31)                                                        |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateGetFrom <DD/MM/YYYY> <out:Year> <out:Month> <out:Day>
    for /f "tokens=1-3 delims=/,-\ " %%1 in ('echo;%~1') do (
        set /a %~2=1%%~1+1%%~1-2%%~1
        set /a %~3=1%%~2+1%%~2-2%%~2
        set /a %~4=1%%~3+1%%~3-2%%~3
    )
exit /b

::,-------------------------------,----------------------------------------------------------------------,-------,
::| :Date.DateDiffenceBetweenDate |                                                                      |       |
::;-------------------------------'                                                                      |  #56  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de faire la diff??rence en jours entre deux dates                                                      |
::|                                                                                                              |
::| @param [in]  {DD/MM/YYYY} Date1  - Une date sous le format DD/MM/YYYY                                        |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time1  - Une dur??e sous la forme HH:II:SS                                          |
::|                                                                                                              |
::| @param [in]  {DD/MM/YYYY} Date2  - Une date sous le format DD/MM/YYYY                                        |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time2  - Une dur??e sous la forme HH:II:SS                                          |
::|                                                                                                              |
::| @param [out] {number}     Days   - Le nombre de jours entre les deux dates                                   |
::|                                                                                                              |
::| @param [out] {HH:II:SS}   Time   - La diff??rence de dur??e                                                    |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateDiffenceBetweenDate 14/05/1643 00:00:00 01/09/1715 00:00:00 days t                         |
::|    echo %days% %t%                                                                                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateDiffenceBetweenDate <DD/MM/YYYY> <HH:II:SS> <DD/MM/YYYY> <HH:II:SS> <out:Days> <out:HH:II:SS>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set date1=%~1&set date2=%~3
    call :Date.DateToDayNumber !date1:/= ! g1&call :Date.DateToDayNumber !date2:/= ! g2
    call :TimeCalc.Sub %~4 %~2 times
    if "%times:~0,1%"=="-" (
        set /a g1+=1&call :TimeCalc.Add %times% 23:59:60 times
    )
    (endlocal&set /a "%~5=%g2%-%g1%"&set "%~6=%times%")
exit /b

::,-------------------------------------,----------------------------------------------------------------,-------,
::| :Date.DateDiffenceBetweenDateFormat |                                                                |       |
::;-------------------------------------'                                                                |  #57  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de faire la diff??rence en jours entre deux dates                                                      |
::|                                                                                                              |
::| @param [in]  {DD/MM/YYYY} Date1 - Une date sous le format DD/MM/YYYY                                         |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time1 - Une dur??e sous la forme HH:II:SS                                           |
::|                                                                                                              |
::| @param [in]  {DD/MM/YYYY} Date2 - Une date sous le format DD/MM/YYYY                                         |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time2 - Une dur??e sous la forme HH:II:SS                                           |
::|                                                                                                              |
::| @param [out] {number}     Year  - L'ann??e                                                                    |
::|                                                                                                              |
::| @param [out] {number}     Month - Le mois (de 0 ?? 11)                                                        |
::|                                                                                                              |
::| @param [out] {number}     Week  - La semaine (de 0 ?? 3)                                                      |
::|                                                                                                              |
::| @param [out] {number}     Day   - Le jour (de 0 ?? 6)                                                         |
::|                                                                                                              |
::| @param [out] {HH:II:SS}   Time  - La diff??rence de dur??e                                                     |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.DateDiffenceBetweenDateFormat 14/05/1643 00:00:00 01/09/1715 00:00:00 year month week days t   |
::|    echo %year% %month% %week% %days% %t%                                                                     |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DateDiffenceBetweenDateFormat <DD/MM/YYYY> <HH:II:SS> <DD/MM/YYYY> <HH:II:SS> <out:Year> <out:Month> <out:Week> <out:Day> <out:HH:II:SS>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    call :Date.DateGetFrom %~1 d1 m1 y1
    call :Date.DateGetFrom %~3 d2 m2 y2
    set /a "totalmonths=(%y2% - %y1%) * 12 + %m2% - %m1%"
    if %d2% lss %d1% set /a totalmonths-=1
    set /a month=%totalmonths% %% 12 + %m1%
    set /a yeartmp=%totalmonths% / 12
    set /a monthtmp=%totalmonths% %% 12
    set /a y3=%y1%+%yeartmp%
    set /a m3=%m1%+%monthtmp%
    if %m3% gtr 12 (
        set /a m3=%m3%-12
        set /a y3+=1
    )
    call :Date.DateDiffenceBetweenDate "%d1%/%m3%/%y3%" "%~2" "%~3" "%~4" day times
    call :TimeCalc.Sub %~4 %~2 times
    if "%times:~0,1%"=="-" (
        set /a g1+=1&call :TimeCalc.Add %times% 23:59:60 times
    )
    (
        endlocal
        set /a %~5=%totalmonths% / 12
        set /a %~6=%totalmonths% %% 12
        set /a %~7=%day%/7
        set /a %~8=%day% %% 7
        set "%~9=%times%"
    )
exit /b

::,---------------------------,--------------------------------------------------------------------------,-------,
::| :Date.DiffenceBetweenDate |                                                                          |       |
::;---------------------------'                                                                          |  #58  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de faire la diff??rence en jours entre deux dates                                                      |
::|                                                                                                              |
::| @param [in]  {DD/MM/YYYY} Date1 - Une date sous le format DD/MM/YYYY                                         |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time1 - Une dur??e sous la forme HH:II:SS                                           |
::|                                                                                                              |
::| @param [in]  {DD/MM/YYYY} Date2 - Une date sous le format DD/MM/YYYY                                         |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time2 - Une dur??e sous la forme HH:II:SS                                           |
::|                                                                                                              |
::| @param [out] {number}     Year  - L'ann??e                                                                    |
::|                                                                                                              |
::| @param [out] {number}     Month - Le mois (de 0 ?? 11)                                                        |
::|                                                                                                              |
::| @param [out] {number}     Week  - La semaine (de 0 ?? 3)                                                      |
::|                                                                                                              |
::| @param [out] {number}     Day   - Le jour (de 0 ?? 6)                                                         |
::|                                                                                                              |
::| @param [out] {HH:II:SS}   Time  - La diff??rence de dur??e                                                     |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.Create mydate1 "14/05/1643 00:00:00" "DD/MM/YYYY HH:II:SS"                                     |
::|    call :Date.Create mydate2 "01/09/1715 00:00:00" "DD/MM/YYYY HH:II:SS"                                     |
::|    call :Date.DiffenceBetweenDate mydate1 mydate2 mydiff                                                     |
::|    echo Total Days: %mydiff.TotalDays% and %mydiff.Time%                                                     |
::|    echo %mydiff.Years% Years %mydiff.Months% Months %mydiff.Weeks% Weeks %mydiff.Days% Days^                 |
::|     %mydiff.Hours% Hours %mydiff.Minutes% Minutes and %mydiff.Seconds% Seconds                               |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.DiffenceBetweenDate <Date1> <Date2> <Diff>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set d1="!%~1.Day!/!%~1.Month!/!%~1.Year!" "!%~1.Hour!:!%~1.Minute!:!%~1.Second!"
    set d2="!%~2.Day!/!%~2.Month!/!%~2.Year!" "!%~2.Hour!:!%~2.Minute!:!%~2.Second!"
    call :Date.DateDiffenceBetweenDate !d1! !d2! days t
    call :Date.DateDiffenceBetweenDateFormat !d1! !d2! year month week day t
    (
        endlocal
        set "%~3.TotalDays=%days%"
        set "%~3.Time=%t%"
        set "%~3.Years=%year%"
        set "%~3.Months=%month%"
        set "%~3.Weeks=%week%"
        set "%~3.Days=%day%"
        set /a "%~3.Hours=1%t:~0,2%+1%t:~0,2%-2%t:~0,2%"
        set /a "%~3.Minutes=1%t:~3,2%+1%t:~3,2%-2%t:~3,2%"
        set /a "%~3.Seconds=1%t:~6,2%+1%t:~6,2%-2%t:~6,2%"
    )
exit /b

::,---------------,--------------------------------------------------------------------------------------,-------,
::| :TimeCalc.Add |                                                                                      |       |
::;---------------'                                                                                      |  #59  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter deux dur??es                                                                                 |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time2 - Une dur??e sous le forme HH:II:SS                                           |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time1 - Une dur??e sous la forme HH:II:SS                                           |
::|                                                                                                              |
::| @param [out] {HH:II:SS}   Time  - Le r??sultat sous la forme HH:II:SS                                         |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:TimeCalc.Add <HH:II:SS> <HH:II:SS> <out:result>
    setlocal
    call :TimeCalc.ToSecond "%~1" r1
    call :TimeCalc.ToSecond "%~2" r2
    set /a r1+=%r2%
    (
        endlocal
        call :TimeCalc.ToString "%r1%" "%~3"
    )
Exit /b

::,---------------,--------------------------------------------------------------------------------------,-------,
::| :TimeCalc.Sub |                                                                                      |       |
::;---------------'                                                                                      |  #60  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de soustraire deux dur??es                                                                             |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time2 - Une dur??e sous le forme HH:II:SS                                           |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time1 - Une dur??e sous la forme HH:II:SS                                           |
::|                                                                                                              |
::| @param [out] {HH:II:SS}   Time  - Le r??sultat sous la forme HH:II:SS                                         |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:TimeCalc.Sub <HH:II:SS> <HH:II:SS> <out:result>
    setlocal
    call :TimeCalc.ToSecond "%~1" r1
    call :TimeCalc.ToSecond "%~2" r2
    set /a r1-=%r2%
    (
        endlocal
        call :TimeCalc.ToString "%r1%" "%~3"
    )
Exit /b

::,--------------------,---------------------------------------------------------------------------------,-------,
::| :TimeCalc.ToSecond |                                                                                 |       |
::;--------------------'                                                                                 |  #61  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de convertir une dur??e HH:II:SS en secondes                                                           |
::|                                                                                                              |
::| @param [in]  {HH:II:SS}   Time   - Une dur??e sous le forme HH:II:SS                                          |
::|                                                                                                              |
::| @param [out] {number}     Second - Le nombre de secondes                                                     |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:TimeCalc.ToSecond <HH:II:SS> <out:Second>
    setlocal
    set tmp=%~1
    set neg=
    if "%tmp:~0,1%"=="-" (
        set neg=-
        set "tmp=%tmp:~1%"
    )
    for /f "tokens=1-3 delims=:," %%1 in ('echo;%tmp%') do (
        set h=%%~1
        set m=%%~2
        set s=%%~3
    )
    set /a "tmp=(1%h%+1%h%-2%h%)*3600 + (1%m%+1%m%-2%m%)*60 + (1%s%+1%s%-2%s%)"
    set "tmp=%neg%%tmp%"
    (
        endlocal
        set "%~2=%tmp%"
    )
Exit /b

::,--------------------,---------------------------------------------------------------------------------,-------,
::| :TimeCalc.ToString |                                                                                 |       |
::;--------------------'                                                                                 |  #62  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de convertir des secondes en une dur??e HH:II:SS                                                       |
::|                                                                                                              |
::| @param [in]  {number}   Second - Le nombre de secondes                                                       |
::|                                                                                                              |
::| @param [out] {HH:II:SS} Time   - La dur??e sous le forme HH:II:SS                                             |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:TimeCalc.ToString <Second> <out:result>
    setlocal
    set tmp=%~1
    if %tmp% lss 0 set tmp=%tmp:~1%
    set /a h=%tmp% / 3600
    set /a m=(%tmp% / 60) %% 60
    set /a s=%tmp% %% 60
    if %h% leq 9 set h=0%h%
    if %m% leq 9 set m=0%m%
    if %s% leq 9 set s=0%s%
    (
        endlocal
        if %~1 lss 0 (
            set %~2=-%h%:%m%:%s%
        ) else (
            set %~2=%h%:%m%:%s%
        )
    )
Exit /b

::,---------------------,--------------------------------------------------------------------------------,-------,
::| :Date.BuildCalendar |                                                                                |       |
::;---------------------'                                                                                |  #63  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de construire le calendrier                                                                           |
::|                                                                                                              |
::| @param [out] {Calendar} Calendar    - Le calendrier                                                          |
::|                                                                                                              |
::| @param [in]  {D|DD}     DayFormat   - D pour [ 1, 2,...,30,31] OU DD pour [01,02,...,30,31]                  |
::|                                                                                                              |
::| @param [in]  {number}   MonthPerRow - Le nombre de mois affich?? par ligne                                    |
::|                                                                                                              |
::| @param [in]  {number}   Year        - L'ann??e                                                                |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    call :Date.BuildCalendar calendar D 3 2021                                                                |
::|    for %%i in (%calendar%) do (                                                                              |
::|        echo;%%~i                                                                                             |
::|    )                                                                                                         |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.BuildCalendar <out:Calendar> <DayFormat> <MonthPerRow> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    for /l %%i in (1,1,12) do (
        call :Date.BuildMonthCalendar "m[%%~i]" "%~2" "%%~i" "%~4"
    )
    set i=0
    set "g="
    for /l %%i in (1,%~3,12) do (
        set /a "v=%%~i+%~3-2"
        if !v! gtr 12 set v=12
        set "k="
        for /l %%j in (%%~i,1,!v!) do (
            if "%%~i"=="%%~j" (
                set /a m=%%~j+1
                call :Date.BuildCalendarMerge "m[%%~j]" "m[!m!]" k
            ) else (
                set /a m=%%~j+1
                call :Date.BuildCalendarMerge "k" "m[!m!]" k
            )
        )
        for /l %%i in (0,1,!k.Length!) do (
            set g=!g! "!k[%%~i]!"
        )
    )
    (
        endlocal
        set "%~1=%g%"
    )
exit /b

::,--------------------------,---------------------------------------------------------------------------,-------,
::| :Date.BuildCalendarMerge | @PRIVATE                                                                  |       |
::;--------------------------'                                                                           |  #64  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de merge 2 mois ligne par ligne                                                                       |
::|                                                                                                              |
::| @param [in]  {CalendarMonth} CalendarMonth1        - Le calendrier du mois 1                                 |
::|                                                                                                              |
::| @param [in]  {CalendarMonth} CalendarMonth2        - Le calendrier du mois 2                                 |
::|                                                                                                              |
::| @param [out] {CalendarMonth} CalendarMonthMerged   - Le mois 1 et le mois 2 fusionn??                         |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    setlocal enabledelayedexpansion                                                                           |
::|                                                                                                              |
::|    rem on construit le calendrier des mois                                                                   |
::|    call :Date.BuildMonthCalendar janvier D 1 2021                                                            |
::|    call :Date.BuildMonthCalendar fevrier D 2 2021                                                            |
::|    call :Date.BuildMonthCalendar mars D 3 2021                                                               |
::|                                                                                                              |
::|    rem on les fusionne                                                                                       |
::|    call :Date.BuildCalendarMerge janvier fevrier mois                                                        |
::|    call :Date.BuildCalendarMerge mois mars mois                                                              |
::|                                                                                                              |
::|    rem on affiche                                                                                            |
::|    for /l %%i in (0,1,!mois.Length!) do echo;!mois[%%~i]!                                                    |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.BuildCalendarMerge <CalendarMonth1> <CalendarMonth2> <out:CalendarMonthMerged>
    setlocal enabledelayedexpansion
    set "r="
    for /l %%i in (0,1,8) do set r=!r!:"!%~1[%%~i]!  !%~2[%%~i]!"
    if !%~1.Length! gtr !%~2.Length! (
        set l=!%~1.Length!
    ) else (
        set l=!%~2.Length!
    )
    (
        endlocal
        for /f "tokens=1-8 delims=:" %%1 in ('echo;%r%') do (
            set "%~3[0]=%%~1"&set "%~3[1]=%%~2"&set "%~3[2]=%%~3"&set "%~3[3]=%%~4"&set "%~3[4]=%%~5"&set "%~3[5]=%%~6"&set "%~3[6]=%%~7"&set "%~3[7]=%%~8"
        )
        set "%~3=%r%"
        set "%~3.Length=%l%"
    )
exit /b

::,--------------------------,---------------------------------------------------------------------------,-------,
::| :Date.BuildMonthCalendar |                                                                           |       |
::;--------------------------'                                                                           |  #65  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de construire le calendrier d'un mois                                                                 |
::|                                                                                                              |
::| @param [out] {CalendarMonth} CalendarMonth - Le calendrier du mois                                           |
::|                                                                                                              |
::| @param [in]  {D|DD}     DayFormat          - D pour [ 1, 2,...,30,31] OU DD pour [01,02,...,30,31]           |
::|                                                                                                              |
::| @param [in]  {number}   Month              - Le mois (de 1 ?? 12)                                             |
::|                                                                                                              |
::| @param [in]  {number}   Year               - L'ann??e                                                         |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    setlocal enabledelayedexpansion                                                                           |
::|    call :Date.BuildMonthCalendar calendarmonth D 9 2021                                                      |
::|    for /l %%i in (0,1,!calendarmonth.Length!) do echo;!calendarmonth[%%~i]!                                  |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.BuildMonthCalendar <out:result> <DayFormat> <Month> <Year>
    if "%Date.Init%"=="" call :Date.Init
    setlocal enabledelayedexpansion
    set /a "month=(1%~3+1%~3-2%~3)-1"
    for %%i in ("!Date.Locale!") do (
        for %%j in ("!month!") do (
            call :Date.ComputeLengthString l Date.Language[%%~i].Month[%%~j]
            set /a "s=(21-(!l!+2))/2"&set "sp="&set "sps="
            for /l %%k in (1,1,!s!) do set "sp=!sp! "
            set /a "h=!s! %% 2"
            if "!h!"=="0" set "sps= "
            set r="!sp![!Date.Language[%%~i].Month[%%~j]!]!sp!!sps!":
        )
    )
    set r=!r!"
    for /l %%i in (0,1,6) do (
        for %%j in ("!Date.Locale!") do (
            set "r=!r! !Date.Language[%%~j].DayMin[%%~i]!"
        )
    )
    set r=!r!":"
    call :Date.GetDaysInMonth days "%~3" "%~4"
    call :Date.GetDayIndex index "1" "%~3" "%~4"
    call :Date.GetDayIndex index2 "!days!" "%~3" "%~4"
    for /l %%i in (1,1,!index!) do (
        set "r=!r!   "
    )
    set d=2
    for /l %%i in (1,1,!days!) do (
        if "%~2"=="D" (
            if %%~i leq 9 (
                set r=!r!  %%~i
            ) else (
                set r=!r! %%~i
            )
        ) else if "%~2"=="DD" (
            if %%~i leq 9 (
                set r=!r! 0%%~i
            ) else (
                set r=!r! %%~i
            )
        )
        set /a "v=(%%~i+!index!) %% 7"
        if "!v!"=="0" (
            set r=!r!":"
            if %%~i lss !days! (
                set /a d+=1
            ) else (
                set "r=!r!                     "
            )
        )
    )
    if not "!v!"=="0" (
        set /a "s=7-!index2!-1"
        set "sp="
        for /l %%i in (1,1,!s!) do set "sp=!sp!   "
        set r=!r!!sp!":"                     "
    ) else (
        set r=!r!"
    )
    set /a d+=1
    (
        endlocal
        for /f "tokens=1-8 delims=:" %%1 in ('echo;%r%') do (
            set "%~1[0]=%%~1"&set "%~1[1]=%%~2"&set "%~1[2]=%%~3"&set "%~1[3]=%%~4"&set "%~1[4]=%%~5"&set "%~1[5]=%%~6"&set "%~1[6]=%%~7"&set "%~1[7]=%%~8"
        )
        set "%~1=%r%"
        set "%~1.Length=%d%"
    )
exit /b

::,-----------------,------------------------------------------------------------------------------------,-------,
::| :Date.AddLocale |                                                                                    |       |
::;-----------------'                                                                                    |  #66  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'ajouter des langages                                                                                |
::|                                                                                                              |
::| @param [in]  {string}  Code        - Le code qui permet d'identifier le langage (FR, EN, JA, ...)            |
::|                                                                                                              |
::| @param [in]  {string}  Days        - La liste des jours (nom complet)                                        |
::|                                                                                                              |
::| @param [in]  {string}  DaysShort   - La liste des jours (nom court)                                          |
::|                                                                                                              |
::| @param [in]  {string}  DaysMin     - La liste des jours (abr??viation sur 2 lettres)                          |
::|                                                                                                              |
::| @param [in]  {string}  Months      - La liste des mois (nom complet)                                         |
::|                                                                                                              |
::| @param [in]  {string}  MonthsShort - La liste des mois (nom court)                                           |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    @see :Date.Init                                                                                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.AddLocale <Code> <Days> <DaysShort> <DaysMin> <Months> <MonthsShort>
    setlocal enabledelayedexpansion
    set locale=%~1
    set key=Date.Language[!locale!]
    set i=-2
    set "d="&set "ds="&set "dm="&set "m="&set "ms="
    for %%i in ('echo;%*') do (
        if !i! geq 0 (
            if !i! lss 7 (
                set d=!d! %%i
            ) else if !i! lss 14 (
                set ds=!ds! %%i
            ) else if !i! lss 21 (
                set dm=!dm! %%i
            ) else if !i! lss 33 (
                set m=!m! %%i
            ) else if !i! lss 45 (
                set ms=!ms! %%i
            )
        )
        set /a i+=1
    )
    set days=!d:~1!
    set daysshort=!ds:~1!
    set daysmin=!dm:~1!
    set months=!m:~1!
    set monthsshort=!ms:~1!
    set i=0
    set keys=days:Day daysshort:DayShort months:Month monthsshort:MonthShort daysmin:DayMin
    for %%k in (!keys!) do (
        for /f "tokens=1,2 delims=:" %%1 in ('echo;%%~k') do (
            set i=0&set "%%1data="
            for %%i in (!%%1!) do (
                set "%key%.%%2[!i!]=%%~i"
                set %%1data=!%%1data! "[!i!]:%%~i"
                set /a i+=1
            )
        )
    )
    set daysinmonth=
    set daysinmonthleap=
    set i=0&set j=0
    for /l %%i in (1,1,12) do (
        call :Date.GetDaysInMonth mt %%i 1
        call :Date.GetDaysInMonth mtl %%i 0
        set /a i+=!mt!&set /a j+=!mtl!
        set "daysinmonth=!daysinmonth! !i!"
        set "daysinmonthleap=!daysinmonthleap! !j!"
    )
    set "daysinmonth=!daysinmonth:~1!"
    set "daysinmonthleap=!daysinmonthleap:~1!"
    (
        endlocal
        set Date.Init=true
        set Date.RemoveLeadingZero=1zero+1zero-2zero
        set Date.r=1z+1z-2z
        if "%Date.Locale%"=="" set Date.Locale=%locale%
        set "Date.DaysInMonth=%daysinmonth%"
        set "Date.DaysInMonthLeap=%daysinmonthleap%"
        set %key%.Days=%days%
        set %key%.DaysShort=%daysshort%
        set %key%.Months=%months%
        set %key%.MonthsShort=%monthsshort%
        for %%i in (%days%) do set %key%.Data.dd.%%~i=1
        for %%i in (%daysshort%) do set %key%.Data.d.%%~i=1
        for %%i in (%months%) do set %key%.Data.mm.%%~i=1
        for %%i in (%monthsshort%) do set %key%.Data.m.%%~i=1
        for %%d in (%daysdata%) do (
            for /f "tokens=1,2 delims=:" %%1 in ('echo;%%~d') do set "%key%.Day%%1=%%2"
        )
        for %%d in (%monthsdata%) do (
            for /f "tokens=1,2 delims=:" %%1 in ('echo;%%~d') do set "%key%.Month%%1=%%2"
        )
        for %%d in (%daysshortdata%) do (
            for /f "tokens=1,2 delims=:" %%1 in ('echo;%%~d') do set "%key%.DayShort%%1=%%2"
        )
        for %%d in (%daysmindata%) do (
            for /f "tokens=1,2 delims=:" %%1 in ('echo;%%~d') do set "%key%.DayMin%%1=%%2"
        )
        for %%d in (%monthsshortdata%) do (
            for /f "tokens=1,2 delims=:" %%1 in ('echo;%%~d') do set "%key%.MonthShort%%1=%%2"
        )
    )
exit /b

::,---------------------------,--------------------------------------------------------------------------,-------,
::| :Date.ComputeLengthString |                                                                          |       |
::;---------------------------'                                                                          |  #67  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet de construire le calendrier d'un mois                                                                 |
::|                                                                                                              |
::| @param [out] {number}   Length   - La longueur de la cha??ne de caract??res                                    |
::|                                                                                                              |
::| @param [in]  {variable} Variable - Le nom de la variable qui contient la cha??ne de caract??res                |
::|                                                                                                              |
::| @example                                                                                                     |
::|                                                                                                              |
::|    set test=salut                                                                                            |
::|    call :Date.ComputeLengthString length test                                                                |
::|    echo;%length%                                                                                             |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.ComputeLengthString <out:Length> <Variable>
    setlocal EnableDelayedExpansion
    (set^ tmp=!%~2!)
    if defined tmp (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!tmp:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "tmp=!tmp:~%%P!"
            )
        )
    ) else (
        set len=0
    )
    ( 
        endlocal
        set "%~1=%len%"
    )
exit /b

::,-------------------------,----------------------------------------------------------------------------,-------,
::| :Date.Error.TimeInvalid | @PRIVATE                                                                   |       |
::;-------------------------'                                                                            |  #68  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| D??s que :Date.Create ??choue ?? parser le temps (HH:II:SS), le call est redirig?? ici                           |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.Error.TimeInvalid
    endlocal
    echo;Error: Time not valid
exit /b 2

::,-------------------------,----------------------------------------------------------------------------,-------,
::| :Date.Error.DateInvalid | @PRIVATE                                                                   |       |
::;-------------------------'                                                                            |  #69  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| D??s que :Date.Create ??choue ?? parser la date, le call est redirig?? ici                                       |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.Error.DateInvalid
    endlocal
    echo;Error: Date not valid
exit /b 2

::,------------,-----------------------------------------------------------------------------------------,-------,
::| :Date.Init | @PRIVATE                                                                                |       |
::;------------'                                                                                         |  #70  |
::|                                                                                                      |       |
::|                                                                                                      '-------;
::| Permet d'initialiser la classe Date (cette fonction ne doit pas ??tre appel??)                                 |
::|                                                                                                              |
::'--------------------------------------------------------------------------------------------------------------'
:Date.Init
    call :Date.AddLocale FR "lundi" "mardi" "mercredi" "jeudi" "vendredi" "samedi" "dimanche" "lun." "mar." "mer." "jeu." "ven." "sam." "dim." "lu" "ma" "me" "je" "ve" "sa" "di" "janvier" "fevrier" "mars" "avril" "mai" "juin" "juillet" "aout" "septembre" "octobre" "novembre" "decembre" "janv." "fevr." "mars" "avr." "mai" "juin" "juil." "aout" "sept." "oct." "nov." "dec." Local
    call :Date.AddLocale EN "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday" "Mon" "Tue" "Wed" "Thu" "Fri" "Sat" "Sun" "Mo" "Tu" "We" "Th" "Fr" "Sa" "Su" "January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December" "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec" Local
exit /b

rem ============= DATE =============
rem 
rem Properties:
rem 
rem .Year
rem    - Description: The Full Year
rem    - Format     : YYYY
rem    - Example    : 1985, 2021, ...
rem 
rem .Month
rem    - Description: The Month
rem    - Format     : M
rem    - Example    : 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
rem 
rem .Day
rem    - Description: The Day
rem    - Format     : D
rem    - Example    : 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
rem 
rem .Hour
rem    - Description: The Hour
rem    - Format     : H
rem    - Example    : 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23
rem 
rem .Minute
rem    - Description: The Minute
rem    - Format     : I
rem    - Example    : 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, ..., 55, 56, 57, 58, 59
rem 
rem .Second
rem    - Description: The Second
rem    - Format     : S
rem    - Example    : 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, ..., 55, 56, 57, 58, 59
rem 
rem .Timestamp
rem    - Description: The Timestamp UTC (second since 01/01/1970 00:00:00 UTC)
rem    - Format     : T
rem    - Example    : 1630521150
rem 
rem .SecondSinceEpoch
rem    - Description: The Timestamp (timezone) (second since 01/01/1970 00:00:00 GMT+(timezone))
rem    - Format     : T
rem    - Example    : 1630513950
rem 
rem .MonthName
rem    - Description: The Month Name
rem    - Format     : mm
rem    - Example    : January, February, March, April, May, June, July, August, September, October, November, December
rem 
rem .DayName
rem    - Description: The Day Name [International Standard ISO 8601]
rem    - Format     : dd
rem    - Example    : Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
rem 
rem .MonthShortName
rem    - Description: The Month Short Name
rem    - Format     : m
rem    - Example    : Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
rem 
rem .DayShortName
rem    - Description: The Day Short Name [International Standard ISO 8601]
rem    - Format     : d
rem    - Example    : Mon, Tue, Wed, Thu, Fri, Sat, Sun
rem 
rem .WeekOfMonth
rem    - Description: The Week of the Month
rem    - Format     : w
rem    - Example    : 1, 2, 3, 4, 5
rem 
rem .WeekOfYear
rem    - Description: The Week from the start of the Year
rem    - Format     : W
rem    - Example    : 1, 2, 3, 4, 5, 6, ..., 47, 48, 49, 50, 51, 52
rem 
rem .DayOfWeek
rem    - Description: The Day from the start of the week [International Standard ISO 8601]
rem    - Format     : DDD
rem    - Example    : 1 (Monday), 2 (Tuesday), 3 (Wednesday), 4 (Thursday), 5 (Friday), 6 (Saturday), 7 (Sunday)
rem 
rem ==================================


rem ============= FORMAT =============
rem === Day ===
rem   DDD -> 1 (Monday), 2 (Tuesday), 3 (Wednesday), 4 (Thursday), 5 (Friday), 6 (Saturday), 7 (Sunday)
rem   DD  -> 01, 02, 03, ..., 29, 30, 31
rem   D   -> 1, 2, 3, ..., 29, 30, 31
rem   dd  -> Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
rem   d   -> Mon, Tue, Wed, Thu, Fri, Sat, Sun
rem ===========
rem 
rem === Month ===
rem   MM -> 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12
rem   M  -> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
rem   mm -> January, February, March, April, May, June, July, August, September, October, November, December
rem   m  -> Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
rem ===========
rem 
rem === Week ===
rem   W  -> 1, 2, 3, ..., 50, 51, 52, 53 (week number)
rem   w  -> 1, 2, 3, 4, 5 (week of month)
rem ===========
rem 
rem === Year ===
rem   YYYY -> 1652, 1875, 1986, 2014, 2021, 2156, ...
rem ===========
rem 
rem === Hour ===
rem   HH -> 00, 01, 02, ..., 21, 22, 23
rem   H  -> 0, 1, 2, ..., 21, 22, 23
rem ===========
rem 
rem === mInute ===
rem   II -> 00, 01, 02, ..., 57, 58, 59
rem   I  -> 0, 1, 2, ..., 57, 58, 59
rem ===========
rem 
rem === Second ===
rem   SS -> 00, 01, 02, ..., 57, 58, 59
rem   S  -> 0, 1, 2, ..., 57, 58, 59
rem ===========
rem ==================================
