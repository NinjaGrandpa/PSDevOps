function New-AzureWorkItem {
    [CmdletBinding()]
    param (
        # Required arguments
        [Parameter(Mandatory=$true)]
        [string]$Title,

        [ValidateSet('Bug', 'User Story')]
        [string]$Type = 'User Story',

        # Optional arguments
        [string]$Area,

        [Alias('AssignedTo')]
        [string]$Assigned_To,

        [Alias('d')]
        [string]$Description,

        [ValidateSet('true', 'false')]
        [string]$Detect,

        [string]$Discussion,

        [Alias('f')]
        [string[]]$Fields,

        [string]$Iteration,

        [switch]$Open,

        [Alias('Organization')]
        [string]$Org,

        [Alias('p')]
        [string]$Project,

        [string]$Reason,

        # Global arguments
        [Alias('o')]
        [ValidateSet('json', 'jsonc', 'none', 'table', 'tsv', 'yaml', 'yamlc')]
        [string]$Output,

        [Alias('h')]
        [switch]$Help,

        [string]$Query
    )



    # Base az command
    $args = @(
        '--title', $Title,
        '--type',  $Type
    )

    # Helper to conditionally add parameters
    function Add-Arg {
        param ($Name, $Value)

        if ($null -ne $Value -and $Value -ne '') {
            $args += @($Name, $Value)
        }
    }

    Add-Arg '--area'        $Area
    Add-Arg '--assigned-to' $Assigned_To
    Add-Arg '--description' $Description
    Add-Arg '--detect'       $Detect
    Add-Arg '--discussion'   $Discussion
    Add-Arg '--iteration'    $Iteration
    Add-Arg '--org'          $Org
    Add-Arg '--project'      $Project
    Add-Arg '--reason'       $Reason
    Add-Arg '--output'       $Output
    Add-Arg '--query'        $Query

    if ($Fields) {
        foreach ($field in $Fields) {
            $args += @('--fields', $field)
        }
    }

    if ($Open.IsPresent) {
        $args += '--open'
    }

    if ($Help) {
        $args += '--help'
    }

    # Execute the az CLI command
    az boards work-item create @args
}