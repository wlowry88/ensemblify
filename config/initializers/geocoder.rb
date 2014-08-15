Geocoder.configure(
  # geocoding options
  # :timeout      => 3,           # geocoding service timeout (secs)
  :lookup       => :yahoo,     # name of geocoding service (symbol)
  # :language     => :en,         # ISO-639 language code
  # :use_https    => false,       # use HTTPS for lookup requests? (if supported)
  # :http_proxy   => nil,         # HTTP proxy server (user:pass@host:port)
  # :https_proxy  => nil,         # HTTPS proxy server (user:pass@host:port)
  # :api_key      => 'AIzaSyAQrNc6DWu8JgYyF6uDYtEsuzjeXDscz-M'        # API key for geocoding service
  :api_key => ["dj0yJmk9c1pUeDlBdTRzVkl0JmQ9WVdrOVdUVm5OelpZTXpZbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD0zNA--", "2aece11ebd9f9119ccb07bcf13e7fe0b35914f44"]
  # :cache        => nil,         # cache object (must respond to #[], #[]=, and #keys)
  # :cache_prefix => "geocoder:", # prefix (string) to use for all cache keys

  # exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and TimeoutError
  # :always_raise => [],

  # calculation options
  # :units     => :mi,       # :km for kilometers or :mi for miles
  # :distances => :linear    # :spherical or :linear
)