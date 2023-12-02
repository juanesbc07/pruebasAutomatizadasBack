Feature: Delete album on jsonplaceholder

  Scenario: Delete a user
    Given url "https://jsonplaceholder.typicode.com" + "/albums/1/" + "photos"
    When method delete
    Then status 404
    And eval karate.log('Response Time:', responseTime) && responseTime < 2000
    And eval karate.log('Connected successfully')
    And eval karate.log('Server:', responseHeaders.Server) && responseHeaders.Server.contains('cloudflare')
    And eval karate.log('Connection:', responseHeaders.Connection) && responseHeaders.Connection.contains('application/json')