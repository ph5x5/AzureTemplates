Configuration InstallIIS
{
	param (
		[string]$machineName,
		[string]$bindPort
	)
	
	Import-DscResource -ModuleName PSDesiredStateConfiguration,xWebAdministration
	
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
	}
}