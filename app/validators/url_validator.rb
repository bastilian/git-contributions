# URL Validator from https://coderwall.com/p/ztig5g/validate-urls-in-rails and modified
class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || 'must be a valid URL') unless url_valid?(value)
  end

  def parse(url)
    URI.parse(url)
  rescue
    false
  end

  def url_valid?(url)
    url = parse(url)
    url.is_a?(URI::HTTP) || url.is_a?(URI::HTTPS)
  end
end
