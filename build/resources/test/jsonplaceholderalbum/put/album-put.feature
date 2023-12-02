Feature: Put album on jsonplaceholder

  Scenario: Edit a album
    Given url "https://jsonplaceholder.typicode.com" + "/albums/1/" + "photos"
    When method put
    And request {"albumId": 1,"id": 200,"title": "accusamus beatae ad facilis cum similique qui sunt","url": "https://via.placeholder.com/600/92c952","thumbnailUrl": "https://via.placeholder.com/150/92c952"},
    Then status 404
    And eval karate.log('Response Time:', responseTime) && responseTime < 2000
    And eval karate.log('Host:', responseHeaders.Host) && responseHeaders.Host.contains('jsonplaceholder.typicode.com')
    And eval karate.log('Pragma:', responseHeaders.Pragma) && responseHeaders.Pragma.contains('no-cache')
    And eval karate.log('Server:', responseHeaders.Server) && responseHeaders.Server.contains('cloudflare')