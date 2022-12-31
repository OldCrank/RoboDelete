# 15/12/22 Use robocopy to empty directories containing long path name files.
# Author: Craig Lavender

# Create some environment variables.
if ($env:lastInputDir -lt " ") { $env:lastInputDir = "Dir not set"}
if ($env:lastInputFilter -lt " ") { $env:lastInputFilter = "Filter not set"}
#$env:lastInputDir = "Dir not set"
Write-Host $env:lastInputDir
Write-Host $env:lastInputFilter

Write-Host " "
Write-Host "Example input dir: Z:\ACER-S7\Cobian" -ForegroundColor Green
$inputDir = Read-host “enter the input directory[”$env:lastInputDir"]"
if ($inputDir -lt " ") {$inputDir = $env:lastInputDir}
# Store inputDir for next run
$env:lastInputDir = $inputDir

Write-Host "Example input filter: Users 2021*(Incremental)" -ForegroundColor Green
$inputFilter = Read-host “enter the input filter[”$env:lastInputFilter"]"
if ($inputFilter -lt " ") {$inputFilter = $env:lastInputFilter}
# Store inputFilter for next run
$env:lastInputFilter = $inputFilter
Write-Host "Input Directory: " $inputDir
Write-Host "Input Filter: " $inputFilter

Write-Host "Confirm user input"
$confirm1 = Read-Host "do you want to continue"
if ($confirm1 -eq 'y') {
Write-Host "answer provided is yes" -ForegroundColor Green
}
else
{
Write-Host "answer provided is no" -ForegroundColor Red
Exit
}



##$directoryList = Get-ChildItem Z:\ACER-S7\Cobian
##$directoryList = Get-ChildItem Z:\ACER-S7\Cobian | where {$_ -like "Users 2020*"}
##$directoryList = Get-ChildItem $inputDir | where {$_ -like "Users 2021*(Incremental)"}
$directoryList = Get-ChildItem $inputDir | where {$_ -like $inputFilter}

# The next line will output the directoryList.
##$directoryList
Write-Host     # ouput blank line.
# next line is just outputted as it is to screen.
 "- - - - - - - - - - - - - - - - - -"
 Write-Host "Folders to purge!" -ForegroundColor Green
# or can use write-host
Write-Host "- - - - - - - - - - - - - - - - - -"

foreach ($name in $directoryList) {$name}


Write-Host "Confirm directory list. Operation will start if yes" -ForegroundColor Green
$confirm1 = Read-Host "do you want to continue"
if ($confirm1 -eq 'y') {
Write-Host "answer provided is yes" -ForegroundColor Green
}
else
{
Write-Host "answer provided is no" -ForegroundColor Red
Exit
}

# Record how long it takes.
$startTime = Get-Date -DisplayHint Time
Write-Host $startTime

# Another timer option.
$sw = [Diagnostics.Stopwatch]::StartNew()

# TODO add robocopy cmd here
##robocopy Z:\empty "Z:\ACER-S7\Cobian\USERS 2020-01-26 19;00;53 (Full)" /purge
foreach ($name in $directoryList) {
##robocopy Z:\empty "Z:\ACER-S7\Cobian\"$name /purge
##Write-Host Z:\empty "Z:\ACER-S7\Cobian\"$name /purge   ### worked
##Write-Host Z:\empty $directoryList+"\"+$name /purge
##robocopy "Z:\empty "$directoryList"\"$name /purge
robocopy Z:\empty $inputDir"\"$name /purge
}

# End Time
$endTime = Get-Date -DisplayHint Time
Write-Host $endTime

$duration = $endTime - $startTime
Write-Host "Operation took: "$duration

# Stop Timer.
$sw.Stop()

# Store Elapsed time into desired vars

$ms = $sw.Elapsed.Milliseconds

$min = $sw.Elapsed.Minutes

$hours = $sw.Elapsed.Hours

$MeasureItem = $block.Count
 # Display timer statistics to host

Write-Host "Total elapsed time in minutes: $min , in hours : $hours and milliseconds : $ms for a number of : $MeasureItem items" -ForegroundColor:Green

If ($strerror)

     {

$ErrorCount = ($strerror).Count

Write-Warning "Error Variable contains some errors : $errorCount"

Write-Warning 'Use the following command to parse errors: "$strerror.Message.Exception"'

     }

Else {

Write-Warning "End of process without errors"

     }