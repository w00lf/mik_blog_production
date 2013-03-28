APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
private_info = YAML.load_file("#{Rails.root}/config/private_info.yml")
APP_CONFIG['omniauth'] = private_info['omniauth']
APP_CONFIG['smtp'] = private_info['smtp']
RCC_PUB, RCC_PRIV = private_info['recaptcha_key']['publick'], private_info['recaptcha_key']['private']