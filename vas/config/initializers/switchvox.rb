yaml_config = YAML.load_file("#{RAILS_ROOT}/config/switchvox.yml") || {}
CONFIG = (yaml_config['default'] || {}).symbolize_keys.merge((yaml_config[RAILS_ENV] || {}).symbolize_keys)
