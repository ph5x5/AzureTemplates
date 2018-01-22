Configuration IIS
{
	WindowsFeature IIS {
		Ensure = "Present"
		Name = "Web-Server"
	}
}