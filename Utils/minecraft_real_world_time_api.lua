--[[
    
    Minecraft Real World Time API Version 1.0
      by surferpup
      
    Allows for obtaining real world date/time variables
    from www.timeapi.org.

    Numerous time date formats are pre-defined.  You can also return
    all time elements as a table.
    
    A time out feature exists to return an error value if the website
    times out.
    
]]

local beforeString = "+hours+before+now"
local afterString = "+hours+after+now"
local now = "now"
local timeZone = "edt"
local modifier = 0
local url="http://www.timeapi.org/"
local httpString =""
local requestTimeOut = 5
local timeResult

--[[
    These are the allowed parameters for formatting on timeapi.org
    
    In the url, the '%' character is substituted as % and the space is %20
    
    %a - The abbreviated weekday name (“Sun”)
    %A - The full weekday name (“Sunday”)
    %b - The abbreviated month name (“Jan”)
    %B - The full month name (“January”)
    %c - The preferred local date and time representation
    %d - Day of the month (01..31)
    %H - Hour of the day, 24-hour clock (00..23)
    %I - Hour of the day, 12-hour clock (01..12)
    %j - Day of the year (001..366)
    %m - Month of the year (01..12)
    %M - Minute of the hour (00..59)
    %p - Meridian indicator (“AM” or “PM”)
    %S - Second of the minute (00..60)
    %U - Week number of the current year,
         starting with the first Sunday as the first day
         of the first week (00..53)
    %W - Week number of the current year,
         starting with the first Monday as the first day
         of the first week (00..53)
    %w - Day of the week (Sunday is 0, 0..6)
    %x - Preferred representation for the date alone, no time
    %X - Preferred representation for the time alone, no date
    %y - Year without a century (00..99)
    %Y - Year with century
    %Z - Time zone name
    %% - Literal “%” character
    
]]

format={
    timeShort_12 = 1;
    timeLong_12 = 2;

    timeShort_24 = 3;
    timeLong_24 = 4;

    dateShort = 5;
    dateLong = 6;

    date_mmddyy= 5;
    date_mmddyyyy = 6;

    date_ddmmyy = 7;
    date_ddmmyyyy = 8;

    date_yymmdd =9;
    date_yyyymmdd = 10;
    
    dateTime12_mmddyy = 11;
    dateTime12_mmddyyyy = 12;
    dateTime12_ddmmyy = 13;
    dateTime12_ddmmyyyy = 14;
    
    dateTime24_mmddyy = 15;
    dateTime24_mmddyyyy = 16;
    dateTime24_ddmmyy = 17;
    dateTime24_ddmmyyyy = 18;
    
    default=12;
    defaultDate=6;
    defaultTime=1;
    raw = 19;
}

dateSeparator=
{
    comma=",";
    dash="-";
    period=".";
    slash="/";
    underscore="_";
    none="";
    
}

local separator= separator or dateSeparator.dash

formats ={
    [1]="%l:%M %p";
    [2]="%l:%M:%S %p";
    [3]="%H:%M";
    [4]="%l:5M:%S";
    
    [5]=("%m"..separator.."%d"..separator.."%y");
    [6]=("%m"..separator.."%d"..separator.."%Y");
    
    [7]=("%d"..separator.."%m"..separator.."%y");
    [8]=("%d"..separator.."%m"..separator.."%Y");
    
    [9]=("%y"..separator.."%m"..separator.."%d");
    [10]=("%Y"..separator.."%m"..separator.."%d");
    
    [11]=("%m"..separator.."%d"..separator.."%y  %l:%M %p");
    [12]=("%m"..separator.."%d"..separator.."%Y  %l:%M %p");
    [13]=("%d"..separator.."%m"..separator.."%y  %l:%M %p");
    [14]=("%d"..separator.."%m"..separator.."%Y  %l:%M %p");
    
    [15]=("%m"..separator.."%d"..separator.."%y  %H:%M");
    [16]=("%m"..separator.."%d"..separator.."%Y  %H:%M");
    [17]=("%d"..separator.."%m"..separator.."%y  %H:%M");
    [18]=("%d"..separator.."%m"..separator.."%Y  %H:%M");
    
    [19] = ("");
}

zones={
    utc={zone="utc", name = "Coordinated Universal Time"};
    cst={zone = "cst", name = "Central Standard Time"};
    cdt={zone = "cdt", name = "Central Daylight Time"};
    est={zone = "est", name = "Eastern Standard Time"};
    edt={zone = "edt", name = "Eastern Daylight Time"};
    pst={zone = "pst", name = "Pacific Standard Time"};
    pdt={zone = "pdt", name = "Pacific Daylight Time"};
    mst={zone = "mst", name = "Mountain Standard Time"};
    mdt={zone = "mdt", name = "Mountain Daylight Time"};
    
}

local timeTableIndex = {
    [1] = "dayNameShort";
    [2] = "dayNameLong";
    [3] = "monthNameShort";
    [4] = "monthNameLong";
    [5] = "preferredLocalDateTime";
    [6] = "day";
    [7] = "hour12";
    [8] = "hour24";
    [9] = "dayOfYear";
    [10] = "month";
    [11] = "minute";
    [12] = "meridian";
    [13] = "meridianCaps";
    [14] = "second";
    [15] = "weekNumberSunday";
    [16] = "weekNumberMonday";
    [17] = "dayOfWeek";
    [18] = "preferredDate";
    [19] = "preferredTime";
    [20] = "yearShort";
    [21] = "year";
    [22] = "zone";
    [23] = "error"   
}

local function resetFormats()
    formats ={
        [1]="%l:%M %p";
        [2]="%l:%M:%S %p";
        [3]="%H:%M";
        [4]="%l:5M:%S";
        
        [5]=("%m"..separator.."%d"..separator.."%y");
        [6]=("%m"..separator.."%d"..separator.."%Y");
        
        [7]=("%d"..separator.."%m"..separator.."%y");
        [8]=("%d"..separator.."%m"..separator.."%Y");
        
        [9]=("%y"..separator.."%m"..separator.."%d");
        [10]=("%Y"..separator.."%m"..separator.."%d");
        
        [11]=("%m"..separator.."%d"..separator.."%y  %l:%M %p");
        [12]=("%m"..separator.."%d"..separator.."%Y  %l:%M %p");
        [13]=("%d"..separator.."%m"..separator.."%y  %l:%M %p");
        [14]=("%d"..separator.."%m"..separator.."%Y  %l:%M %p");
        
        [15]=("%m"..separator.."%d"..separator.."%y  %H:%M");
        [16]=("%m"..separator.."%d"..separator.."%Y  %H:%M");
        [17]=("%d"..separator.."%m"..separator.."%y  %H:%M");
        [18]=("%d"..separator.."%m"..separator.."%Y  %H:%M");
        
        [19] = ("");
    }
end

function setSeparator( separatorString )
    separator = dateSeparator[separatorString] or separatorString or dateSeperator.dash
    resetFormats()
end

function getSeperator()
    return separator
end

local function getZones()
    return zones
end


local function getHelp()
    return help
end

local function printHelp()
end

function string:split(pattern)
    local fields = {}
    local start = 1
    self:gsub("()("..pattern..")", 
       function(c,d)
          table.insert(fields,self:sub(start,c-1))
          start = c + #d
       end
    )
    table.insert(fields, self:sub(start))
    return fields
end

local function split(stringToSplit,pattern)
    local fields = {}
    local start = 1
    string.gsub(stringToSplit,"()("..pattern..")", 
       function(c,d)
          table.insert(fields,string.sub(stringToSplit,start,c-1))
          start = c + #d
       end
    )
    table.insert(fields, string.sub(stringToSplit,start))
    return fields
end

local function getRequest()
    result,timeResult = pcall (function() return (http.get(httpString)).readAll() end)
    if not result then 
        return "BadReq"
    else
        return timeResult
    end
end

local function initiateTimer()
    sleep(requestTimeOut)
    timeResult = "timeout"
    return timeResult
end

local function startRequest(request,timeOut)
    requestTimeOut = tonumber(timeOut) or 0
    if requestTimeOut <=0 then requestTimeOut = false end
    request = request or ""
    httpString = request
    if not requestTimeOut then
        return getRequest()
    else
        parallel.waitForAny(getRequest,initiateTimer)
        return timeResult
    end
end 
    

--[[
    
    PUBLIC API FUNCTIONS
    
    
]]

--[[ getTime, printTime

    Arguments
    
    timeZone:
            A legitimate timezone from the zones table.
            If it is not specified or in error, UTC is chosen.
            You can print the pre-defined zones using
            the printZones() function.
    
    offset:
            An integer argument (positive or negative) to use
            To offset time by x hours. Ex.  -47 would give
            time/date 47 hours before the present time.
    
    dateTimeFormat:
            An integer value from the format enumerator.
            If not specified or in error, will use the
            preferred local date/time format specified by
            timeapi.org.  You can print the pre-defined
            formats using the printFormats() function.

]]
function getTime(timeZone,offset,dateTimeFormat,timeOut)
    timeZone = timeZone or "utc"
    offset = offset or 0
    dateTimeFormat = dateTimeFormat or format.raw
    timeOut = timeOut or 0
    if type(timeOut) ~= "number" then timeOut = 0 end
    if not formats[dateTimeFormat]
        then dateTimeFormat = format.default
    end
    offset = tonumber(offset)
    offset = offset or 0
    local modifierString = afterString
    if offset < 0 then modifierString = beforeString offset = math.abs(offset) end
    if not zones[timeZone] then
        timeZone = "utc"
    end
    local formatString = formats[dateTimeFormat]
    if formatString ~= "" then
        formatString = "?format=" .. textutils.urlEncode(formats[dateTimeFormat])
    else
        formatString = ""
    end
    return startRequest((url..timeZone.."/"..tostring(offset)..modifierString..formatString),timeOut)
end


function printTime( ... )
    print (getTime( ... ))
end

--[[ getTimeTable, printTimeTable

    The ability to get the full time table of the current
    date time allows for infinite flexibility in programming
    your own time formats.
    
    Arguments
    
    timeZone:
            A legitimate timezone from the zones table.
            If it is not specified or in error, UTC is chosen.
            You can print the pre-defined zones using
            the printZones() function.
    
    offset:
            An integer argument (positive or negative) to use
            To offset time by x hours. Ex.  -47 would give
            time/date 47 hours before the present time.
    
    makeNumeric:
            boolean true, false
            true -- will convert leading-zero strings in
                the time table to numeric values.  For example,
                the string value for 3 minutes is "03."  As a
                numeric, it will become the number value 3.
                However, if the value must be a string ("Monday"),
                it will remain a string.
            false or nil -- will leave all values as strings.
]]


function getTimeTable(timeZone,offset,makeNumeric,timeOut) --returns table
    -- check arguments
    timeZone = timeZone or "utc"
    offset = offset or 0
    offset = tonumber(offset)
    timeOut = timeOut or 0
    if type(timeOut) ~= "number" then timeOut = 0 end
    local modifierString = afterString
    if offset < 0 then
        modifierString = beforeString
        offset = math.abs(offset)
    end
    if not zones[timeZone] then
        timeZone = "utc"
    end
    -- Set up timeapi.org format string and get time
    local tableFormat = "?format=%25a,%25A,%25b,%25B,%25c,%25d,%25I,%25H,%25j,%25m,%25M,%25P,%25p,%25S,%25U,%25W,%25w,%25x,%25X,%25y,%25Y,%25z"
    local timeTableAsString = startRequest(url..timeZone.."/"..tostring(offset)..modifierString..tableFormat,timeOut)
    
    -- create timeTable from string
    local timeTable ={}
    local tempTable = split(timeTableAsString,",")
    if #tempTable > 1 then
        for i = 1,#tempTable do
            timeTable[ timeTableIndex[i] ] =  tempTable[i]
        end
        
        -- Instead of strings ("01") use numeric values ( 1 )
        if makeNumeric then
            timeTable.day = tonumber(timeTable.day)
            timeTable.hour12 = tonumber(timeTable.hour12)
            timeTable.hour24 = tonumber(timeTable.hour24)
            timeTable.dayOfYear = tonumber(timeTable.dayOfYear)
            timeTable.month = tonumber(timeTable.month)
            timeTable.minute = tonumber(timeTable.minute)
            timeTable.second = tonumber(timeTable.second)
            timeTable.weekNumberSunday = tonumber(timeTable.weekNumberSunday)
            timeTable.dayOfWeek = tonumber(timeTable.dayOfWeek)
            timeTable.year = tonumber(timeTable.year)
        end
    else
        timeTable.error = tempTable[1]
    end
    return timeTable
end

-- Gets time, prints all values in timeTable
function printTimeTable( ... )
    local timeTable = getTimeTable( ...)
    -- use monitor height to pause output
    local width,height = term.getSize()
    local currentRow = 1
    local function pause()
        term.setCursorPos(1,height)
        term.write("... Press any key to continue ...")
        os.pullEvent("key")
        term.setCursorPos(1,height)
        term.clearLine()
        currentRow = 1
    end
    for i,v in ipairs(timeTableIndex) do
        print (v..": "..tostring(timeTable[v]))
        currentRow = currentRow+1
        if currentRow > height - 1 then
            pause()
        end      
    end
end

--[[ printZones, printFormats

    Utility functions to print what zones
    or formats are pre-defined.
    
    Arguments
    
    timeZone:
            A legitimate timezone from the zones table.
            If it is not specified or in error, UTC is chosen.
            You can print the pre-defined zones using
            the printZones() function.
    
    offset:
]]

function printZones()
    local zoneKeys = {}
    for n in pairs(zones) do table.insert(zoneKeys, n) end
    table.sort(zoneKeys)
    for i,k in ipairs(zoneKeys) do
        print (k.." ("..zones[k].name..")")
    end
end

function printFormats()
    local formatKeys = {}
    
    -- use monitor height to pause output
    local width,height = term.getSize()
    local currentRow = 1
    local function pause()
        term.setCursorPos(1,height)
        term.write("... Press any key to continue ...")
        os.pullEvent("key")
        term.setCursorPos(1,height)
        term.clearLine()
        currentRow = 1
    end
    
    for n in pairs(format) do table.insert(formatKeys, n) end
    table.sort(formatKeys)
    
    for i,k in ipairs(formatKeys) do
        print (k.." ("..format[k]..")")
        currentRow = currentRow+1
        if currentRow > height - 1 then
            pause()
        end    
    end
end