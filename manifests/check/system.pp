define monit::check::system(
  $ensure,
  $check_name,
  $group,
  $priority,
  $alert,
  $tests
) {

  $filename = "${monit::conf_dir}/${priority}_${group}"
  $content = template('monit/check/system.erb')

  monit::check::instance { "${name}_instance":
    ensure  => $ensure,
    file    => $filename,
    content => $content,
  }
}