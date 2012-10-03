class remi($extras = 0) {
    yumrepo { 'remi':
        baseurl     => 'http://rpms.famillecollet.com/enterprise/$releasever/remi/$basearch/',
        mirrorlist  => 'http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror',
        enabled     => 1,
        gpgcheck    => 1,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        descr       => 'Les RPM de remi pour Enterprise Linux $releasever - $basearch'
    }
    
    yumrepo { 'remi-extras':
        baseurl     => 'http://rpms.famillecollet.com/enterprise/$releasever/test/$basearch/',
        mirrorlist  => 'http://rpms.famillecollet.com/enterprise/$releasever/test/mirror',
        enabled     => $extras,
        gpgcheck    => 1,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        descr       => 'Les RPM de remi en test pour Enterprise Linux $releasever - $basearch'
    }
    
    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-remi":
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "puppet:///modules/remi/RPM-GPG-KEY-remi",
    }
    
    epel::rpm_gpg_key{ "remi":
        path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-remi",
    }
}
