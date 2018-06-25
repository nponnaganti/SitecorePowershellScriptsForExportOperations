$props = @{
	InfoTitle = "Export Checkbox Field Value of sitecore content items based on content item and by passing Checkbox Field ID"
	PageSize = 25
}
$myArray = @()
$items = Get-ChildItem -Language "en-US" –recurse -Path master:"/sitecore/content/Habitat/Home"
foreach ($item in $items) {
    if( $item.Fields["{683D7237-206A-488F-9DEE-4A4E41FB161D}"]){
        $checkboxFieldValue = $item.Fields["{683D7237-206A-488F-9DEE-4A4E41FB161D}"].Value;
    }
    else{
        $checkboxFieldValue = "checkbox doesn't exists for this Item"
    }
        $myObject = $null
					$myObject = New-Object System.Object
					$myObject | Add-Member -Type NoteProperty -Name DisplayName -Value $item.DisplayName.ToString()
					$myObject | Add-Member -Type NoteProperty -Name ItemPath -Value $item.ItemPath.ToString()
					$myObject | Add-Member -Type NoteProperty -Name CheckboxFieldValue -Value $checkboxFieldValue.ToString()
					$myArray += $myObject
}
$myArray | Show-ListView @props -Property @{ Label = "DisplayName"; Expression = { $_.DisplayName } },
@{ Label = "CheckboxFieldValue"; Expression = { $_.CheckboxFieldValue } },
@{ Label = "ItemPath"; Expression = { $_.ItemPath } }
Close-Window 