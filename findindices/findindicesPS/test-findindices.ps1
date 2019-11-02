# To run these tests:
# Save the solution file (findindices.ps1) in a local directory
# Save this tests file in same directory & give it a different name (test-findindices.ps1)
# Open PowerShell Command prompt and type the tests file name (with relative path). 
#
# Dot source the solution file
. .\findindices.ps1

# Variables to store summary results
# To learn more about variables scopes search net for about_scopes
$script:Passed_tests_count = 0;
$script:Failed_tests_count = 0;

# To enable debugging output change to value to $true 
# To Learn more about splatting search net for about_splatting
$Enable_Debug = @{debug = $false };

# A helper function to verify results
function verifyResults($expected, $result)
{

    if ($expected.length -eq 2 -and 
        $expected.length -eq $result.length -and 
        $expected[0] -eq $result[0] -and 
        $expected[1] -eq $result[1]) 
    {
        Write-Host "[OK] expected [$($expected)], result [$($result)]" -ForegroundColor Green;

        # Increment passed tests count
        $script:Passed_tests_count++;
    }
    else 
    {
        Write-Host "[NOT OK] expected [$($expected)], result [$($result)]" -ForegroundColor Red; 
        
        # Increment failed tests count
        $script:Failed_tests_count++;
    }
}

Write-Host "Test 1: Empty input list" -ForegroundColor Blue;
$expected = @( - 1, - 1);
$result = findIndices  -list @() -target 10 @Enable_Debug;
verifyResults $expected $result;


Write-Host "Test 2: Two elements in input add to target" -ForegroundColor Blue;
$expected = @(0, 1);
$result = findIndices -list $(1, 2) -target 3 @Enable_Debug;
verifyResults $expected $result;

Write-Host "Test 3: First and last of three add to target" -ForegroundColor Blue;
$expected = @(0, 2);
$result = findIndices -list @(1, 3, 6) -target 7 @Enable_Debug;
verifyResults $expected $result;


Write-Host "Test 4: Two middle of four add to target" -ForegroundColor Blue;
$expected = @(1, 2);
$result = findIndices -list @(1, 2, 3, 7) -target 5 @Enable_Debug;
verifyResults $expected $result;

Write-Host "Test 5: Last two elements of five add to target" -ForegroundColor Blue;
$expected = @(3, 4);
$result = findIndices -list @(0, 1, 3, 5, 7) -target 12 @Enable_Debug;
verifyResults $expected $result; 


Write-Host "Test 6: No two elements of five add to target" -ForegroundColor Blue;
$expected = @( - 1, - 1);
$result = findIndices -list @(1, 2, 3, 4, 5) -target 10 @Enable_Debug; 
verifyResults $expected $result;


Write-Host "`n============================================================";
Write-Host "Tests count: [$($script:Passed_tests_count +$script:Failed_tests_count)]" -ForegroundColor Blue;
Write-Host "Passed [$script:Passed_tests_count]" -ForegroundColor Green;
Write-Host "Failed [$script:Failed_tests_count]" -ForegroundColor Red;
