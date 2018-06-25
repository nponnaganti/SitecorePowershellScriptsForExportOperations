#Export Checkbox Field Value of sitecore content items based on its TemplateName and by passing Checkbox Field ID
Get-Item master: -Language "en-us" -Query "/sitecore/content/Habitat/Home//*[@@templatename='TemplateNameGoesHere']" |
Show-ListView -Property `
                     @{Label="ItemName"; Expression={$_.DisplayName} }, 
                     @{Label="ItemPath"; Expression={$_.Paths.Path} }, 
                     @{Label="Checkbox Field Value"; Expression={$_.Fields["{683D7237-206A-488F-9DEE-4A4E41FB161D}"].value} }