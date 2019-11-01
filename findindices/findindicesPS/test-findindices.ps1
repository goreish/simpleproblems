# Dot source the solution file
. .\findindices.ps1

function verifyResults($expected, $result)
{
    if ($expected.length -eq 2 -and 
        $expected.length -eq $result.length -and 
        $expected[0] -eq $result[0] -and 
        $expected[1] -eq $result[1]) 
    {
        Write-Host "[OK] expected [$($expected)],  result [$($result)]" -ForegroundColor Green;
    }
    else 
    {
        Write-Host "[NOT OK] expected [$($expected)],  result [$($result)]" -ForegroundColor Red;   
    }
}

Write-Host "Test 1: Empty input list" -ForegroundColor Blue;
$expected = @(-1, -1);
$result = findIndices  -list @() -target 10 -debug;
verifyResults $expected $result;


Write-Host "Test 2: Two elements in input add to target" -ForegroundColor Blue;
$expected = @(0, 1);
$result = findIndices -list $(1, 2) -target 3 -debug;
verifyResults $expected $result;

Write-Host "Test 3: First and last of three add to target" -ForegroundColor Blue;
$expected = @(0, 2);
$result = findIndices -list @(1, 3, 6) -target 7 -debug;
verifyResults $expected $result;


Write-Host "Test 4: Two middle of four add to target" -ForegroundColor Blue;
$expected = @(1, 2);
$result = findIndices -list @(1, 2, 3, 7) -target 5 -debug;
verifyResults $expected $result;

Write-Host "Test 5: Last two elements of five add to target" -ForegroundColor Blue;
$expected = @(3, 4);
$result = findIndices -list @(0, 1, 3, 5, 7) -target 12 -debug;
verifyResults $expected $result; 


Write-Host "Test 6: No two elements of five add to target" -ForegroundColor Blue;
$expected = @(-1, -1);
$result = findIndices -list @(1, 2, 3, 4, 5) -target 10 -debug; 
verifyResults $expected $result;