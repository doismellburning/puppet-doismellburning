class doismellburning::roles::xbmc (
  $domain = $::fqdn,
) {

  include nginx

  $upstream = 'xbmc'

  nginx::resource::upstream {
    "$upstream":
      members => [
        'localhost:8080',
      ],
  }

  nginx::resource::vhost {
    "$domain":
      proxy => "http://${upstream}",
  }
}
