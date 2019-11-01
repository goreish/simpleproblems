# Created by: Gaafer Goreish
# Date: 2019-10-31 
# Solving the following problem using PowerShell
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# Example:
# Given nums = [2, 7, 11, 15], target = 9,
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].
# 
# To run this script, you have multiple options
# As an executable PowerShell script: 
#       Save all content in a file and give it a .ps1 extension
#       Open PowerShell Command prompt and type the file name (with relative path)
#       Change the input values set at the bottom and run to test different values
#       If want to see it run step by step open in PowerShell Editor (powershell_ise.exe)
#       Add a break point and run in start debugging. 
#
# To run as a PowerShell function:
#       Copy/pase the contents of this file in the PowerShell Command prompt
#       To run function with different values just call with different parameters
#       e.g. findIndices  -list $inputList -target 10 -debug
# 
# Sample Output from: findIndices  -list @(1, 1, 2, 3, 5, 8, 13, 21) -target 5 -debug
# DEBUG: Finding indices  of values in array list[1 1 2 3 5 8 13 21] that adds up to [5]
# DEBUG: Trying list[0] (1)
# DEBUG: Trying list[1] (1)
# DEBUG: Trying list[2] (2)
# DEBUG: list[2] + list[3] = 2 + 3 = 5
# 2
# 3
#
function findIndices ()
{
    Param
    (
        [array] $list,
        [int] $target,
        [switch] $debug
    )

    # Turn on debugging if required
    if ($debug)
    {
        $DebugPreference = "Continue";
    }

    Write-Debug "Finding indices  of values in array list[$($list)] that adds up to [$target]";

    # Create the result array with default values 
    $indices = @(-1, -1);

    # Loop over each value in given list of integers
    for ($index = 0; $index -lt $list.length; $index++)
    {
        Write-Debug "Trying list[$index] ($($list[$index]))";

        # Get the index of difference value if it exists or -1
        $otherIndex = $list.IndexOf($target - $list[$index]);
        if ($otherIndex -ne -1 -and $otherIndex -ne $index)
        {
            Write-Debug "list[$index] + list[$otherIndex] = $($list[$index]) + $($list[$otherIndex]) = $target";
            # Assign indices  to result and break out of loop
            $indices = @($index, $otherIndex);
            break;  
        }
    }
    
    return $indices;
}

# Set input array to required values
$inputList = @(1, 1, 2, 3, 5, 8, 13, 21);

# Set required target value
$requireTarget = 13;

# Call function with required inputs
findIndices  -list $inputList -target $requireTarget -debug
