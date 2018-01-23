Configuration InstallIIS
{
	param (
		[string]$machineName,
		[int]$bindPort
	)
	
	Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
	Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
	Install-Module -Name xWebAdministration,xNetworking
	Import-DSCResource -ModuleName PSDesiredStateConfiguration,xWebAdministration,xNetworking
	
	Node $machineName {
		WindowsFeature IIS {
			Ensure = "Present"
			Name = "Web-Server"
		}
		WindowsFeature IISConsole {
			Ensure = "Present"
			Name = "Web-Mgmt-Console"
		}
		
		xWebsite DefaultSite {
			Ensure = "Present"
			Name = "Default Web Site"
			State = "Started"
			PhysicalPath = "C:\inetpub\wwwroot"
			DependsOn = "[WindowsFeature]IIS"
			BindingInfo = MSFT_xWebBindingInformation {
				Protocol = "HTTP"
				Port = $bindPort
			}
		}
		
		xFirewall Firewall
		{
			Name = "IIS $bindPort Rule"
			DisplayName = "IIS $bindPort Rule"
			Ensure = "Present"
			Profile = ("Domain", "Private", "Public")
			Direction = "Inbound"
			LocalPort = "$bindPort"
			Protocol = "TCP"
			Description = "IIS $bindPort Rule"
		}
	}
}