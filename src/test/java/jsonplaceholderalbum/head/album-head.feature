Feature: Head album on jsonplaceholder

  Scenario: Get headers (HEAD)
    Given url "https://jsonplaceholder.typicode.com" + "/albums/1/" + "photos"
    When method head
    Then status 200
    And eval karate.log('Expires:', responseHeaders.Expires) && responseHeaders.Expires.contains('-1')
    And eval karate.log('Response Time:', responseTime) && responseTime < 2000
    And eval karate.log('Host:', responseHeaders.Host) && responseHeaders.Host.contains('jsonplaceholder.typicode.com')
    And eval karate.log('Location:', responseHeaders.Location) && responseHeaders.Location.contains('https://jsonplaceholder.typicode.com/albums/1/photos/5001')