[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $CdnProfileName,

    [Parameter(Mandatory)]
    [string]
    $CdnEndpointName,

    [Parameter(Mandatory, HelpMessage='This is the storage endpoint URL.')]
    [string]
    $StaticWebsiteUrl,

    [Parameter()]
    [ValidateSet('Custom_Verizon','Premium_ChinaCdn','Premium_Verizon','StandardPlus_955BandWidth_ChinaCdn','StandardPlus_AvgBandWidth_ChinaCdn',`
        'StandardPlus_ChinaCdn','Standard_955BandWidth_ChinaCdn','Standard_Akamai','Standard_AvgBandWidth_ChinaCdn','Standard_ChinaCdn','Standard_Microsoft','Standard_Verizon')]
    [string]
    $CdnSku = 'Standard_Microsoft',

    [Parameter(Mandatory)]
    [string]
    $ResourceGroup,

    [Parameter(Mandatory)]
    [ValidateSet('global','australiaeast','australiasoutheast','brazilsouth','canadacentral','canadaeast','centralindia','centralus',`
        'eastasia','eastus','eastus2','japaneast','japanwest','northcentralus','northeurope','southcentralus','southindia','southeastasia',`
        'westeurope','westindia','westus','westcentralus')]
    [string]
    $Region
)

# Creates a CDN Profile which can be used to host multiple endpoints
az cdn profile create --name $CdnProfileName --resource-group $ResourceGroup --sku $CdnSku --location $Region

# Creates an endpoint using the storage account static website URL and disables HTTP protocol
az cdn endpoint create --resource-group $ResourceGroup --profile-name $CdnProfileName --name $CdnEndpointName --origin $StaticWebsiteUrl --origin-host-header $StaticWebsiteUrl --location $Region