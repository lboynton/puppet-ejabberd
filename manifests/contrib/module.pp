define ejabberd::contrib::module {
    require ejabberd::contrib
    exec { "compile-$name":
        cwd         => "/usr/local/src/ejabberd-modules/$name/",
        command     => "/usr/local/src/ejabberd-modules/$name/build.sh",
        creates     => "/usr/local/src/ejabberd-modules/$name/ebin/$name.beam",
        environment => 'HOME=/root',
        logoutput   => true,
    }
    file { "/usr/lib64/ejabberd/ebin/$name.beam":
        ensure  => present,
        source  => "/usr/local/src/ejabberd-modules/$name/ebin/$name.beam",
        require => Exec["compile-$name"],
    }
}
