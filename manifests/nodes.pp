node 'default' {
    class { 'datadog_agent':
        api_key            => hiera('datadog_api_key'),
        puppet_run_reports => true
    }
    class { 'datadog_checks::http_response' :}
    datadog_checks::http_response::url { 'heise':
      url         => 'http://www.heise.de',
      status_code => '400'
    }
    datadog_checks::http_response::url { 'google':
      url         => 'http://www.gogole.de',
    }
}
