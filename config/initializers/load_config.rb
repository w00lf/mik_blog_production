APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
keys = IO.read(Rails.root.to_s + "/config/recaptcha_keys").split("\n") 
RCC_PUB, RCC_PRIV = keys[0], keys[1]