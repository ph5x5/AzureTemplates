Configuration IIS
{
	Node learning4-vm {
		WindowsFeature IIS {
			Ensure = "Present"
			Name = "Web-Server"
		}
	}
}