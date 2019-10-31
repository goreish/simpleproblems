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
# To run this script, save all content in a file and give it a .ps1 extension
# Open PowerShell Command prompt and type the file name (with relative path)
# Change the input values set at the bottom and run to test different values
# If want to see it run step by step open in PowerShell Editor (powershell_ise.exe)
# Add a break point and run in start debugging. 

function findIndicies()
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

    Write-Debug "Finding indicies of values in array list[$($list)] that adds up to [$target]";

    # Create the result array with default values 
    $indices = @(-1, -1);

    # Loop over each value in given list of integers
    for ($index = 0; $index -lt $list.length; $index++)
    {
        Write-Debug "Trying list[$index] ($($list[$index]))";

        # Get the index of difference value if it exists or -1
        $otherIndex = $list.IndexOf($target - $list[$index]);
        if ($otherIndex -ne -1)
        {
            Write-Debug "list[$index] + list[$otherIndex] = $($list[$index]) + $($list[$otherIndex]) = $target";
            # Assign indicies to result and break out of loop
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
findIndicies -list $inputList -target $requireTarget -debug

