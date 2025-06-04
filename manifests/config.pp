#

class orchestrator::config inherits orchestrator {

  # Create a merged together set of options.  Rightmost hashes win over left. Requires stdlib
  $options = merge($orchestrator::config_defaults, $orchestrator::config_override)

  file { $orchestrator::config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => to_json_pretty($options),
  }

}
