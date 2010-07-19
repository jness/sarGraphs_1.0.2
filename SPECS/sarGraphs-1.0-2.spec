Summary: Rackspace sarGraphs
Name: sarGraphs
Version: 1.0
Release: 2
License: GPL
Group: application
Source0: %{name}-%{version}-%{release}.tar
BuildArch: noarch
Requires: gnuplot httpd sysstat php

%description
Simple application that generates graphs from SAR reports

%prep
%setup -q

%build

 %__tar -C /opt -xf $RPM_SOURCE_DIR/%{name}-%{version}-%{release}.tar

%install

 echo "#10 * * * * root /opt/%{name}-%{version}/cron.sh 2>&1" > /etc/cron.d/sarGraphs
 echo "#Alias /sarGraphs /opt/%{name}-%{version}" > /etc/httpd/conf.d/sarGraphs.conf
 echo "#<Directory /opt/%{name}-%{version}>
  #AllowOverride All
#</Directory>" >> /etc/httpd/conf.d/sarGraphs.conf

od -An -N2 -i /dev/random | awk '{print "<?php \n $password=\""$1"\";" "\n?>"}' > /opt/%{name}-%{version}/password_file.php

%files

/opt/%{name}-%{version}/

/etc/cron.d/sarGraphs
/etc/httpd/conf.d/sarGraphs.conf

