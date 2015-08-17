# We load our maintanance page 
$maintanancePage = Get-Content -Raw "C:\Users\pien329376\Desktop\index3.html" 

# we define our countries
$pageCountries= @(    @{country="NL";locale=@("nl-NL","en-US")}, `
                      @{country="BE";locale=@("nl-BE","fr-BE","de-DE","en-US")},`
                      @{country="FR";locale=@("fr-FR")},`
                      @{country="DE";locale=@("de-DE")},`
                      @{country="UK";locale=@("en-GB")},`
                      @{country="US";locale=@("en-US")} 
)

# maintanance start date 
$maintananceStartDate=[datetime]::new(2015,8,16,1,0,0) # year,month,day,hour,minute,second

# maintanance duration (should be per country maybe ? )
[int]$maintananceDuration = 4

# stop time is 
$maintananceStopDate = $maintananceStartDate.AddHours($maintananceDuration)

# We start with each country
foreach($singleCountry in $pageCountries)
{
   
   # we then go for each locale
   foreach($languageLocale in $singleCountry.locale)
   {
        # get culture 
        $cultureCurrent = New-Object system.globalization.cultureinfo($languageLocale)
    
        # We define our props 
        $props = @{ dayOfWeek=$cultureCurrent.DateTimeFormat.DayNames[ [int]$maintananceStartDate.DayOfWeek ]; 
                    day=$maintananceStartDate.Day; 
                    month=$cultureCurrent.DateTimeFormat.MonthNames[ $maintananceStartDate.Month ];
                    startTime=$maintananceStartDate.ToShortTimeString();
                    stopTime=$maintananceStopDate.ToShortTimeString();
                    datetime=$maintananceStartDate.ToShortDateString()}

        # We need to now interate each of the props and make appropiate replacements
        foreach($item in $props.GetEnumerator()|select Name -ExpandProperty Name) 
        {
            
            $filter = "{" + [string]::Format('{0}_{1}_{2}',$singleCountry.country, $languageLocale, $item) + "}"

            Write-Host "Our filter is $filter" -ForegroundColor Yellow
            Write-Host "Target Value is $($props[ $item ] )" -ForegroundColor Yellow

            $maintanancePage = $maintanancePage.Replace( $filter, $props[ $item ] )
        }

   }

}
$maintanancePage =  $maintanancePage.Replace("{datetime}",$maintananceStartDate.ToShortDateString())
$maintanancePage =  $maintanancePage.Replace("{year}",$maintananceStartDate.Year)
$maintanancePage | Out-File C:\temp\new.txt -Encoding utf8