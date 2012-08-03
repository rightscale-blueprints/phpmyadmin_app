maintainer       "Chris Fordham"
maintainer_email "chris@xhost.com.au"
license          "Apache 2.0"
description      "Installs/Configures system elements such as the hostname and timezone."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{ ubuntu debian centos fedora redhat archlinux }.each do |os|
  supports os
end

depends "cron"

recipe "system::default", "Set the system hostname and timezone."
recipe "system::timezone", "Sets the system timezone."
recipe "system::hostname", "Sets the system hostname."

attribute "system/timezone",
  :display_name => "Timezone",
  :description => "Sets the system time to the timezone of the specified input, which must be a valid zoneinfo/tz database entry.  If the input is 'unset' the timezone will use the 'localtime' that's defined in your RightScale account under Settings -> User -> Preferences tab.  You can find a list of valid examples from the timezone pulldown bar in the Preferences tab. The server will not be updated for daylight savings time.  Ex: US/Pacific, US/Eastern",
  :required => "optional",
  :choice => [ "Africa/Casablanca",
  "America/Bogota",
  "America/Buenos_Aires",
  "America/Caracas",
  "America/La_Paz",
  "America/Lima",
  "America/Mexico_City",
  "Asia/Almaty",
  "Asia/Baghdad",
  "Asia/Baku",
  "Asia/Bangkok",
  "Asia/Calcutta",
  "Asia/Colombo",
  "Asia/Dhaka",
  "Asia/Hong_Kong",
  "Asia/Jakarta",
  "Asia/Kabul",
  "Asia/Kamchatka",
  "Asia/Karachi",
  "Asia/Kathmandu",
  "Asia/Magadan",
  "Asia/Muscat",
  "Asia/Riyadh",
  "Asia/Seoul",
  "Asia/Singapore",
  "Asia/Tashkent",
  "Asia/Tbilisi",
  "Asia/Tehran",
  "Asia/Tokyo",
  "Asia/Vladivostok",
  "Asia/Yakutsk",
  "Asia/Yekaterinburg",
  "Atlantic/Azores",
  "Atlantic/Cape_Verde",
  "Australia/Adelaide",
  "Australia/Darwin",
  "Australia/Perth",
  "Australia/Sydney",
  "Brazil/Acre",
  "Brazil/DeNoronha",
  "Brazil/East",
  "Brazil/West",
  "Canada/Atlantic",
  "Canada/Newfoundland",
  "Europe/Brussels",
  "Europe/Copenhagen",
  "Europe/Kaliningrad",
  "Europe/Lisbon",
  "Europe/London",
  "Europe/Helsinki",
  "Europe/Madrid",
  "Europe/Moscow",
  "Europe/Paris",
  "Pacific/Auckland",
  "Pacific/Fiji",
  "Pacific/Guam",
  "Pacific/Kwajalein",
  "Pacific/Midway",
  "US/Alaska",
  "US/Central",
  "US/Eastern",
  "US/Hawaii",
  "US/Mountain",
  "US/Pacific",
  "US/Samoa",
  "GMT",
  "UTC",
  "localtime" ],
  :default => "UTC",
  :recipes => [ "system::timezone", "system::default" ]

attribute "system/short_hostname",
  :display_name => "Short Hostname",
  :description => "The short hostname that you would like this node to have, e.g. kryten",
  :required => "recommended",
  :default => "localhost",
  :recipes => [ "system::hostname", "system::default" ]

attribute "system/domain_name",
  :display_name => "Domain Name",
  :description => "The domain name that you would like this node to have, e.g. domain.suf. Note: Only set a valid domain name to satisfy the resolution of a FQDN; use ignore:ignore for no domain name.",
  :required => "recommended",
  :default => "localdomain",
  :recipes => [ "system::hostname", "system::default" ]